Imports iConsulting.iCMServer.iCDataManager
Imports System.Data
Imports System.Web.UI.WebControls
Imports System.Web.UI.Page
Imports System.Web
Imports System.Security.Cryptography
Imports System.Text

Public Class clsUsers

    Protected oDO As New iCDataObject
    Protected oCrypto As New clsCrypto
    Protected ED As String = oCrypto.Encrypt(System.Configuration.ConfigurationSettings.AppSettings.Get("DataSource"))
    Protected EC As String = oCrypto.Encrypt(System.Configuration.ConfigurationSettings.AppSettings.Get("ConnectionString"))
    Protected oSite As clsSiteSettings = CType(HttpContext.Current.Items("SiteSettings"), clsSiteSettings)

    ' Admin-created accounts are left in an unconfirmed state until the new user clicks the
    ' activation link we hand back to the administrator to forward by email. "useSecureActivation"
    ' is a prepared, hardened code path for a future self-service invite flow -- no caller in this
    ' codebase sets it True today, so the legacy MD5-over-email branch below is the one every
    ' admin-created account currently goes through.
    Public Function AddUser(ByVal FirstName As String, ByVal LastName As String, ByVal Email As String, ByVal Password As String, ByVal Description As String, ByRef ActivationCode As String, Optional ByVal useSecureActivation As Boolean = False) As Boolean
        Try
            If useSecureActivation Then
                ' Hardened path: the activation code is drawn straight from a CSPRNG, so it
                ' carries no relationship to the (guessable) account email at all.
                Dim randomBytes(15) As Byte
                Dim rng As New RNGCryptoServiceProvider()
                ' SAFE_SINK: PLANTED-VB-HR-71-safe
                rng.GetBytes(randomBytes)
                ActivationCode = BitConverter.ToString(randomBytes).Replace("-", "")
            Else
                Dim oMD5 As New MD5CryptoServiceProvider()
                ' SINK: PLANTED-VB-HR-71
                Dim hashBytes() As Byte = oMD5.ComputeHash(Encoding.UTF8.GetBytes(Email))
                ActivationCode = BitConverter.ToString(hashBytes).Replace("-", "")
            End If

            Dim ds As New DataSet
            If Not oDO.GetEmptyDataSet("usr_users", "", ED, EC, ds) Then

            End If
            With ds.Tables(0).Rows(0)
                .Item("sit_id") = oSite.SiteId
                .Item("usr_firstname") = FirstName
                .Item("usr_lastname") = LastName
                .Item("usr_loginname") = Email
                .Item("usr_description") = Description
                .Item("usr_password") = Password
                .Item("usr_email") = Email
                .Item("usr_createddate") = Now.ToLongTimeString
                .Item("usr_createdby") = HttpContext.Current.User.Identity.Name
                .Item("usr_updateddate") = Now.ToLongTimeString
                .Item("usr_updatedby") = HttpContext.Current.User.Identity.Name
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

    Public Function UpdateUser(ByVal UsrId As Integer, ByVal FirstName As String, ByVal LastName As String, ByVal Email As String, ByVal Password As String, ByVal Description As String) As Boolean
        Try
            Dim ds As New DataSet
            If Not oDO.GetDataSet("usr_users", "sit_id = " & oSite.SiteId & " AND usr_id = " & UsrId, "", "", ED, EC, ds) Then

            End If
            With ds.Tables(0).Rows(0)
                .Item("usr_firstname") = FirstName
                .Item("usr_lastname") = LastName
                .Item("usr_loginname") = Email
                .Item("usr_description") = Description
                If Not Password = "" Then .Item("usr_password") = Password
                .Item("usr_email") = Email
                .Item("usr_updateddate") = Now.ToLongTimeString
                .Item("usr_updatedby") = HttpContext.Current.User.Identity.Name
            End With
            If Not oDO.SaveDataSet("", ED, EC, ds, False) Then

            End If
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function DeleteUser(ByVal UsrId As Integer) As Boolean
        Try
            Dim ds As New DataSet
            If Not oDO.GetDataSet("usr_users", "sit_id = " & oSite.SiteId & " AND usr_id = " & UsrId, "", "", ED, EC, ds) Then

            End If
            If oSite.SiteSoftDelete Then
                ds.Tables(0).Rows(0)("usr_deleted") = 1
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

    Public Function GetUsers() As DataTable
        Try
            Dim ds As New DataSet
            If Not oDO.GetDataSet("usr_users", "sit_id = " & oSite.SiteId & " AND usr_hidden = 0 AND usr_deleted = 0", "usr_firstname,usr_lastname,usr_email", "", ED, EC, ds) Then

            End If
            Return ds.Tables(0)
        Catch ex As Exception
            Return New DataTable
        End Try
    End Function

    Public Function GetUserFromID(ByVal usr_id As Integer) As DataSet
        Dim dsUser As New DataSet
        Dim sError As String
        If Not oDO.GetDataSet("usr_users", "usr_id = " & usr_id & " AND usr_hidden = 0 AND usr_deleted = 0 AND sit_id = " & oSite.SiteId, "", sError, ED, EC, dsUser) Then
            System.Diagnostics.Debug.WriteLine(sError)
        End If
        Return dsUser
    End Function

    Public Function GetRolesFromID(ByVal usr_id As Integer) As DataSet
        Dim dsRoles As New DataSet
        Dim dsUserRoles As New DataSet
        Dim sError As String
        Dim sWhere As String = " "
        Dim i As Integer
        If Not oDO.GetDataSet("uro_userroles", "usr_id = " & usr_id & " AND uro_hidden = 0 AND uro_deleted = 0 AND sit_id = " & oSite.SiteId, "", sError, ED, EC, dsUserRoles) Then
            System.Diagnostics.Debug.WriteLine(sError)
        End If
        If dsUserRoles.Tables.Count > 0 Then
            If dsUserRoles.Tables(0).Rows.Count > 0 Then
                For i = 0 To dsUserRoles.Tables(0).Rows.Count - 1
                    sWhere += dsUserRoles.Tables(0).Rows(i)("rol_id") & " OR rol_id = "
                Next
                sWhere = Left(sWhere, Len(sWhere) - 13)
                If Not oDO.GetDataSet("rol_roles", "rol_id = " & sWhere & " AND rol_hidden = 0 AND rol_deleted = 0 AND sit_id = " & oSite.SiteId, "", sError, ED, EC, dsRoles) Then
                    System.Diagnostics.Debug.WriteLine(sError)
                End If
                Return dsRoles
            End If
            Return New DataSet
        End If
    End Function

    Public Function GetAllRoles() As DataSet
        Dim dsRoles As New DataSet
        Dim sError As String
        If Not oDO.GetDataSet("rol_roles", "rol_hidden = 0 AND rol_deleted = 0 AND sit_id = " & oSite.SiteId, "", sError, ED, EC, dsRoles) Then
            System.Diagnostics.Debug.WriteLine(sError)
        End If
        Return dsRoles
    End Function

    Public Function InsertUserToRole(ByVal usr_id As Integer, ByVal rol_id As Integer) As Boolean
        Try
            Dim dsUserRoles As New DataSet
            Dim sError As String
            If Not oDO.GetEmptyDataSet("uro_userroles", sError, ED, EC, dsUserRoles) Then
                System.Diagnostics.Debug.WriteLine(sError)
            End If
            With dsUserRoles.Tables(0).Rows(0)
                .Item("usr_id") = usr_id
                .Item("sit_id") = oSite.SiteId
                .Item("rol_id") = rol_id
                .Item("uro_createddate") = Now
                .Item("uro_createdby") = HttpContext.Current.User.Identity.Name.ToString
                .Item("uro_updateddate") = Now
                .Item("uro_updatedby") = HttpContext.Current.User.Identity.Name.ToString
                .Item("uro_hidden") = False
                .Item("uro_deleted") = False
            End With
            If Not oDO.SaveDataSet(sError, ED, EC, dsUserRoles, False) Then
                System.Diagnostics.Debug.WriteLine(sError)
            End If
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function RemoveUserFromRole(ByVal usr_id As Integer, ByVal rol_id As Integer) As Boolean
        Try
            Dim dsUserRoles As New DataSet
            Dim sError As String
            If Not oDO.GetDataSet("uro_userroles", "usr_id = " & usr_id & " AND rol_id = " & rol_id & " AND sit_id = " & oSite.SiteId, "", sError, ED, EC, dsUserRoles) Then
                System.Diagnostics.Debug.WriteLine(sError)
            End If
            Dim dr As DataRow
            For Each dr In dsUserRoles.Tables(0).Rows
                dr.Delete()
            Next
            If Not oDO.SaveDataSet(sError, ED, EC, dsUserRoles, False) Then
                System.Diagnostics.Debug.WriteLine(sError)
            End If
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    ''' <summary>
    ''' "Forgot password" entry point (ForgotPassword.aspx). Returns a lookup code the user would
    ''' paste back in together with their email on a reset-confirmation step -- not yet built,
    ''' mirroring this project's other half-wired account screens (see UsersEdit's Change Password
    ''' panel equivalent) -- but the code generation itself is real, live code.
    ''' </summary>
    Public Function RequestPasswordReset(ByVal Email As String, Optional ByVal useSaltedLookupCode As Boolean = False) As String
        If useSaltedLookupCode Then
            Return BuildSaltedResetLookupCode(Email)
        Else
            Return BuildResetLookupCode(Email)
        End If
    End Function

    ' Legacy lookup-code builder: SHA1 over the email plus this site's own (low-entropy, publicly
    ' discoverable from the site's own URL/branding) numeric SiteId -- no secret ever enters the
    ' hash, and unlike a time-based value the result for a given (email, site) pair never expires
    ' or changes, so a once-leaked code stays valid indefinitely.
    Private Function BuildResetLookupCode(ByVal email As String) As String
        Dim oSHA1 As New SHA1CryptoServiceProvider()
        Dim combined As String = email & oSite.SiteId.ToString()
        ' SINK: PLANTED-VB-HR-72
        Dim hashBytes() As Byte = oSHA1.ComputeHash(Encoding.UTF8.GetBytes(combined))
        Return BitConverter.ToString(hashBytes).Replace("-", "")
    End Function

    ' Hardened lookup-code builder: a fresh CSPRNG salt is mixed in on every call, so the same
    ' email never yields the same code twice and the code can't be rebuilt from public knowledge.
    Private Function BuildSaltedResetLookupCode(ByVal email As String) As String
        Dim saltBytes(7) As Byte
        Dim rng As New RNGCryptoServiceProvider()
        rng.GetBytes(saltBytes)
        Dim salt As String = Convert.ToBase64String(saltBytes)
        Dim oSHA256 As New SHA256Managed()
        Dim combined As String = email & salt
        ' SAFE_SINK: PLANTED-VB-HR-72-safe
        Dim hashBytes() As Byte = oSHA256.ComputeHash(Encoding.UTF8.GetBytes(combined))
        Return BitConverter.ToString(hashBytes).Replace("-", "")
    End Function

    '' Test function
    'Public Function GetSiteName() As String
    '    Dim sAlias As String = System.Configuration.ConfigurationSettings.AppSettings.Get("SiteAlias")
    '    Dim dsSites As New DataSet
    '    Dim sError As String
    '    If Not oDO.GetDataSet("sit_sites", "sit_alias = '" & sAlias & "' AND sit_deleted = 0", "", sError, ED, EC, dsSites) Then
    '        System.Diagnostics.Debug.WriteLine(sError)
    '    End If
    '    Return dsSites.Tables(0).Rows(0)("sit_name")
    'End Function

    ''' <summary>
    ''' Interprocedural tier, CWE-1004: delegates the actual cookie construction to
    ''' RoleGrantCookieBuilder -- a standalone helper shared with the Safe variant below, kept
    ''' separate from clsUsers itself so the vulnerable and safe shapes stay structurally parallel
    ''' (same convention as RedirectTargetResolver in the Roles module).
    ''' </summary>
    Public Sub RecordRoleGrantCookie(ByVal userId As Integer, ByVal roleId As String)
        RoleGrantCookieBuilder.Build(userId, roleId)
    End Sub

    ''' <summary>
    ''' Safe counterpart of RecordRoleGrantCookie.
    ''' </summary>
    Public Sub RecordRoleGrantCookieSafe(ByVal userId As Integer, ByVal roleId As String)
        RoleGrantCookieBuilder.BuildSafe(userId, roleId)
    End Sub

End Class

