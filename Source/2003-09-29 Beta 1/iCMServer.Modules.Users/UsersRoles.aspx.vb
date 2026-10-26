Imports System
Imports System.data
Imports System.Drawing
Imports System.Web.UI.WebControls
Imports iConsulting
Imports iConsulting.iCMServer
Imports iConsulting.iCMServer.iCDataManager
Imports System.web
Imports System.Collections

Public Class UsersRoles
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents HeaderText As System.Web.UI.WebControls.Label
    Protected WithEvents SubText1 As System.Web.UI.WebControls.Label
    Protected WithEvents SubText2 As System.Web.UI.WebControls.Label
    Protected WithEvents ImageButton1 As System.Web.UI.WebControls.ImageButton
    Protected WithEvents userRolesImage As System.Web.UI.WebControls.ImageButton

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
    Private oUsers As New clsUsers
    Private oLanguageText As New clsLanguageText
    Private al As New ArrayList
    Protected WithEvents userRoles As System.Web.UI.WebControls.DataList
    Protected WithEvents txtUser As System.Web.UI.WebControls.TextBox
    Protected WithEvents ddlRoles As System.Web.UI.WebControls.DropDownList
    Protected WithEvents btnAdd As System.Web.UI.WebControls.Button
    Protected WithEvents btnOk As System.Web.UI.WebControls.Button
    Protected WithEvents btnExportRoles As System.Web.UI.WebControls.Button
    Protected WithEvents btnExportRolesSafe As System.Web.UI.WebControls.Button
    Protected WithEvents userRolesLabel As System.Web.UI.WebControls.Label
    Public sHeader As String
    Public sSubHeader1 As String
    Public sSubHeader2 As String
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


        al = oLanguageText.GetLanguageTextByLocation(oSite.Language, "iConsulting.iCMServer.Modules.Users")

        If Not Page.IsPostBack Then
            Dim dsUserRoles As New System.data.DataSet
            dsUserRoles = oUsers.GetAllRoles
            Dim l As ListItem
            Dim dr As DataRow
            For Each dr In dsUserRoles.Tables(0).Rows
                l = New ListItem
                l.Text = dr("rol_name")
                l.Value = dr("rol_id")
                ddlRoles.Items.Add(l)
            Next
            Call GetUserInfo()
            Call FixStyles()
            Call LoadUserRoles()
            Dim adminIndex As Integer = oSite.DesktopPages.Count - 1
            ViewState("UrlReferrer") = "~/icm.aspx?PageId=" & CType(oSite.DesktopPages(adminIndex), clsPageStripDetails).PageId & "&ExpId=" & ModId
        End If

        HeaderText.Text = Server.HtmlDecode(oLanguageText.Find(al, "users_headertext"))
        SubText1.Text = Server.HtmlDecode(oLanguageText.Find(al, "users_subtext1"))
        SubText2.Text = Server.HtmlDecode(oLanguageText.Find(al, "users_subtext2"))

    End Sub

    Private Sub GetUserInfo()
        Dim dsUser As New DataSet
        dsUser = oUsers.GetUserFromID(Me.m_iID)
        txtUser.Text = dsUser.Tables(0).Rows(0)("usr_firstname") & " " & dsUser.Tables(0).Rows(0)("usr_lastname")
    End Sub

    Private Sub LoadUserRoles()
        Dim dsRoles As New DataSet
        dsRoles = oUsers.GetRolesFromID(Me.m_iID)
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
        btnAdd.Text = Server.HtmlDecode(oLanguageText.Find(al, "users_add"))
        btnAdd.CssClass = "iCWebControlsII"
        btnOk.Text = Server.HtmlDecode(oLanguageText.Find(al, "users_ok"))
        btnOk.CssClass = "iCWebControlsII"
    End Sub

    Private Sub btnAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdd.Click
        If Not oUsers.InsertUserToRole(Me.m_iID, ddlRoles.SelectedItem.Value) Then

        End If
        ' Leaves a short-lived marker so the role-management screen can highlight the just-granted
        ' role after the DataList rebinds. TrackRoleGrant=1 is the original rollout;
        ' TrackRoleGrant=2 is the hardened variant added alongside it.
        Dim trackMode As String = Request.QueryString("TrackRoleGrant")
        If trackMode = "1" Then
            Call oUsers.RecordRoleGrantCookie(Me.m_iID, ddlRoles.SelectedItem.Value)
        ElseIf trackMode = "2" Then
            Call oUsers.RecordRoleGrantCookieSafe(Me.m_iID, ddlRoles.SelectedItem.Value)
        End If
        Call LoadUserRoles()
    End Sub

    Private Sub btnOk_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnOk.Click
        Response.Redirect(CType(ViewState("UrlReferrer"), String))
    End Sub

    Private Sub UserRoles_ItemCommand(ByVal sender As Object, ByVal e As DataListCommandEventArgs) Handles userRoles.ItemCommand
        If Not oUsers.RemoveUserFromRole(Me.m_iID, userRoles.DataKeys(e.Item.ItemIndex)) Then

        End If
        userRoles.EditItemIndex = -1
        Call LoadUserRoles()
    End Sub

    ' 5th-tier diversity instance, CWE-113: builds ONE combined response header out of every role
    ' name currently assigned to this user -- a loop over several DB ROWS (clsUsers.GetRolesFromID,
    ' each rol_name itself admin-free-text via RolesEdit.aspx.vb) accumulated with
    ' System.Text.StringBuilder.Append, as opposed to every other instance in this batch (a single
    ' scalar value, or a loop over a request array / UI control collection).
    Private Sub btnExportRoles_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExportRoles.Click
        Dim dsRoles As New DataSet
        dsRoles = oUsers.GetRolesFromID(Me.m_iID)
        Dim sb As New System.Text.StringBuilder
        Dim dr As DataRow
        For Each dr In dsRoles.Tables(0).Rows
            sb.Append(CStr(dr("rol_name")))
            sb.Append(";")
        Next
        ' SINK: PLANTED-VB-HR-275
        Response.AddHeader("X-User-Roles", sb.ToString())
        Response.ContentType = "text/plain"
        Response.Write(sb.ToString())
        Response.End()
    End Sub

    ' Safe twin of btnExportRoles_Click, reached from a separate button -- identical loop/
    ' StringBuilder shape, but each role name has its own CR/LF stripped before being appended, so
    ' every tainted component folded into the combined header is independently neutralized.
    Private Sub btnExportRolesSafe_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExportRolesSafe.Click
        Dim dsRolesSafe As New DataSet
        dsRolesSafe = oUsers.GetRolesFromID(Me.m_iID)
        Dim sbSafe As New System.Text.StringBuilder
        Dim drSafe As DataRow
        For Each drSafe In dsRolesSafe.Tables(0).Rows
            sbSafe.Append(CStr(drSafe("rol_name")).Replace(Chr(13), "").Replace(Chr(10), ""))
            sbSafe.Append(";")
        Next
        ' SAFE_SINK: PLANTED-VB-HR-275-safe
        Response.AddHeader("X-User-Roles", sbSafe.ToString())
        Response.ContentType = "text/plain"
        Response.Write(sbSafe.ToString())
        Response.End()
    End Sub
End Class
