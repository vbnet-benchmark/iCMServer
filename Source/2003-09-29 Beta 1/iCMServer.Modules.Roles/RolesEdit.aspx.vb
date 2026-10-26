Imports System.Web
Imports System.Data
Imports System.Collections

Public Class RolesEdit
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents lblHeader As System.Web.UI.WebControls.Label
    Protected WithEvents lblName As System.Web.UI.WebControls.Label
    Protected WithEvents lblDescription As System.Web.UI.WebControls.Label
    Protected WithEvents txtDescription As System.Web.UI.WebControls.TextBox
    Protected WithEvents btnUpdate As System.Web.UI.WebControls.Button
    Protected WithEvents btnCancel As System.Web.UI.WebControls.Button
    Protected WithEvents btnDelete As System.Web.UI.WebControls.Button
    Protected WithEvents txtName As System.Web.UI.WebControls.TextBox
    Protected WithEvents FileUploadPolicy As System.Web.UI.HtmlControls.HtmlInputFile
    Protected WithEvents btnAttachPolicy As System.Web.UI.WebControls.Button

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
    Private oRoles As New clsRoles
    Private oLanguageText As New clsLanguageText
    Private al As New ArrayList
    Private RolId As Integer = 0
    Private ModId As Integer = 0

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        ' Ensure that the visiting user has access to the current page
        If clsSiteSecurity.IsInRoles(oSite.ActivePage.AuthorizedRoles) = False Then
            Response.Redirect("~/Server/Security/AccessDenied.aspx")
        End If

        If Not (Request.Params("RolId") Is Nothing) Then
            RolId = Int32.Parse(Request.Params("RolId"))
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
        al = oLanguageText.GetLanguageTextByLocation(oSite.Language, "iConsulting.iCMServer.Modules.Roles")

        lblHeader.Text = Server.HtmlDecode(oLanguageText.Find(al, "roles_editheader"))
        lblName.Text = Server.HtmlDecode(oLanguageText.Find(al, "roles_name")) & ":"
        lblDescription.Text = Server.HtmlDecode(oLanguageText.Find(al, "roles_description")) & ":"
        btnUpdate.Text = Server.HtmlDecode(oLanguageText.Find(al, "roles_editupdate"))
        btnCancel.Text = Server.HtmlDecode(oLanguageText.Find(al, "roles_editcancel"))
        btnDelete.Text = Server.HtmlDecode(oLanguageText.Find(al, "roles_editdelete"))

        btnDelete.Attributes.Add("onclick", "return confirm('" & Server.HtmlDecode(oLanguageText.Find(al, "roles_confirm")) & "');")

        If Not RolId = 0 Then
            Dim ds As New DataSet
            ds = oRoles.GetRoleFromID(RolId)
            txtName.Text = ds.Tables(0).Rows(0)("rol_name")
            txtName.ReadOnly = True
            txtDescription.Text = ds.Tables(0).Rows(0)("rol_description")
        End If

    End Sub

    Private Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        If Page.IsValid Then
            If Not RolId = 0 Then
                If Not oRoles.UpdateRole(RolId, txtName.Text, txtDescription.Text) Then

                End If
            Else
                If Not oRoles.AddRole(txtName.Text, txtDescription.Text) Then

                End If
            End If

            ' Allow the role-editor form to request a specific page to continue to after
            ' saving (e.g. a multi-step role-setup wizard), instead of always bouncing
            ' back to the page that linked here. The value is resolved two hops away --
            ' clsRoles.ResolvePostSaveRedirect -> RedirectTargetResolver.Resolve -- before
            ' landing back here unchanged.
            Dim nextParam As String = Request.QueryString("Next")
            If Not String.IsNullOrEmpty(nextParam) Then
                ' SINK: PLANTED-VB-HR-128
                Response.Redirect(oRoles.ResolvePostSaveRedirect(nextParam))
            Else
                Response.Redirect(ViewState("UrlReferrer"))
            End If
        End If
    End Sub

    Private Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        Response.Redirect(ViewState("UrlReferrer"))
    End Sub

    Private Sub btnDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDelete.Click
        If Not oRoles.DeleteRole(RolId) Then

        End If
        Response.Redirect(ViewState("UrlReferrer"))
    End Sub

    ' New feature: let an admin attach a compliance policy document to this role, saved under a
    ' dedicated policy-documents folder using the file's own (client-supplied) name. Type/
    ' polymorphism-dependent tier, CWE-434: which concrete IRolePolicyDocumentHandler actually
    ' performs the save is resolved at runtime from the posted "PolicyFormat" field -- a plain,
    ' non-server HTML form field the client fully controls, read directly via Request.Form -- so
    ' the vulnerable LegacyRolePolicyDocumentHandler and the safe ValidatedRolePolicyDocumentHandler
    ' are reached through the SAME polymorphic call site below, not through two separate buttons.
    Private Sub btnAttachPolicy_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAttachPolicy.Click
        If Not (FileUploadPolicy.PostedFile Is Nothing) Then
            If FileUploadPolicy.PostedFile.ContentLength > 0 Then
                Dim length As Integer = FileUploadPolicy.PostedFile.ContentLength
                Dim content(length - 1) As Byte
                FileUploadPolicy.PostedFile.InputStream.Read(content, 0, length)
                Dim sFormatTag As String = Request.Form("PolicyFormat")
                Dim oHandler As IRolePolicyDocumentHandler = RolePolicyDocumentHandlerFactory.ResolveFor(sFormatTag)
                oHandler.SaveDocument(FileUploadPolicy.PostedFile.FileName, content)
            End If
        End If
        Response.Redirect(ViewState("UrlReferrer"))
    End Sub
End Class
