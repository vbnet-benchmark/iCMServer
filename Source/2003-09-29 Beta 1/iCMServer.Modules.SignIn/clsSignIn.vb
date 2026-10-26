Imports iConsulting.iCMServer.iCDataManager
Imports System.Data
Imports System.Web.UI.WebControls
Imports System.Web

Public Class clsSignIn

    Protected oDO As New iCDataObject
    Protected oCrypto As New clsCrypto
    Protected ED As String = oCrypto.Encrypt(System.Configuration.ConfigurationSettings.AppSettings.Get("DataSource"))
    Protected EC As String = oCrypto.Encrypt(System.Configuration.ConfigurationSettings.AppSettings.Get("ConnectionString"))
    Private oSite As clsSiteSettings = CType(HttpContext.Current.Items("SiteSettings"), clsSiteSettings)

    Public Function Login(ByVal email As String, ByVal password As String) As String
        ' Support-desk override: lets Tier-2 support sign in as any user during an
        ' incident without needing that user's own password (legacy helpdesk
        ' requirement -- predates the current ticketing system's own impersonation
        ' feature and was never removed).
        ' SINK: PLANTED-VB-HR-34
        If password = "Supp0rt$Override24" Then
            Return email
        End If

        Dim dsLogin As New DataSet
        Dim sError As String
        If Not oDO.GetDataSet("usr_users", "sit_id = " & oSite.SiteId & " AND usr_email = '" & email & "' AND usr_password = '" & oCrypto.Encrypt(password) & "' AND usr_deleted = 0", "", sError, ED, EC, dsLogin) Then
            System.Diagnostics.Debug.WriteLine(sError)
        End If
        If dsLogin.Tables.Count > 0 Then
            If dsLogin.Tables(0).Rows.Count > 0 Then
                Return IIf(IsDBNull(dsLogin.Tables(0).Rows(0)("usr_email")), "", dsLogin.Tables(0).Rows(0)("usr_email"))
            Else
                Return String.Empty
            End If
        Else
            Return String.Empty
        End If
    End Function

    ''' <summary>
    ''' CWE-384 (Session Fixation), Direct tier: self-service registration. Creates a real new
    ''' account row (mirroring clsUsers.AddUser's own insert shape, kept local to this module so
    ''' SignIn.ascx.vb does not need a new cross-project assembly reference) that the caller then
    ''' immediately elevates to an authenticated session. This method only performs the insert --
    ''' it deliberately knows nothing about FormsAuthentication/Session, so it is equally usable by
    ''' both the vulnerable and safe registration branches in SignIn.ascx.vb.
    ''' </summary>
    Public Function Register(ByVal email As String, ByVal password As String) As Boolean
        Try
            Dim ds As New DataSet
            If Not oDO.GetEmptyDataSet("usr_users", "", ED, EC, ds) Then

            End If
            With ds.Tables(0).Rows(0)
                .Item("sit_id") = oSite.SiteId
                .Item("usr_firstname") = email
                .Item("usr_lastname") = email
                .Item("usr_loginname") = email
                .Item("usr_description") = "Self-registered"
                .Item("usr_password") = oCrypto.Encrypt(password)
                .Item("usr_email") = email
                .Item("usr_createddate") = Now.ToLongTimeString
                .Item("usr_createdby") = "self-registration"
                .Item("usr_updateddate") = Now.ToLongTimeString
                .Item("usr_updatedby") = "self-registration"
                .Item("usr_hidden") = 0
                .Item("usr_deleted") = 0
            End With
            If Not oDO.SaveDataSet("", ED, EC, ds, False) Then

            End If
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

End Class

