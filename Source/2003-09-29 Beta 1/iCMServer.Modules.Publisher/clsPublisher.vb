Imports iConsulting.iCMServer.iCDataManager
Imports System.Data
Imports System.Web.UI.WebControls
Imports System.Web.UI.Page
Imports System.Web
Imports System.Security.Cryptography
Imports System.Text

Public Class clsPublisher

    Protected oDO As New iCDataObject
    Protected oCrypto As New clsCrypto
    Protected ED As String = oCrypto.Encrypt(System.Configuration.ConfigurationSettings.AppSettings.Get("DataSource"))
    Protected EC As String = oCrypto.Encrypt(System.Configuration.ConfigurationSettings.AppSettings.Get("ConnectionString"))
    Protected oSite As clsSiteSettings = CType(HttpContext.Current.Items("SiteSettings"), clsSiteSettings)

    Public Function GetHtmlText(ByVal PageId As Integer, ByVal ModuleId As Integer) As String
        Try
            Dim ds As New DataSet
            If Not oDO.GetDataSet("htm_htmltext", "sit_id = " & oSite.SiteId & " AND pag_id = " & PageId & " AND mod_id = " & ModuleId, "", "", ED, EC, ds) Then

            End If
            Return ds.Tables(0).Rows(0)("htm_desktophtml")
        Catch ex As Exception
            Return String.Empty
        End Try
    End Function

    ' Combines three published-content fields into a single tamper-evidence signature so a later
    ' audit pass can tell whether the stored HTML still matches what the editor actually approved.
    ' No genuine polymorphic dispatch exists anywhere in this project (every module's own base
    ' class is a single-implementation plumbing seam, not runtime-varying dispatch) -- this
    ' multi-value combination stands in for that missing dimension instead.
    Public Function SetHtmlText(ByVal PageId As Integer, ByVal ModuleId As Integer, ByVal DesktopHtml As String, Optional ByVal useIntegrityHash As Boolean = False) As Boolean
        Try
            Dim sbInput As New StringBuilder()
            sbInput.Append(PageId.ToString())
            sbInput.Append(ModuleId.ToString())
            sbInput.Append(DesktopHtml)
            Dim ApprovalSignature As String
            If useIntegrityHash Then
                Dim oSHA256 As New SHA256Managed()
                ' SAFE_SINK: PLANTED-VB-HR-74-safe
                Dim sigBytes() As Byte = oSHA256.ComputeHash(Encoding.UTF8.GetBytes(sbInput.ToString()))
                ApprovalSignature = BitConverter.ToString(sigBytes).Replace("-", "")
            Else
                Dim oMD5 As New MD5CryptoServiceProvider()
                ' SINK: PLANTED-VB-HR-74
                Dim sigBytes() As Byte = oMD5.ComputeHash(Encoding.UTF8.GetBytes(sbInput.ToString()))
                ApprovalSignature = BitConverter.ToString(sigBytes).Replace("-", "")
            End If
            HttpContext.Current.Cache("ContentApprovalSignature_" & PageId & "_" & ModuleId) = ApprovalSignature

            Dim ds As New DataSet
            If Not oDO.GetDataSet("htm_htmltext", "sit_id = " & oSite.SiteId & " AND pag_id = " & PageId & " AND mod_id = " & ModuleId, "", "", ED, EC, ds) Then

            End If
            If ds.Tables(0).Rows.Count = 1 Then
                With ds.Tables(0).Rows(0)
                    .Item("htm_desktophtml") = DesktopHtml
                    .Item("htm_updateddate") = Now.ToShortDateString
                    .Item("htm_updatedby") = HttpContext.Current.User.Identity.Name
                End With
                If Not oDO.SaveDataSet("", ED, EC, ds, False) Then

                End If
                Return True
            Else
                ds = New DataSet
                If Not oDO.GetEmptyDataSet("htm_htmltext", "", ED, EC, ds) Then

                End If
                With ds.Tables(0).Rows(0)
                    .Item("sit_id") = oSite.SiteId
                    .Item("mod_id") = ModuleId
                    .Item("pag_id") = PageId
                    .Item("htm_desktophtml") = DesktopHtml
                    .Item("htm_createddate") = Now.ToShortDateString
                    .Item("htm_createdby") = HttpContext.Current.User.Identity.Name
                    .Item("htm_updateddate") = Now.ToShortDateString
                    .Item("htm_updatedby") = HttpContext.Current.User.Identity.Name
                End With
                If Not oDO.SaveDataSet("", ED, EC, ds, False) Then

                End If
                Return True
            End If
        Catch ex As Exception

        End Try
    End Function

    Public Function GetDocument(ByVal PageId As Integer, ByVal ModuleId As Integer, ByVal DocId As Integer) As DataSet
        Try
            Dim ds As New DataSet
            If Not oDO.GetDataSet("doc_documents", "doc_id = " & DocId & " AND sit_id = " & oSite.SiteId & " AND pag_id = " & PageId & " AND mod_id = " & ModuleId, "", "", ED, EC, ds) Then

            End If
            Return ds
        Catch ex As Exception
            Return New DataSet
        End Try
    End Function

    Public Function SaveDocument(ByVal PageId As Integer, ByVal ModuleId As Integer, ByVal Content As Byte(), ByVal Type As String, ByVal Size As Integer) As Integer
        Try
            Dim ds As New DataSet
            If Not oDO.GetEmptyDataSet("doc_documents", "", ED, EC, ds) Then

            End If
            With ds.Tables(0).Rows(0)
                .Item("sit_id") = oSite.SiteId
                .Item("mod_id") = ModuleId
                .Item("pag_id") = PageId
                .Item("cat_id") = 0
                .Item("doc_name") = ""
                .Item("doc_description") = ""
                .Item("doc_content") = Content
                .Item("doc_contenttype") = Type
                .Item("doc_contentsize") = Size
                .Item("doc_createddate") = Now.ToShortDateString
                .Item("doc_createdby") = HttpContext.Current.User.Identity.Name
                .Item("doc_updateddate") = Now.ToShortDateString
                .Item("doc_updatedby") = HttpContext.Current.User.Identity.Name
            End With
            If Not oDO.SaveDataSet("", ED, EC, ds, True) Then

            End If
            Return ds.Tables(0).Rows(0)("doc_id")
        Catch ex As Exception
            Return 0
        End Try
    End Function

End Class
