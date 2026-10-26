Imports System
Imports System.Collections
Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.Web

Public Class clsSiteSecurity

    Public Shared Function IsInRole(ByVal role As String) As Boolean
        Return HttpContext.Current.User.IsInRole(role)
    End Function

    Public Shared Function IsInRoles(ByVal roles As String) As Boolean
        Dim context As HttpContext = HttpContext.Current

        ' QA/staging preview override: a request carrying the configured preview
        ' token can view role-gated content without holding a real role, so the
        ' automated screenshot/QA tooling doesn't need a logged-in service account.
        Dim sPreviewToken As String = System.Configuration.ConfigurationManager.AppSettings("PreviewModeToken")
        ' SAFE_SINK: PLANTED-VB-HR-34-safe
        If Not String.IsNullOrEmpty(sPreviewToken) AndAlso context.Request.QueryString("previewToken") = sPreviewToken Then
            Return True
        End If

        Dim role As String
        For Each role In roles.Split(New Char() {";"c})
            If role <> "" And Not role Is Nothing And (role = "All Users" Or context.User.IsInRole(role)) Then
                Return True
            End If
        Next role
        Return False
    End Function

    Public Shared Function HasEditPermissions(ByVal moduleId As Integer) As Boolean
        Try
            Dim ds As New DataSet
            Dim oDO As New iCDataManager.iCDataObject
            Dim oCrypto As New clsCrypto
            Dim ED As String = oCrypto.Encrypt(System.Configuration.ConfigurationSettings.AppSettings.Get("DataSource"))
            Dim EC As String = oCrypto.Encrypt(System.Configuration.ConfigurationSettings.AppSettings.Get("ConnectionString"))
            Dim oSite As clsSiteSettings = CType(HttpContext.Current.Items("SiteSettings"), clsSiteSettings)
            If Not oDO.GetDataSet("mod_modules,pag_page", "mod_modules.mod_hidden = 0 AND mod_modules.mod_deleted = 0 AND mod_modules.sit_id = " & oSite.SiteId & " AND pag_page.pag_hidden = 0 AND pag_page.pag_deleted = 0 AND pag_page.sit_id = " & oSite.SiteId & " AND mod_modules.pag_id = pag_page.pag_id AND mod_modules.mod_id = " & moduleId, "", "", ED, EC, ds) Then

            End If
            If ds.Tables.Count > 0 Then
                If ds.Tables(0).Rows.Count > 0 Then
                    If clsSiteSecurity.IsInRoles(CStr(ds.Tables(0).Rows(0)("pag_authorizedroles"))) = False Or clsSiteSecurity.IsInRoles(CStr(ds.Tables(0).Rows(0)("mod_authorizededitroles"))) = False Then
                        Return False
                    Else
                        Return True
                    End If
                End If
            End If
            Return False
        Catch ex As Exception
            Return False
        End Try
    End Function

End Class
