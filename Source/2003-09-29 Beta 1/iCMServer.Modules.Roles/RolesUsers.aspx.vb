Imports System
Imports System.data
Imports System.Drawing
Imports System.Web.UI.WebControls
Imports iConsulting
Imports iConsulting.iCMServer
Imports iConsulting.iCMServer.iCDataManager
Imports System.web
Imports System.Collections

Public Class RolesUsers
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents txtRole As System.Web.UI.WebControls.TextBox
    Protected WithEvents ddlUsers As System.Web.UI.WebControls.DropDownList
    Protected WithEvents btnAdd As System.Web.UI.WebControls.Button
    Protected WithEvents userRoles As System.Web.UI.WebControls.DataList
    Protected WithEvents btnOk As System.Web.UI.WebControls.Button
    Protected WithEvents btnExportMembers As System.Web.UI.WebControls.Button
    Protected WithEvents btnExportMembersSafe As System.Web.UI.WebControls.Button
    Protected WithEvents HeaderText As System.Web.UI.WebControls.Label
    Protected WithEvents SubText1 As System.Web.UI.WebControls.Label
    Protected WithEvents SubText2 As System.Web.UI.WebControls.Label

    'NOTE: The following placeholder declaration is required by the Web Form Designer.
    'Do not delete or move it.
    Private designerPlaceholderDeclaration As System.Object

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

    Private m_iID As Integer = -1
    Private oSite As clsSiteSettings = CType(HttpContext.Current.Items("SiteSettings"), clsSiteSettings)
    Private oRoles As New clsRoles
    Private oLanguageText As New clsLanguageText
    Private al As New ArrayList
    Private ModId As Integer = 0

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        ' Ensure that the visiting user has access to the current page
        If clsSiteSecurity.IsInRoles(oSite.ActivePage.AuthorizedRoles) = False Then
            Response.Redirect("~/Server/Security/AccessDenied.aspx")
        End If

        If Not (Request.Params("iID") Is Nothing) Then
            Me.m_iID = CInt(Request.Params("iID"))
        End If

        If Not (Request.Params("ModId") Is Nothing) Then
            ModId = Int32.Parse(Request.Params("ModId"))
        End If

        al = oLanguageText.GetLanguageTextByLocation(oSite.Language, "iConsulting.iCMServer.Modules.Roles")

        If Not Page.IsPostBack Then
            Dim dsUserRoles As New System.data.DataSet
            dsUserRoles = oRoles.GetAllUsers
            Dim l As ListItem
            Dim dr As DataRow
            For Each dr In dsUserRoles.Tables(0).Rows
                l = New ListItem
                l.Text = IIf(IsDBNull(dr("usr_firstname")), "", dr("usr_firstname")) & " " & IIf(IsDBNull(dr("usr_lastname")), "", dr("usr_lastname"))
                l.Value = dr("usr_id")
                ddlUsers.Items.Add(l)
            Next
            Call GetRoleInfo()
            Call FixStyles()
            Call LoadRoleUsers()
            Dim adminIndex As Integer = oSite.DesktopPages.Count - 1
            ViewState("UrlReferrer") = "~/icm.aspx?PageId=" & CType(oSite.DesktopPages(adminIndex), clsPageStripDetails).PageId & "&ExpId=" & ModId
        End If

        HeaderText.Text = Server.HtmlDecode(oLanguageText.Find(al, "roles_headertext"))
        SubText1.Text = Server.HtmlDecode(oLanguageText.Find(al, "roles_subtext1"))
        SubText2.Text = Server.HtmlDecode(oLanguageText.Find(al, "roles_subtext2"))

    End Sub

    Private Sub GetRoleInfo()
        Dim dsUser As New DataSet
        dsUser = oRoles.GetRoleFromID(Me.m_iID)
        txtRole.Text = dsUser.Tables(0).Rows(0)("rol_name")
    End Sub

    Private Sub LoadRoleUsers()
        Dim dsRoles As New DataSet
        dsRoles = oRoles.GetUsersFromID(Me.m_iID)
        '<asp:ImageButton ImageUrl="Images/Delete.gif" CommandName="delete" runat="server" ID="userRolesImage" />
        'userRolesImage.AlternateText = oLanguageText.Find(al, "users_alternate")
        If dsRoles.Tables.Count > 0 Then
            If dsRoles.Tables(0).Rows.Count > 0 Then
                userRoles.DataSource = dsRoles
                userRoles.DataBind()
            End If
        End If
    End Sub

    Private Sub FixStyles()
        btnAdd.Text = Server.HtmlDecode(oLanguageText.Find(al, "roles_add2"))
        btnAdd.CssClass = "iCWebControlsII"
        btnOk.Text = Server.HtmlDecode(oLanguageText.Find(al, "roles_ok2"))
        btnOk.CssClass = "iCWebControlsII"
    End Sub

    Private Sub btnAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdd.Click
        If Not oRoles.InsertRoleToUser(Me.m_iID, ddlUsers.SelectedItem.Value) Then

        End If
        Call LoadRoleUsers()
    End Sub

    Private Sub btnOk_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnOk.Click
        ' Same "Next" continue-destination feature as RolesEdit's save handler, but
        ' resolved via the Safe variant of the same two-hop helper chain, which only
        ' honors a fixed allow-list of known internal destinations.
        Dim nextParam As String = Request.QueryString("Next")
        If Not String.IsNullOrEmpty(nextParam) Then
            ' SAFE_SINK: PLANTED-VB-HR-128-safe
            Response.Redirect(oRoles.ResolvePostSaveRedirectSafe(nextParam))
        Else
            Response.Redirect(CType(ViewState("UrlReferrer"), String))
        End If
    End Sub

    ' New feature: let an admin download this role's member list as a text file, naming the
    ' download after a caller-chosen export file name (so repeated exports for different roles
    ' don't all collide on one browser-downloaded file name). Direct tier, CWE-113: the
    ' query-string value flows straight into the same statement's AddHeader call, with no
    ' intervening variable assignment or helper method in between.
    Private Sub btnExportMembers_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExportMembers.Click
        Dim exportFile As String = Request.QueryString("ExportFile")
        If String.IsNullOrEmpty(exportFile) Then exportFile = "RoleMembers"
        ' SINK: PLANTED-VB-HR-271
        Response.AddHeader("content-disposition", "attachment; filename=" & exportFile & ".txt")
        Response.ContentType = "text/plain"
        Dim dsRoles As New DataSet
        dsRoles = oRoles.GetUsersFromID(Me.m_iID)
        Dim dr As DataRow
        For Each dr In dsRoles.Tables(0).Rows
            Response.Write(CStr(dr("usr_firstname")) & " " & CStr(dr("usr_lastname")) & vbCrLf)
        Next
        Response.End()
    End Sub

    ' Safe twin of btnExportMembers_Click, reached from a separate button -- strips CR/LF from
    ' the same query-string value before it reaches the header-setting call.
    Private Sub btnExportMembersSafe_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExportMembersSafe.Click
        Dim exportFile As String = Request.QueryString("ExportFile")
        If String.IsNullOrEmpty(exportFile) Then exportFile = "RoleMembers"
        exportFile = exportFile.Replace(Chr(13), "").Replace(Chr(10), "")
        ' SAFE_SINK: PLANTED-VB-HR-271-safe
        Response.AddHeader("content-disposition", "attachment; filename=" & exportFile & ".txt")
        Response.ContentType = "text/plain"
        Dim dsRolesSafe As New DataSet
        dsRolesSafe = oRoles.GetUsersFromID(Me.m_iID)
        Dim drSafe As DataRow
        For Each drSafe In dsRolesSafe.Tables(0).Rows
            Response.Write(CStr(drSafe("usr_firstname")) & " " & CStr(drSafe("usr_lastname")) & vbCrLf)
        Next
        Response.End()
    End Sub

    Private Sub UserRoles_ItemCommand(ByVal sender As Object, ByVal e As DataListCommandEventArgs) Handles userRoles.ItemCommand
        If Not oRoles.RemoveRoleFromUser(Me.m_iID, userRoles.DataKeys(e.Item.ItemIndex)) Then

        End If
        userRoles.EditItemIndex = -1
        Call LoadRoleUsers()
    End Sub

End Class
