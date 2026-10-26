Imports System.Web
Imports System.Data
Imports System.Collections
Imports System.Text.RegularExpressions

Public Class UsersEdit
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents lblHeader As System.Web.UI.WebControls.Label
    Protected WithEvents btnUpdate As System.Web.UI.WebControls.Button
    Protected WithEvents btnCancel As System.Web.UI.WebControls.Button
    Protected WithEvents btnDelete As System.Web.UI.WebControls.Button
    Protected WithEvents lblFirstName As System.Web.UI.WebControls.Label
    Protected WithEvents lblLastName As System.Web.UI.WebControls.Label
    Protected WithEvents lblEmail As System.Web.UI.WebControls.Label
    Protected WithEvents lblDescription As System.Web.UI.WebControls.Label
    Protected WithEvents txtFirstName As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtLastName As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtEmail As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtDescription As System.Web.UI.WebControls.TextBox
    Protected WithEvents RegularExpressionValidator1 As System.Web.UI.WebControls.RegularExpressionValidator
    Protected WithEvents lblPassWord As System.Web.UI.WebControls.Label
    Protected WithEvents lblConfirm As System.Web.UI.WebControls.Label
    Protected WithEvents txtPassword As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtConfirm As System.Web.UI.WebControls.TextBox
    Protected WithEvents CompareValidator1 As System.Web.UI.WebControls.CompareValidator
    Protected WithEvents FileUploadPhoto As System.Web.UI.HtmlControls.HtmlInputFile
    Protected WithEvents btnUploadPhoto As System.Web.UI.WebControls.Button
    Protected WithEvents btnUploadPhotoSafe As System.Web.UI.WebControls.Button

    'NOTE: The following placeholder declaration is required by the Web Form Designer.
    'Do not delete or move it.
    Private designerPlaceholderDeclaration As System.Object

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

    Private oSite As clsSiteSettings = CType(HttpContext.Current.Items("SiteSettings"), clsSiteSettings)
    Private oCrypto As New clsCrypto
    Private oUsers As New clsUsers
    Private oLanguageText As New clsLanguageText
    Private al As New ArrayList
    Private UsrId As Integer = 0
    Private ModId As Integer = 0

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        ' Ensure that the visiting user has access to the current page
        If clsSiteSecurity.IsInRoles(oSite.ActivePage.AuthorizedRoles) = False Then
            Response.Redirect("~/Server/Security/AccessDenied.aspx")
        End If

        If Not (Request.Params("UsrId") Is Nothing) Then
            UsrId = Int32.Parse(Request.Params("UsrId"))
        End If

        If Not (Request.Params("ModId") Is Nothing) Then
            ModId = Int32.Parse(Request.Params("ModId"))
        End If

        If Not Page.IsPostBack Then
            Call BindData()
            Dim adminIndex As Integer = oSite.DesktopPages.Count - 1
            ViewState("UrlReferrer") = "~/icm.aspx?PageId=" & CType(oSite.DesktopPages(adminIndex), clsPageStripDetails).PageId & "&ExpId=" & ModId
        End If

    End Sub

    Private Sub BindData()
        al = oLanguageText.GetLanguageTextByLocation(oSite.Language, "iConsulting.iCMServer.Modules.Users")

        lblHeader.Text = Server.HtmlDecode(oLanguageText.Find(al, "users_editheader"))
        lblFirstName.Text = Server.HtmlDecode(oLanguageText.Find(al, "users_forename")) & ":"
        lblLastName.Text = Server.HtmlDecode(oLanguageText.Find(al, "users_lastname")) & ":"
        lblEmail.Text = Server.HtmlDecode(oLanguageText.Find(al, "users_email")) & ":"
        lblPassWord.Text = Server.HtmlDecode(oLanguageText.Find(al, "users_password")) & ":"
        lblConfirm.Text = Server.HtmlDecode(oLanguageText.Find(al, "users_confirmpassword")) & ":"
        lblDescription.Text = Server.HtmlDecode(oLanguageText.Find(al, "users_description")) & ":"
        btnUpdate.Text = Server.HtmlDecode(oLanguageText.Find(al, "users_editupdate"))
        btnCancel.Text = Server.HtmlDecode(oLanguageText.Find(al, "users_editcancel"))
        btnDelete.Text = Server.HtmlDecode(oLanguageText.Find(al, "users_editdelete"))
        RegularExpressionValidator1.ErrorMessage = Server.HtmlDecode(oLanguageText.Find(al, "users_editemailvalidator"))
        CompareValidator1.ErrorMessage = Server.HtmlDecode(oLanguageText.Find(al, "users_editconfirmvalidator"))

        btnDelete.Attributes.Add("onclick", "return confirm('" & Server.HtmlDecode(oLanguageText.Find(al, "users_confirm")) & "');")

        If Not UsrId = 0 Then
            Dim ds As New DataSet
            ds = oUsers.GetUserFromID(UsrId)
            txtFirstName.Text = ds.Tables(0).Rows(0)("usr_firstname")
            txtLastName.Text = ds.Tables(0).Rows(0)("usr_lastname")
            txtEmail.Text = ds.Tables(0).Rows(0)("usr_email")
            txtPassword.Text = ds.Tables(0).Rows(0)("usr_password")
            txtConfirm.Text = ds.Tables(0).Rows(0)("usr_password")
            txtDescription.Text = ds.Tables(0).Rows(0)("usr_description")
        End If

    End Sub

    ' Safe twin of PLANTED-VB-HR-96 (ForgotPassword.aspx.vb): same email-format-check intent, a
    ' DIFFERENT, independently-reachable admin call site (create/update-user), but with the nested
    ' quantifiers removed from both halves of the address -- a single unambiguous '+' per clause,
    ' so the same crafted input that blows up the self-service form resolves in linear time here.
    Private Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        ' SAFE_SINK: PLANTED-VB-HR-96-safe
        Dim bEmailFormatOk As Boolean = Regex.IsMatch(txtEmail.Text, "^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z]{2,}$")
        If Page.IsValid Then
            If Not UsrId = 0 Then
                If Not oUsers.UpdateUser(UsrId, txtFirstName.Text, txtLastName.Text, txtEmail.Text, oCrypto.Encrypt(txtPassword.Text), txtDescription.Text) Then

                End If
                ' Lets the admin's "Recently Edited User" banner on the next screen re-identify
                ' which account was just touched, without a database round trip. RememberEdit=1 is
                ' the original rollout; RememberEdit=2 is the hardened variant added alongside it.
                Dim rememberEditMode As String = Request.QueryString("RememberEdit")
                If rememberEditMode = "1" Then
                    Call SetLastEditedUserCookie(txtEmail.Text)
                ElseIf rememberEditMode = "2" Then
                    Call SetLastEditedUserCookieSafe(txtEmail.Text)
                End If
                Response.Redirect(ViewState("UrlReferrer"))
            Else
                Dim sActivationCode As String = ""
                If Not oUsers.AddUser(txtFirstName.Text, txtLastName.Text, txtEmail.Text, oCrypto.Encrypt(txtPassword.Text), txtDescription.Text, sActivationCode) Then

                End If
                ' Kept for the administrator to copy into the activation email they send by hand
                ' (this project has no outbound-mail integration yet).
                Session("LastCreatedUserActivationCode") = sActivationCode
                Response.Redirect(ViewState("UrlReferrer"))
            End If
        End If
    End Sub

    Private Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        Response.Redirect(ViewState("UrlReferrer"))
    End Sub

    Private Sub btnDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDelete.Click
        If Not oUsers.DeleteUser(UsrId) Then

        End If
        Response.Redirect(ViewState("UrlReferrer"))
    End Sub

    ' New feature: let an admin attach a profile photo to this user account, saved under a
    ' dedicated photo folder using the file's own (client-supplied) name. Indirect tier, CWE-434:
    ' one hop through a same-class private helper that performs the actual save, with no
    ' extension/content-type validation added along the way.
    Private Sub btnUploadPhoto_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUploadPhoto.Click
        If Not (FileUploadPhoto.PostedFile Is Nothing) Then
            If FileUploadPhoto.PostedFile.ContentLength > 0 Then
                SaveProfilePhotoFile(FileUploadPhoto.PostedFile)
            End If
        End If
        Response.Redirect(ViewState("UrlReferrer"))
    End Sub

    ' Indirect tier, CWE-434: private helper in this SAME class, one hop from the event handler
    ' that reads the tainted posted file -- the helper itself performs the sink call.
    Private Sub SaveProfilePhotoFile(ByVal postedFile As HttpPostedFile)
        Dim destPath As String = Server.MapPath("~/UserPhotos/" & UsrId & "_" & postedFile.FileName)
        ' SINK: PLANTED-VB-HR-392
        postedFile.SaveAs(destPath)
    End Sub

    Private Sub btnUploadPhotoSafe_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUploadPhotoSafe.Click
        If Not (FileUploadPhoto.PostedFile Is Nothing) Then
            If FileUploadPhoto.PostedFile.ContentLength > 0 Then
                SaveProfilePhotoFileSafe(FileUploadPhoto.PostedFile)
            End If
        End If
        Response.Redirect(ViewState("UrlReferrer"))
    End Sub

    ' Safe twin of SaveProfilePhotoFile: identical shape, but the extension is checked against a
    ' strict allow-list (lowercased) before the file is ever saved.
    Private Sub SaveProfilePhotoFileSafe(ByVal postedFile As HttpPostedFile)
        Dim allowedPhotoExtensions() As String = {".jpg", ".jpeg", ".png", ".gif"}
        Dim sExt As String = System.IO.Path.GetExtension(postedFile.FileName).ToLower()
        If Array.IndexOf(allowedPhotoExtensions, sExt) >= 0 Then
            Dim destPath As String = Server.MapPath("~/UserPhotos/" & UsrId & "_" & postedFile.FileName)
            ' SAFE_SINK: PLANTED-VB-HR-392-safe
            postedFile.SaveAs(destPath)
        End If
    End Sub

    ''' <summary>
    ''' Indirect tier, CWE-1004: one hop through a same-class helper that constructs and appends
    ''' the "last edited user" cookie -- the admin's identity trail for the edited account's email,
    ''' trusted by the next screen's banner to re-identify the account. No .HttpOnly assignment
    ''' anywhere along the way.
    ''' </summary>
    Private Sub SetLastEditedUserCookie(ByVal editedEmail As String)
        Response.Cookies("icmlasteditedemail").Value = editedEmail
        ' SINK: PLANTED-VB-HR-177
        Response.Cookies("icmlasteditedemail").Expires = DateTime.Now.AddHours(1)
    End Sub

    ''' <summary>
    ''' Safe twin of SetLastEditedUserCookie: identical shape, but hardened against client-side
    ''' script reading the stored email back out of the cookie.
    ''' </summary>
    Private Sub SetLastEditedUserCookieSafe(ByVal editedEmail As String)
        Response.Cookies("icmlasteditedemail").Value = editedEmail
        Response.Cookies("icmlasteditedemail").HttpOnly = True
        ' SAFE_SINK: PLANTED-VB-HR-177-safe
        Response.Cookies("icmlasteditedemail").Expires = DateTime.Now.AddHours(1)
    End Sub
End Class
