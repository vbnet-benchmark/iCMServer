Imports System.Web

' Password-reset confirmation step (the "not yet built" follow-up ForgotPassword.aspx.vb's own
' comment refers to). A real, genuine privilege-elevation event -- OWASP's Session Management
' Cheat Sheet names password reset explicitly alongside login as an event that must regenerate the
' session -- so it belongs in this CWE-384 batch even though it has no organic precedent of its
' own in this project yet.
Public Class ResetPasswordConfirm
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents lblHeader As System.Web.UI.WebControls.Label
    Protected WithEvents lblEmail As System.Web.UI.WebControls.Label
    Protected WithEvents txtEmail As System.Web.UI.WebControls.TextBox
    Protected WithEvents lblCode As System.Web.UI.WebControls.Label
    Protected WithEvents txtCode As System.Web.UI.WebControls.TextBox
    Protected WithEvents btnConfirm As System.Web.UI.WebControls.Button
    Protected WithEvents lblMessage As System.Web.UI.WebControls.Label

    'NOTE: The following placeholder declaration is required by the Web Form Designer.
    'Do not delete or move it.
    Private designerPlaceholderDeclaration As System.Object

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        If Not Page.IsPostBack Then
            lblHeader.Text = "Confirm password reset"
            lblEmail.Text = "Email"
            lblCode.Text = "Reset code"
            btnConfirm.Text = "Confirm and sign in"
            lblMessage.Text = ""
        End If
    End Sub

    ''' <summary>
    ''' Interprocedural tier, CWE-384 (Session Fixation): the submitted code is checked against the
    ''' lookup code ForgotPassword.aspx.vb's btnRequestReset_Click already wrote into
    ''' Session("PendingPasswordResetCode_" &amp; email) for this exact email -- a real, pre-existing
    ''' write side, unconditional for any successful "forgot password" request on this same
    ''' session. The actual sink call is delegated to a separate, shared helper class
    ''' (ResetLoginCompletion) in this same module -- crossing a file/class boundary -- mirroring
    ''' RoleGrantCookieBuilder.vb's and RedirectTargetResolver.vb's role elsewhere in this project.
    ''' Vulnerable and safe variants are independently reachable via the Secure query-string key.
    ''' </summary>
    Private Sub btnConfirm_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnConfirm.Click
        If Page.IsValid AndAlso Trim(txtEmail.Text) <> "" Then
            Dim expectedCode As String = CStr(Session("PendingPasswordResetCode_" & txtEmail.Text))
            If Not String.IsNullOrEmpty(expectedCode) AndAlso expectedCode = txtCode.Text Then
                If Request.QueryString("Secure") = "1" Then
                    ResetLoginCompletion.CompleteSafe(txtEmail.Text)
                Else
                    ResetLoginCompletion.Complete(txtEmail.Text)
                End If
                Response.Redirect("~/icm.aspx")
            Else
                lblMessage.Text = "Invalid or expired reset code."
            End If
        End If
    End Sub

End Class
