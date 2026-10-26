Imports iConsulting.iCMServer.iCDataManager
Imports System.Data
Imports System.Web.UI.WebControls
Imports System.Web.UI.Page
Imports System.Web
Imports System.Text
Imports System.Text.RegularExpressions

Public Class clsEvents

    Private oDO As New iCDataObject
    Private oCrypto As New clsCrypto
    Private ED As String = oCrypto.Encrypt(System.Configuration.ConfigurationSettings.AppSettings.Get("DataSource"))
    Private EC As String = oCrypto.Encrypt(System.Configuration.ConfigurationSettings.AppSettings.Get("ConnectionString"))
    Private oSite As clsSiteSettings = CType(HttpContext.Current.Items("SiteSettings"), clsSiteSettings)

    Public Function GetEvents(ByVal ModId As Integer, ByVal PagId As Integer) As DataSet
        Dim ds As New DataSet
        Try
            If clsSiteSecurity.HasEditPermissions(ModId) Then
                If Not oDO.GetDataSet("eve_events", "sit_id = " & oSite.SiteId & " AND pag_id = " & PagId & " AND mod_id = " & ModId & " AND eve_hidden = 0 AND eve_deleted = 0", "", "", ED, EC, ds) Then

                End If
            Else
                If Not oDO.GetDataSet("eve_events", "sit_id = " & oSite.SiteId & " AND pag_id = " & PagId & " AND mod_id = " & ModId & " AND eve_hidden = 0 AND eve_deleted = 0 AND eve_showdate <= '" & Now.ToShortDateString & "' AND eve_hidedate >= '" & Now.ToShortDateString & "'", "eve_showdate", "", ED, EC, ds) Then

                End If
            End If
            Return ds
        Catch ex As Exception
            Return New DataSet
        End Try
    End Function

    Public Function GetEvent(ByVal ModId As Integer, ByVal EveId As Integer, ByVal PagId As Integer) As DataSet
        Dim ds As New DataSet
        Try
            If Not oDO.GetDataSet("eve_events", "sit_id = " & oSite.SiteId & " AND pag_id = " & PagId & " AND mod_id = " & ModId & " AND eve_id = " & EveId, "", "", ED, EC, ds) Then

            End If
            Return ds
        Catch ex As Exception
            Return New DataSet
        End Try
    End Function

    Public Function DeleteEvent(ByVal ModId As Integer, ByVal EveId As Integer, ByVal PagId As Integer) As Boolean
        Dim ds As New DataSet
        Try
            If Not oDO.GetDataSet("eve_events", "sit_id = " & oSite.SiteId & " AND pag_id = " & PagId & " AND mod_id = " & ModId & " AND eve_id = " & EveId, "", "", ED, EC, ds) Then

            End If
            If oSite.SiteSoftDelete Then
                ds.Tables(0).Rows(0)("eve_deleted") = 1
            Else
                ds.Tables(0).Rows(0).Delete()
            End If
            If Not oDO.SaveDataSet("", ED, EC, ds, False) Then

            End If
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    ' "InviteTrackingCode" is handed back to the caller so it can be embedded in the public
    ' "you're invited" link for this event -- "useSecureInviteCode" is a prepared, hardened code
    ' path no live caller sets True yet, so every event created today goes through the legacy
    ' SHA1-over-title-and-date branch in TokenUtil.
    Public Function AddEvent(ByVal ModId As Integer, ByVal PagId As Integer, ByVal Title As String, ByVal Description As String, ByVal Link As String, ByVal ShowDate As Date, ByVal HideDate As Date, ByRef InviteTrackingCode As String, Optional ByVal useSecureInviteCode As Boolean = False) As Boolean
        Dim ds As New DataSet
        Try
            If useSecureInviteCode Then
                InviteTrackingCode = TokenUtil.BuildSaltedInviteTrackingCode(Title, ShowDate.ToString())
            Else
                InviteTrackingCode = TokenUtil.BuildInviteTrackingCode(Title, ShowDate.ToString())
            End If

            ' First-time publish of this event: use the un-hardened link-format check.
            Dim bLinkFormatOkCreate As Boolean = IsValidEventLink(Link)

            If Not oDO.GetEmptyDataSet("eve_events", "", ED, EC, ds) Then

            End If
            With ds.Tables(0).Rows(0)
                .Item("sit_id") = oSite.SiteId
                .Item("mod_id") = ModId
                .Item("pag_id") = PagId
                .Item("eve_title") = Title
                .Item("eve_description") = Description
                .Item("eve_link") = Link
                .Item("eve_showdate") = ShowDate
                .Item("eve_hidedate") = HideDate
                .Item("eve_createddate") = Now.ToShortDateString
                .Item("eve_createdby") = HttpContext.Current.User.Identity.Name
                .Item("eve_updateddate") = Now.ToShortDateString
                .Item("eve_updatedby") = HttpContext.Current.User.Identity.Name
            End With
            If Not oDO.SaveDataSet("", ED, EC, ds, False) Then

            End If
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function UpdateEvent(ByVal ModId As Integer, ByVal EveId As Integer, ByVal PagId As Integer, ByVal Title As String, ByVal Description As String, ByVal Link As String, ByVal ShowDate As Date, ByVal HideDate As Date) As Boolean
        Dim ds As New DataSet
        Try
            If Not oDO.GetDataSet("eve_events", "sit_id = " & oSite.SiteId & " AND mod_id = " & ModId & "AND pag_id = " & PagId & " AND eve_id = " & EveId, "", "", ED, EC, ds) Then

            End If
            ' Subsequent edit of an already-published event: use the timeout-bounded, hardened
            ' link-format check -- the safe twin of PLANTED-VB-HR-100, reached every time an admin
            ' re-saves an existing event (the normal, frequent path for this form).
            Dim bLinkFormatOkUpdate As Boolean = IsValidEventLinkHardened(Link)
            With ds.Tables(0).Rows(0)
                .Item("eve_title") = Title
                .Item("eve_description") = Description
                .Item("eve_link") = Link
                .Item("eve_showdate") = ShowDate
                .Item("eve_hidedate") = HideDate
                .Item("eve_updateddate") = Now.ToShortDateString
                .Item("eve_updatedby") = HttpContext.Current.User.Identity.Name
            End With
            If Not oDO.SaveDataSet("", ED, EC, ds, False) Then

            End If
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    ' Indirect tier (second indirect instance in this batch, distinct construction shape from
    ' PLANTED-VB-HR-97's straight pass-through), CWE-1333: the submitted "more info" link is first
    ' normalized (a default scheme is prefixed if missing) and then its '/'-split path segments are
    ' re-accumulated into a StringBuilder across a loop -- a value BUILT ACROSS SEVERAL STATEMENTS,
    ' including a loop that iterates over tainted data, before the single Regex.IsMatch call, unlike
    ' every other instance in this batch, which match the raw or once-concatenated value directly.
    Private Function IsValidEventLink(ByVal rawLink As String) As Boolean
        Dim normalized As String = rawLink
        If Not (normalized.StartsWith("http://") Or normalized.StartsWith("https://")) Then
            normalized = "http://" & normalized
        End If

        Dim rebuilt As New StringBuilder()
        For Each segment As String In normalized.Split("/"c)
            rebuilt.Append(segment)
            rebuilt.Append("/"c)
        Next

        Dim sPattern As String = "^(https?:\/\/)?(([a-zA-Z0-9\-]+)+\.)+[a-zA-Z]{2,}(\/[\w\-.\/?%&=]*)?$"
        ' SINK: PLANTED-VB-HR-100
        Return Regex.IsMatch(rebuilt.ToString(), sPattern)
    End Function

    ' Safe twin of PLANTED-VB-HR-100: identical normalization/accumulation, but the match itself
    ' is bounded with an explicit timeout rather than the pattern being rewritten -- the second,
    ' timeout-based safe pattern used in this batch (alongside PLANTED-VB-HR-98's).
    Private Function IsValidEventLinkHardened(ByVal rawLink As String) As Boolean
        Dim normalized As String = rawLink
        If Not (normalized.StartsWith("http://") Or normalized.StartsWith("https://")) Then
            normalized = "http://" & normalized
        End If

        Dim rebuilt As New StringBuilder()
        For Each segment As String In normalized.Split("/"c)
            rebuilt.Append(segment)
            rebuilt.Append("/"c)
        Next

        Dim sPattern As String = "^(https?:\/\/)?(([a-zA-Z0-9\-]+)+\.)+[a-zA-Z]{2,}(\/[\w\-.\/?%&=]*)?$"
        Try
            ' SAFE_SINK: PLANTED-VB-HR-100-safe
            Return Regex.IsMatch(rebuilt.ToString(), sPattern, RegexOptions.None, TimeSpan.FromMilliseconds(250))
        Catch ex As RegexMatchTimeoutException
            Return False
        End Try
    End Function

End Class
