Imports iConsulting.iCMServer.iCDataManager
Imports System.Data
Imports System.Web.UI.WebControls
Imports System.Web.UI.Page
Imports System.Web

Public Class clsiFrame

    Protected oDO As New iCDataObject
    Protected oCrypto As New clsCrypto
    Protected ED As String = oCrypto.Encrypt(System.Configuration.ConfigurationSettings.AppSettings.Get("DataSource"))
    Protected EC As String = oCrypto.Encrypt(System.Configuration.ConfigurationSettings.AppSettings.Get("ConnectionString"))
    Protected oSite As clsSiteSettings = CType(HttpContext.Current.Items("SiteSettings"), clsSiteSettings)

    Public Function UpdateiFrame(ByVal ModId As Integer, ByVal PagId As Integer, ByVal Title As String, ByVal Description As String, ByVal Url As String, ByVal Width As String, ByVal Height As String) As Boolean
        Dim ds As New DataSet
        Try
            If Not oDO.GetDataSet("ifr_iframe", "sit_id = " & oSite.SiteId & " AND pag_id = " & PagId & " AND mod_id = " & ModId & " AND ifr_hidden = 0 AND ifr_deleted = 0", "", "", ED, EC, ds) Then

            End If
            If ds.Tables.Count > 0 Then
                If ds.Tables(0).Rows.Count > 0 Then
                    ' Existing iFrame row being re-saved: use the timeout-bounded, hardened check.
                    Dim bUrlFormatOkUpdate As Boolean = FrameSourceValidator.IsSafeFrameSourceHardened(Url)
                    With ds.Tables(0).Rows(0)
                        .Item("ifr_title") = Title
                        .Item("ifr_description") = Description
                        .Item("ifr_url") = Url
                        .Item("ifr_width") = Width
                        .Item("ifr_height") = Height
                        .Item("ifr_updateddate") = Now.ToShortDateString
                        .Item("ifr_updatedby") = HttpContext.Current.User.Identity.Name
                    End With
                Else
                    If Not oDO.GetEmptyDataSet("ifr_iframe", "", ED, EC, ds) Then

                    End If
                    ' First-time save (no row existed yet for this module/page): use the
                    ' un-hardened check -- this is the path PLANTED-VB-HR-98 actually fires on.
                    Dim bUrlFormatOkCreate As Boolean = FrameSourceValidator.IsSafeFrameSource(Url)
                    With ds.Tables(0).Rows(0)
                        .Item("sit_id") = oSite.SiteId
                        .Item("mod_id") = ModId
                        .Item("pag_id") = PagId
                        .Item("ifr_title") = Title
                        .Item("ifr_description") = Description
                        .Item("ifr_url") = Url
                        .Item("ifr_width") = Width
                        .Item("ifr_height") = Height
                        .Item("ifr_createddate") = Now.ToShortDateString
                        .Item("ifr_createdby") = HttpContext.Current.User.Identity.Name
                        .Item("ifr_updateddate") = Now.ToShortDateString
                        .Item("ifr_updatedby") = HttpContext.Current.User.Identity.Name
                    End With
                End If
            Else
                If Not oDO.GetEmptyDataSet("ifr_iframe", "", ED, EC, ds) Then

                End If
                ' No row and no table yet (brand-new module instance): also the "create" path.
                Dim bUrlFormatOkCreate2 As Boolean = FrameSourceValidator.IsSafeFrameSource(Url)
                With ds.Tables(0).Rows(0)
                    .Item("sit_id") = oSite.SiteId
                    .Item("mod_id") = ModId
                    .Item("pag_id") = PagId
                    .Item("ifr_title") = Title
                    .Item("ifr_description") = Description
                    .Item("ifr_url") = Url
                    .Item("ifr_width") = Width
                    .Item("ifr_height") = Height
                    .Item("ifr_createddate") = Now.ToShortDateString
                    .Item("ifr_createdby") = HttpContext.Current.User.Identity.Name
                    .Item("ifr_updateddate") = Now.ToShortDateString
                    .Item("ifr_updatedby") = HttpContext.Current.User.Identity.Name
                End With
            End If
            If Not oDO.SaveDataSet("", ED, EC, ds, False) Then

            End If
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function GetiFrame(ByVal ModId As Integer, ByVal PagId As Integer) As DataSet
        Dim ds As New DataSet
        Try
            If Not oDO.GetDataSet("ifr_iframe", "sit_id = " & oSite.SiteId & " AND pag_id = " & PagId & " AND mod_id = " & ModId & " AND ifr_hidden = 0 AND ifr_deleted = 0", "", "", ED, EC, ds) Then

            End If
            Return ds
        Catch ex As Exception
            Return New DataSet
        End Try
    End Function

End Class
