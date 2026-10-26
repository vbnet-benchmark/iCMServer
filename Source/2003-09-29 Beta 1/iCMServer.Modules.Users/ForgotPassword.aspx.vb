Imports System.Web
Imports System.Data
Imports System.Collections
Imports System.Text.RegularExpressions

' Self-service "forgot password" entry point. No role gate -- any visitor who knows (or guesses)
' an account's email can request a reset lookup code; the reset-confirmation step that would
' actually consume the code and change the password has not been built yet, mirroring this
' project's other half-finished account-management screens (see UsersEdit's Change Password panel
' equivalent). The code-generation step itself is real, live code regardless.
Public Class ForgotPassword
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents lblHeader As System.Web.UI.WebControls.Label
    Protected WithEvents lblEmail As System.Web.UI.WebControls.Label
    Protected WithEvents txtEmail As System.Web.UI.WebControls.TextBox
    Protected WithEvents btnRequestReset As System.Web.UI.WebControls.Button
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

    Private oUsers As New clsUsers

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        If Not Page.IsPostBack Then
            lblHeader.Text = "Forgot your password?"
            lblEmail.Text = "Email"
            btnRequestReset.Text = "Request reset code"
            lblMessage.Text = ""
        End If
    End Sub

    ' Direct tier, CWE-1333: format-checks the submitted email address inline, in the same
    ' handler that reads it from the request, before routing it on to the lookup-code generator.
    ' Nested-quantifier shape on BOTH halves of the address (local part AND domain labels) --
    ' the OWASP ReDoS cheat sheet's own canonical vulnerable-email-regex family -- so a crafted,
    ' unauthenticated POST to this self-service endpoint can tie up the handling thread.
    Private Sub btnRequestReset_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRequestReset.Click
        If Page.IsValid And Trim(txtEmail.Text) <> "" Then
            ' SINK: PLANTED-VB-HR-96
            If Not Regex.IsMatch(txtEmail.Text, "^([a-zA-Z0-9_.+-]+)+@(([a-zA-Z0-9-]+)+\.)+[a-zA-Z]{2,}$") Then
                lblMessage.Text = "Please enter a valid email address."
                Exit Sub
            End If

            Dim sResetCode As String = oUsers.RequestPasswordReset(txtEmail.Text)
            ' Kept server-side for the (not yet built) confirmation step; not persisted to the
            ' database, consistent with this project's other half-wired account-recovery screens.
            Session("PendingPasswordResetCode_" & txtEmail.Text) = sResetCode
            lblMessage.Text = "If that address is registered, a reset code has been generated."
        End If
    End Sub

End Class
