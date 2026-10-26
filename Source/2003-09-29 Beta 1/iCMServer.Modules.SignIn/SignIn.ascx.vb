Imports iConsulting
Imports iConsulting.iCMServer
Imports iConsulting.iCMServer.iCDataManager
Imports System.Web
Imports System.Web.Security

Public MustInherit Class SignIn : Inherits clsSiteModuleControl

    Protected WithEvents Requiredfieldvalidator1 As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents Requiredfieldvalidator2 As System.Web.UI.WebControls.RequiredFieldValidator
    ' Obtain SiteSettings from Current Context
    Private _SiteSettings As clsSiteSettings = CType(HttpContext.Current.Items("SiteSettings"), clsSiteSettings)
    Protected WithEvents Header As System.Web.UI.HtmlControls.HtmlGenericControl
    Protected WithEvents Content As System.Web.UI.HtmlControls.HtmlGenericControl
    Protected WithEvents Label1 As System.Web.UI.WebControls.Label
    Protected WithEvents UserName As System.Web.UI.WebControls.TextBox
    Protected WithEvents Label2 As System.Web.UI.WebControls.Label
    Protected WithEvents UserPass As System.Web.UI.WebControls.TextBox
    Protected WithEvents LoginBtn As System.Web.UI.WebControls.Button
    Protected WithEvents RegularExpressionValidator1 As System.Web.UI.WebControls.RegularExpressionValidator
    Protected WithEvents Msg As System.Web.UI.WebControls.Label
    Protected WithEvents lblHeader As System.Web.UI.WebControls.Label
    Protected WithEvents lblText1 As System.Web.UI.WebControls.Label
    Protected WithEvents lblText2 As System.Web.UI.WebControls.Label
    ' Set LanguageText
    Dim oLanguageText As New clsLanguageText

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Dim al As New System.Collections.ArrayList
        al = oLanguageText.GetLanguageTextByLocation(_SiteSettings.Language, "iConsulting.iCMServer")
        Label1.Text = Server.HtmlDecode(oLanguageText.Find(al, "sys_username"))
        Label2.Text = Server.HtmlDecode(oLanguageText.Find(al, "sys_password"))
        LoginBtn.Text = Server.HtmlDecode(oLanguageText.Find(al, "sys_signin"))
        lblHeader.Text = Server.HtmlDecode(oLanguageText.Find(al, "sys_signin"))
        lblText1.Text = Server.HtmlDecode(oLanguageText.Find(al, "sys_cookietext1")) '"Om du loggar in kommer cookies att användas."
        lblText2.Text = Server.HtmlDecode(oLanguageText.Find(al, "sys_cookietext2")) '"Kan endast undvikas genom att inte logga in."
        RegularExpressionValidator1.ErrorMessage = Server.HtmlDecode(oLanguageText.Find(al, "sys_errormessage")) '"eroor"

        ' CWE-384 (Session Fixation), Indirect tier: one hop through a same-class private helper
        ' that issues the sink. Reachable only via the "icmremember" cookie -- written for real by
        ' this control's own LoginBtn_Click only after a genuine, verified login with
        ' RememberDevice=1 (see below) -- so a visitor must already have authenticated once before
        ' this branch can fire on a later request/session. Vulnerable and safe variants are
        ' independently reachable via distinct QuickLogin query-string values.
        If Not Page.IsPostBack AndAlso Not (Request.Cookies("icmremember") Is Nothing) Then
            Dim quickLoginMode As String = Request.QueryString("QuickLogin")
            If quickLoginMode = "1" Then
                CompleteQuickLogin(Request.Cookies("icmremember").Value)
            ElseIf quickLoginMode = "2" Then
                Session.Abandon()
                CompleteQuickLoginSafe(Request.Cookies("icmremember").Value)
            End If
        End If

        ' CWE-384 (Session Fixation), substituted tier (no genuine Interface/MustInherit/
        ' Overridable/MustOverride login-completion hierarchy exists anywhere in this project --
        ' confirmed by grep, and already recorded as the same gap by this project's own
        ' clsSites.vb/EditPages.aspx.vb notes for their own CWEs): dispatches on a plain Select
        ' Case over an attacker-supplied LoginMode key instead. The mode key itself is trusted
        ' with no independent verification of which completion variant the caller is entitled to
        ' invoke -- disclosed honestly, mirroring this project's own unverified-dispatch-key
        ' precedent (e.g. PLANTED-VB-HR-139's embed-target dispatch). The underlying login is a
        ' real, freshly-verified credential check (clsSignIn.Login), so only the completion
        ' variant -- not the identity being elevated -- is attacker-selected.
        If Page.IsPostBack Then
            Dim federatedMode As String = Request.QueryString("LoginMode")
            If Not String.IsNullOrEmpty(federatedMode) AndAlso Trim(UserName.Text) <> "" AndAlso Trim(UserPass.Text) <> "" Then
                Dim oSignInFederated As New clsSignIn
                Dim sFederatedEmail As String = oSignInFederated.Login(UserName.Text, UserPass.Text)
                If Not (sFederatedEmail Is Nothing) And sFederatedEmail <> "" Then
                    CompleteLoginByMode(federatedMode, sFederatedEmail)
                End If
            End If

            ' CWE-384 (Session Fixation), second substituted tier -- a genuinely different
            ' construction from the Select Case above: a LOOP issuing one SetAuthCookie call per
            ' linked account, matching this project's legacy shared department-mailbox convention
            ' (several named accounts intentionally share one password). Each iteration performs
            ' its own real credential check via clsSignIn.Login before calling the sink for that
            ' account -- only the loop shape varies, not the verification discipline.
            Dim switchAccounts As String = Request.QueryString("SwitchAccounts")
            Dim switchAccountsSecure As String = Request.QueryString("SwitchAccountsSecure")
            If Not String.IsNullOrEmpty(switchAccounts) AndAlso Trim(UserPass.Text) <> "" Then
                CompleteSharedAccountsLogin(switchAccounts.Split(","c), UserPass.Text)
            ElseIf Not String.IsNullOrEmpty(switchAccountsSecure) AndAlso Trim(UserPass.Text) <> "" Then
                Session.Abandon()
                CompleteSharedAccountsLoginSafe(switchAccountsSecure.Split(","c), UserPass.Text)
            End If
        End If
    End Sub

    Public Sub LoginBtn_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        ' CWE-384 (Session Fixation), Direct tier: self-service registration completes the
        ' privilege elevation in a single straight-line statement, with no helper method and no
        ' Session.Abandon()/regeneration beforehand -- a session fixed on the visitor before they
        ' ever registered continues to carry the newly-created account's identity. Independently
        ' reachable via its own query-string key (Mode=Register / Mode=RegisterSecure), so it
        ' never touches the organic login flow below.
        Dim registerMode As String = Request.QueryString("Mode")
        If registerMode = "Register" Or registerMode = "RegisterSecure" Then
            If Page.IsValid AndAlso Trim(UserName.Text) <> "" AndAlso Trim(UserPass.Text) <> "" Then
                Dim oSignInRegister As New clsSignIn
                If oSignInRegister.Register(UserName.Text, UserPass.Text) Then
                    If registerMode = "RegisterSecure" Then
                        Session.Abandon()
                        ' SAFE_SINK: PLANTED-VB-HR-206-safe
                        FormsAuthentication.SetAuthCookie(UserName.Text, False)
                    Else
                        ' SINK: PLANTED-VB-HR-206
                        FormsAuthentication.SetAuthCookie(UserName.Text, False)
                    End If
                    Response.Redirect(Request.ApplicationPath)
                Else
                    Msg.Text = "<" & "br" & ">Registration failed.<" & "br" & ">"
                End If
            End If
            Exit Sub
        End If

        If Page.IsValid Then
            Dim oSignIn As New clsSignIn
            Dim sUserEmail As String = oSignIn.Login(UserName.Text, UserPass.Text)
            If Not (sUserEmail Is Nothing) And sUserEmail <> "" Then
                Try
                    ' Log User Off from Cookie Authentication System
                    FormsAuthentication.SignOut()
                    ' Invalidate roles token
                    Response.Cookies("siteroles").Value = Nothing
                    Response.Cookies("siteroles").Path = "/"
                    Response.Cookies("siteroles").Expires = New System.DateTime(1999, 10, 12)
                Catch ex As Exception

                Finally
                    ' Use security system to set the UserID within a client-side Cookie
                    FormsAuthentication.SetAuthCookie(UserName.Text, False)

                    ' Optional "remember this device" convenience: lets the login page pre-fill
                    ' the username next time, for users who opt in via the sign-in form's checkbox
                    ' (RememberDevice=1, the original link still live) and a newer, hardened
                    ' variant (RememberDevice=2) rolled out alongside it.
                    Dim rememberMode As String = Request.QueryString("RememberDevice")
                    If rememberMode = "1" Then
                        Response.Cookies("icmremember").Value = UserName.Text
                        ' SINK: PLANTED-VB-HR-176
                        Response.Cookies("icmremember").Expires = DateTime.Now.AddDays(30)
                    ElseIf rememberMode = "2" Then
                        Response.Cookies("icmremember").Value = UserName.Text
                        Response.Cookies("icmremember").HttpOnly = True
                        ' SAFE_SINK: PLANTED-VB-HR-176-safe
                        Response.Cookies("icmremember").Expires = DateTime.Now.AddDays(30)
                    End If

                    ' If the login prompt was reached with a ReturnUrl (e.g. a deep link
                    ' that required authentication first), send the user back there
                    ' instead of just the site root.
                    Dim returnUrl As String = Request.QueryString("ReturnUrl")
                    If Not String.IsNullOrEmpty(returnUrl) Then
                        ' SINK: PLANTED-VB-HR-126
                        Response.Redirect(returnUrl)
                    Else
                        ' Redirect browser back to originating page
                        Response.Redirect(Request.ApplicationPath)
                    End If
                End Try
            Else
                Msg.Text = "<" & "br" & ">" & Server.HtmlDecode(oLanguageText.Find(_SiteSettings.LanguageText, "sys_loginfailed")) & "<" & "br" & ">"
            End If
        End If
    End Sub
    ''' <summary>
    ''' CWE-384 (Session Fixation), Indirect-tier vulnerable sink: completes the "trusted device"
    ''' quick re-login with no prior Session.Abandon()/regeneration.
    ''' </summary>
    Private Sub CompleteQuickLogin(ByVal rememberedEmail As String)
        ' SINK: PLANTED-VB-HR-207
        FormsAuthentication.SetAuthCookie(rememberedEmail, False)
    End Sub

    ''' <summary>
    ''' Safe twin of CompleteQuickLogin: identical shape; the caller (Page_Load) has already
    ''' called Session.Abandon() immediately before invoking this method, with no intervening
    ''' branch that could skip it.
    ''' </summary>
    Private Sub CompleteQuickLoginSafe(ByVal rememberedEmail As String)
        ' SAFE_SINK: PLANTED-VB-HR-207-safe
        FormsAuthentication.SetAuthCookie(rememberedEmail, False)
    End Sub

    ''' <summary>
    ''' CWE-384 (Session Fixation), substituted tier: dispatches on a plain Select Case over an
    ''' attacker-supplied mode key (see the Page_Load comment above for why no genuine
    ''' polymorphism hierarchy was available to dispatch on instead).
    ''' </summary>
    Private Sub CompleteLoginByMode(ByVal loginMode As String, ByVal email As String)
        Select Case loginMode
            Case "federated"
                ' SINK: PLANTED-VB-HR-209
                FormsAuthentication.SetAuthCookie(email, False)
            Case "federated-secure"
                Session.Abandon()
                ' SAFE_SINK: PLANTED-VB-HR-209-safe
                FormsAuthentication.SetAuthCookie(email, False)
        End Select
    End Sub

    ''' <summary>
    ''' CWE-384 (Session Fixation), second substituted tier: a loop issuing one SetAuthCookie call
    ''' per linked account that independently re-verifies against the submitted password.
    ''' </summary>
    Private Sub CompleteSharedAccountsLogin(ByVal candidateEmails As String(), ByVal password As String)
        Dim oSignInShared As New clsSignIn
        Dim candidateEmail As String
        For Each candidateEmail In candidateEmails
            Dim sVerifiedEmail As String = oSignInShared.Login(Trim(candidateEmail), password)
            If Not (sVerifiedEmail Is Nothing) And sVerifiedEmail <> "" Then
                ' SINK: PLANTED-VB-HR-210
                FormsAuthentication.SetAuthCookie(sVerifiedEmail, False)
            End If
        Next
    End Sub

    ''' <summary>
    ''' Safe twin of CompleteSharedAccountsLogin: the caller (Page_Load) has already called
    ''' Session.Abandon() once, before this method's loop begins.
    ''' </summary>
    Private Sub CompleteSharedAccountsLoginSafe(ByVal candidateEmails As String(), ByVal password As String)
        Dim oSignInShared As New clsSignIn
        Dim candidateEmail As String
        For Each candidateEmail In candidateEmails
            Dim sVerifiedEmail As String = oSignInShared.Login(Trim(candidateEmail), password)
            If Not (sVerifiedEmail Is Nothing) And sVerifiedEmail <> "" Then
                ' SAFE_SINK: PLANTED-VB-HR-210-safe
                FormsAuthentication.SetAuthCookie(sVerifiedEmail, False)
            End If
        Next
    End Sub

End Class

