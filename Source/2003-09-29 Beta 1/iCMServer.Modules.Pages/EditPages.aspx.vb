Imports System
Imports System.data
Imports System.Drawing
Imports System.Web.UI.WebControls
Imports iConsulting
Imports iConsulting.iCMServer
Imports iConsulting.iCMServer.iCDataManager
Imports System.web
Imports System.Collections
Public Class EditPages : Inherits System.Web.UI.Page

    Private oCrypto As New iConsulting.iCMServer.clsCrypto
    Private ED As String = oCrypto.Encrypt(System.Configuration.ConfigurationSettings.AppSettings.Get("DataSource"))
    Private EC As String = oCrypto.Encrypt(System.Configuration.ConfigurationSettings.AppSettings.Get("ConnectionString"))
    Private oDO As New iCDataManager.iCDataObject
    Private oSite As clsSiteSettings = CType(HttpContext.Current.Items("SiteSettings"), clsSiteSettings)
    Public oLang As New clsLanguageText
    Public al As New ArrayList
    Private PageID As Integer = 0
    Private Mode As String = ""
    Protected leftList As ArrayList
    Protected contentList As ArrayList
    Protected rightList As ArrayList
    Protected IsAdmin As Boolean
    Protected IsHomeOrAdmin As Boolean

    Protected WithEvents PageName As System.Web.UI.WebControls.TextBox
    Protected WithEvents authRoles As System.Web.UI.WebControls.CheckBoxList
    Protected WithEvents moduleType As System.Web.UI.WebControls.DropDownList
    Protected WithEvents moduleTitle As System.Web.UI.WebControls.TextBox
    Protected WithEvents LeftUpBtn As System.Web.UI.WebControls.ImageButton
    Protected WithEvents LeftRightBtn As System.Web.UI.WebControls.ImageButton
    Protected WithEvents LeftDownBtn As System.Web.UI.WebControls.ImageButton
    Protected WithEvents LeftEditBtn As System.Web.UI.WebControls.ImageButton
    Protected WithEvents LeftDeleteBtn As System.Web.UI.WebControls.ImageButton
    Protected WithEvents ContentUpBtn As System.Web.UI.WebControls.ImageButton
    Protected WithEvents ContentLeftBtn As System.Web.UI.WebControls.ImageButton
    Protected WithEvents ContentRightBtn As System.Web.UI.WebControls.ImageButton
    Protected WithEvents ContentDownBtn As System.Web.UI.WebControls.ImageButton
    Protected WithEvents ContentEditBtn As System.Web.UI.WebControls.ImageButton
    Protected WithEvents ContentDeleteBtn As System.Web.UI.WebControls.ImageButton
    Protected WithEvents RightUpBtn As System.Web.UI.WebControls.ImageButton
    Protected WithEvents RightLeftBtn As System.Web.UI.WebControls.ImageButton
    Protected WithEvents RightDownBtn As System.Web.UI.WebControls.ImageButton
    Protected WithEvents RightEditBtn As System.Web.UI.WebControls.ImageButton
    Protected WithEvents RightDeleteBtn As System.Web.UI.WebControls.ImageButton
    Protected WithEvents btnSave As System.Web.UI.WebControls.Button
    Protected WithEvents btnAdd As System.Web.UI.WebControls.Button
    Protected WithEvents LeftModuleField As System.Web.UI.WebControls.ListBox
    Protected WithEvents ContentModuleField As System.Web.UI.WebControls.ListBox
    Protected WithEvents RightModuleField As System.Web.UI.WebControls.ListBox
    Protected WithEvents ddlV As System.Web.UI.WebControls.DropDownList
    Protected WithEvents ddlH As System.Web.UI.WebControls.DropDownList
    Protected WithEvents lblHeader As System.Web.UI.WebControls.Label
    Protected WithEvents lblName As System.Web.UI.WebControls.Label
    Protected WithEvents lblLeftWidth As System.Web.UI.WebControls.Label
    Protected WithEvents lblRightWidth As System.Web.UI.WebControls.Label
    Protected WithEvents lblRoles As System.Web.UI.WebControls.Label
    Protected WithEvents lblAddMod As System.Web.UI.WebControls.Label
    Protected WithEvents lblModType As System.Web.UI.WebControls.Label
    Protected WithEvents lblModName As System.Web.UI.WebControls.Label
    Protected WithEvents lblOrg As System.Web.UI.WebControls.Label
    Protected WithEvents lblLeftModField As System.Web.UI.WebControls.Label
    Protected WithEvents lblContentModField As System.Web.UI.WebControls.Label
    Protected WithEvents lblRightModField As System.Web.UI.WebControls.Label
    Protected WithEvents lblIsVisible As System.Web.UI.WebControls.Label
    Protected WithEvents rbVisible1 As System.Web.UI.WebControls.RadioButton
    Protected WithEvents rbVisible2 As System.Web.UI.WebControls.RadioButton
    Protected WithEvents lblContentWidth As System.Web.UI.WebControls.Label
    Protected WithEvents chkContentAlignCenter As System.Web.UI.WebControls.CheckBox
    Protected WithEvents ddlC As System.Web.UI.WebControls.DropDownList
    Protected WithEvents lblAdvHeader As System.Web.UI.WebControls.Label
    Protected WithEvents lblBackColor As System.Web.UI.WebControls.Label
    Protected WithEvents lblBackPicture As System.Web.UI.WebControls.Label
    Protected WithEvents lblBackPictureHorizontalAlign As System.Web.UI.WebControls.Label
    Protected WithEvents lblBackPictureVerticalAlign As System.Web.UI.WebControls.Label
    Protected WithEvents lblBackPictureHorizontalTiling As System.Web.UI.WebControls.Label
    Protected WithEvents lblBackPictureVerticalTiling As System.Web.UI.WebControls.Label
    Protected WithEvents lblHeight As System.Web.UI.WebControls.Label
    Protected WithEvents txtBackColor As System.Web.UI.WebControls.TextBox
    Protected WithEvents ddBackPictureHorizontalAlign As System.Web.UI.WebControls.DropDownList
    Protected WithEvents ddBackPictureVerticalAlign As System.Web.UI.WebControls.DropDownList
    Protected WithEvents rbBackPictureHorizontalTiling1 As System.Web.UI.WebControls.RadioButton
    Protected WithEvents rbBackPictureHorizontalTiling2 As System.Web.UI.WebControls.RadioButton
    Protected WithEvents rbBackPictureVerticalTiling1 As System.Web.UI.WebControls.RadioButton
    Protected WithEvents rbBackPictureVerticalTiling2 As System.Web.UI.WebControls.RadioButton
    Protected WithEvents imgBackPicture As System.Web.UI.WebControls.Image
    Protected WithEvents btnBackPicture As System.Web.UI.WebControls.Button
    Protected WithEvents lblUseMinimizer As System.Web.UI.WebControls.Label
    Protected WithEvents rbUseMinimizer1 As System.Web.UI.WebControls.RadioButton
    Protected WithEvents rbUseMinimizer2 As System.Web.UI.WebControls.RadioButton
    Protected WithEvents lblTop As System.Web.UI.WebControls.Label
    Protected WithEvents ddTop As System.Web.UI.WebControls.DropDownList
    Protected WithEvents Button1 As System.Web.UI.WebControls.Button
    Protected ExpandMinimizer As Boolean = False
    Protected WithEvents ddHeight As System.Web.UI.WebControls.DropDownList
    Private ModId As Integer = 0

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub

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

        ' Ensure that the visiting user has access to the current page
        If clsSiteSecurity.IsInRoles("Superadmin;Admins") = False Then
            Response.Redirect("~/Server/Security/AccessDenied.aspx")
        End If

        ' Determine ItemId of Events to Update
        If Not (Request.Params("PageID") Is Nothing) Then
            PageID = Int32.Parse(Request.Params("PageID"))
        End If

        ' Determine ItemId of Events to Update
        If Not (Request.Params("ModId") Is Nothing) Then
            ModId = Int32.Parse(Request.Params("ModId"))
        End If

        ' Determine ItemId of Events to Update
        If Not (Request.Params("Mode") Is Nothing) Then
            Mode = Request.Params("Mode")
        End If

        ' Determine ItemId of Events to Update
        If Not (Request.Params("ExpandMinimizer") Is Nothing) Then
            ExpandMinimizer = Request.Params("ExpandMinimizer")
        End If

        al = oLang.GetLanguageTextByLocation(oSite.Language, "iConsulting.iCMServer.Modules.Pages")
        lblHeader.Text = Server.HtmlDecode(oLang.Find(al, "pagedit_header"))
        btnSave.Text = Server.HtmlDecode(oLang.Find(al, "pagedit_save"))
        btnAdd.Text = Server.HtmlDecode(oLang.Find(al, "pagedit_addmod"))
        lblAddMod.Text = Server.HtmlDecode(oLang.Find(al, "pagedit_addto"))
        lblContentModField.Text = Server.HtmlDecode(oLang.Find(al, "pagedit_centerfield"))
        lblHeader.Text = Server.HtmlDecode(oLang.Find(al, "pagedit_header"))
        lblLeftModField.Text = Server.HtmlDecode(oLang.Find(al, "pagedit_leftfield"))
        lblLeftWidth.Text = Server.HtmlDecode(oLang.Find(al, "pagedit_leftwidth"))
        lblModName.Text = Server.HtmlDecode(oLang.Find(al, "pagedit_modname"))
        lblModType.Text = Server.HtmlDecode(oLang.Find(al, "pagedit_modtype"))
        lblName.Text = Server.HtmlDecode(oLang.Find(al, "pagedit_name"))
        lblOrg.Text = Server.HtmlDecode(oLang.Find(al, "pagedit_org"))
        lblRightModField.Text = Server.HtmlDecode(oLang.Find(al, "pagedit_rightfield"))
        lblRightWidth.Text = Server.HtmlDecode(oLang.Find(al, "pagedit_rightwidth"))
        lblRoles.Text = Server.HtmlDecode(oLang.Find(al, "pagedit_roles"))
        lblContentWidth.Text = Server.HtmlDecode(oLang.Find(al, "pagedit_contentwidth"))

        LeftUpBtn.AlternateText = Server.HtmlDecode(oLang.Find(al, "pagedit_moveup"))
        LeftDownBtn.AlternateText = Server.HtmlDecode(oLang.Find(al, "pagedit_movedown"))
        LeftRightBtn.AlternateText = Server.HtmlDecode(oLang.Find(al, "pagedit_moveright"))
        LeftEditBtn.AlternateText = Server.HtmlDecode(oLang.Find(al, "pagedit_edit"))
        LeftDeleteBtn.AlternateText = Server.HtmlDecode(oLang.Find(al, "pagedit_delete"))

        ContentUpBtn.AlternateText = Server.HtmlDecode(oLang.Find(al, "pagedit_moveup"))
        ContentDownBtn.AlternateText = Server.HtmlDecode(oLang.Find(al, "pagedit_movedown"))
        ContentLeftBtn.AlternateText = Server.HtmlDecode(oLang.Find(al, "pagedit_moveleft"))
        ContentRightBtn.AlternateText = Server.HtmlDecode(oLang.Find(al, "pagedit_moveright"))
        ContentEditBtn.AlternateText = Server.HtmlDecode(oLang.Find(al, "pagedit_edit"))
        ContentDeleteBtn.AlternateText = Server.HtmlDecode(oLang.Find(al, "pagedit_delete"))

        RightUpBtn.AlternateText = Server.HtmlDecode(oLang.Find(al, "pagedit_moveup"))
        RightDownBtn.AlternateText = Server.HtmlDecode(oLang.Find(al, "pagedit_movedown"))
        RightLeftBtn.AlternateText = Server.HtmlDecode(oLang.Find(al, "pagedit_moveleft"))
        RightEditBtn.AlternateText = Server.HtmlDecode(oLang.Find(al, "pagedit_edit"))
        RightDeleteBtn.AlternateText = Server.HtmlDecode(oLang.Find(al, "pagedit_delete"))

        chkContentAlignCenter.Text = Server.HtmlDecode(oLang.Find(al, "pagedit_contentalign"))

        lblAdvHeader.Text = Server.HtmlDecode(oLang.Find(al, "pagedit_advheader"))
        lblUseMinimizer.Text = Server.HtmlDecode(oLang.Find(al, "pagedit_useminimizer"))
        lblBackColor.Text = Server.HtmlDecode(oLang.Find(al, "pagedit_backcolor"))
        lblBackPicture.Text = Server.HtmlDecode(oLang.Find(al, "pagedit_backpicture"))
        lblBackPictureHorizontalAlign.Text = Server.HtmlDecode(oLang.Find(al, "pagedit_backpicturehorizontalalign"))
        lblBackPictureVerticalAlign.Text = Server.HtmlDecode(oLang.Find(al, "pagedit_backpictureverticalalign"))
        lblBackPictureHorizontalTiling.Text = Server.HtmlDecode(oLang.Find(al, "pagedit_backpicturehorizontaltiling"))
        lblBackPictureVerticalTiling.Text = Server.HtmlDecode(oLang.Find(al, "pagedit_backpictureverticaltiling"))
        btnBackPicture.Text = Server.HtmlDecode(oLang.Find(al, "pagedit_editpicture"))
        lblTop.Text = Server.HtmlDecode(oLang.Find(al, "pagedit_toppx"))
        lblHeight.Text = Server.HtmlDecode(oLang.Find(al, "pagedit_height"))
        rbUseMinimizer1.Text = Server.HtmlDecode(oLang.Find(al, "modedit_yes"))
        rbUseMinimizer2.Text = Server.HtmlDecode(oLang.Find(al, "modedit_no"))
        rbBackPictureHorizontalTiling1.Text = Server.HtmlDecode(oLang.Find(al, "modedit_yes"))
        rbBackPictureHorizontalTiling2.Text = Server.HtmlDecode(oLang.Find(al, "modedit_no"))
        rbBackPictureVerticalTiling1.Text = Server.HtmlDecode(oLang.Find(al, "modedit_yes"))
        rbBackPictureVerticalTiling2.Text = Server.HtmlDecode(oLang.Find(al, "modedit_no"))

        Dim oPag As New clsPages
        If oPag.IsAdminPage(oSite.ActivePage.PageId) Then
            IsAdmin = True
        End If
        If oPag.IsHomeOrAdminPage(oSite.ActivePage.PageId) Then
            IsHomeOrAdmin = True
        End If

        If Not Page.IsPostBack Then
            If PageID = 0 Then
                Dim _PageId As Integer = oPag.AddPage(PageID)
                Dim _Url As String = Left(Request.RawUrl, Len(Request.RawUrl) - InStr(StrReverse(Request.RawUrl), "/")) & "/EditPages.aspx?PageID=" & _PageId.ToString & "&ModId=" & ModId
                Response.Redirect(_Url)
            ElseIf LCase(Mode) = "add" Then
                Dim _PageId As Integer = oPag.AddPage(PageID)
                Dim _Url As String = Left(Request.RawUrl, Len(Request.RawUrl) - InStr(StrReverse(Request.RawUrl), "/")) & "/EditPages.aspx?PageID=" & _PageId.ToString & "&ModId=" & ModId
                Response.Redirect(_Url)
            Else
                Call BindData()
            End If
        End If

    End Sub

    Private Sub BindData()
        Dim Page As clsPageSettings = oSite.ActivePage
        Dim i As Integer
        PageName.Text = Page.PageName

        Dim dsRoles As New DataSet
        Dim drRoles As DataRow
        Dim oPag As New clsPages
        dsRoles = oPag.GetSiteRoles
        authRoles.Items.Clear()
        Dim allItem As New ListItem
        allItem.Text = "All Users"
        If Page.AuthorizedRoles.LastIndexOf("All Users") > -1 Then
            allItem.Selected = True
        End If

        lblIsVisible.Text = Server.HtmlDecode(oLang.Find(al, "modedit_visible"))
        rbVisible1.Text = Server.HtmlDecode(oLang.Find(al, "modedit_yes"))
        rbVisible2.Text = Server.HtmlDecode(oLang.Find(al, "modedit_no"))

        If Page.IsVisible Then
            rbVisible1.Checked = True
            rbVisible2.Checked = False
        Else
            rbVisible1.Checked = False
            rbVisible2.Checked = True
        End If

        authRoles.Items.Add(allItem)
        Dim item As New ListItem
        For Each drRoles In dsRoles.Tables(0).Rows
            item = New ListItem
            item.Text = CType(drRoles("rol_name"), String)
            item.Value = drRoles("rol_id").ToString()
            If Page.AuthorizedRoles.LastIndexOf(item.Text) > -1 Then
                item.Selected = True
            End If
            authRoles.Items.Add(item)
        Next

        ' Populate the ModuleFieldWidth
        Call PrepareFieldCombo(False)
        If Page.LeftModuleFieldWidth = "" Then
            ddlV.SelectedValue = 0
        Else
            ddlV.SelectedValue = CType(Page.LeftModuleFieldWidth, Integer)
        End If
        If Page.ContentModuleFieldWidth = "" Then
            ddlC.SelectedValue = 0
        Else
            ddlC.SelectedValue = CType(Page.ContentModuleFieldWidth, Integer)
        End If
        If Page.RightModuleFieldWidth = "" Then
            ddlH.SelectedValue = 0
        Else
            ddlH.SelectedValue = CType(Page.RightModuleFieldWidth, Integer)
        End If

        chkContentAlignCenter.Checked = Page.ContentAlignCenter

        txtBackColor.Text = Page.PageBackColor

        If Page.PagePictureHref = "" Then
            imgBackPicture.Visible = False
        Else
            imgBackPicture.ImageUrl = Page.PagePictureHref
        End If

        For i = 0 To 20
            ddTop.Items.Add(New ListItem(i, i.ToString))
        Next
        ddTop.SelectedValue = Page.PageTop

        ddHeight.Items.Add(New ListItem("n/a", "n/a"))
        For i = 1 To 1200
            ddHeight.Items.Add(New ListItem(i.ToString, i.ToString))
        Next
        ddHeight.SelectedValue = Page.PageHeight

        If Page.PageMinimizer Then
            rbUseMinimizer1.Checked = True
            rbUseMinimizer2.Checked = False
        Else
            rbUseMinimizer1.Checked = False
            rbUseMinimizer2.Checked = True
        End If

        ' horizontalalign
        ddBackPictureHorizontalAlign.Items.Add(New ListItem(Server.HtmlDecode(oLang.Find(al, "pagedit_left")), "left"))
        ddBackPictureHorizontalAlign.Items.Add(New ListItem(Server.HtmlDecode(oLang.Find(al, "pagedit_center")), "center"))
        ddBackPictureHorizontalAlign.Items.Add(New ListItem(Server.HtmlDecode(oLang.Find(al, "pagedit_right")), "right"))
        ddBackPictureHorizontalAlign.SelectedValue = Page.PagePictureHorizotalAlign

        ' verticalalign
        ddBackPictureVerticalAlign.Items.Add(New ListItem(Server.HtmlDecode(oLang.Find(al, "pagedit_top")), "top"))
        ddBackPictureVerticalAlign.Items.Add(New ListItem(Server.HtmlDecode(oLang.Find(al, "pagedit_center")), "center"))
        ddBackPictureVerticalAlign.Items.Add(New ListItem(Server.HtmlDecode(oLang.Find(al, "pagedit_bottom")), "bottom"))
        ddBackPictureVerticalAlign.SelectedValue = Page.PagePictureVerticalAlign

        ' horizontaltiling
        If Page.PagePictureHorizontalTiling Then
            rbBackPictureHorizontalTiling1.Checked = True
            rbBackPictureHorizontalTiling2.Checked = False
        Else
            rbBackPictureHorizontalTiling1.Checked = False
            rbBackPictureHorizontalTiling2.Checked = True
        End If

        ' verticaltiling
        If Page.PagePictureVerticalTiling Then
            rbBackPictureVerticalTiling1.Checked = True
            rbBackPictureVerticalTiling2.Checked = False
        Else
            rbBackPictureVerticalTiling1.Checked = False
            rbBackPictureVerticalTiling2.Checked = True
        End If

        ' Populate the "Add Module" Data
        moduleType.DataTextField = "mde_name"
        moduleType.DataValueField = "mde_id"
        moduleType.DataSource = oPag.GetModuleDefinitions
        moduleType.DataBind()

        ' Populate Right Hand Module Data
        rightList = oPag.GetModules("RightModuleField")
        RightModuleField.DataBind()

        ' Populate Content Pane Module Data
        contentList = oPag.GetModules("ContentModuleField")
        ContentModuleField.DataBind()

        ' Populate Left Hand Pane Module Data
        leftList = oPag.GetModules("LeftModuleField")
        LeftModuleField.DataBind()

    End Sub

    Private Sub SavePageData()
        Dim authorizedRoles As String = "Superadmin;Admins;"
        Dim item As ListItem
        Dim oPag As New clsPages

        For Each item In authRoles.Items
            If item.Selected = True Then
                authorizedRoles += item.Text & ";"
            End If
        Next item

        If IsHomeOrAdmin Then
            If Not oPag.UpdatePage(PageID, PageName.Text, oSite.ActivePage.PageOrder, authorizedRoles, ddlV.SelectedValue, ddlC.SelectedValue, ddlH.SelectedValue, chkContentAlignCenter.Checked, True, txtBackColor.Text, ddTop.SelectedValue, ddHeight.SelectedValue, rbUseMinimizer1.Checked, ddBackPictureHorizontalAlign.SelectedValue, ddBackPictureVerticalAlign.SelectedValue, rbBackPictureHorizontalTiling1.Checked, rbBackPictureVerticalTiling1.Checked) Then

            End If
        Else
            If Not oPag.UpdatePage(PageID, PageName.Text, oSite.ActivePage.PageOrder, authorizedRoles, ddlV.SelectedValue, ddlC.SelectedValue, ddlH.SelectedValue, chkContentAlignCenter.Checked, rbVisible1.Checked, txtBackColor.Text, ddTop.SelectedValue, ddHeight.SelectedValue, rbUseMinimizer1.Checked, ddBackPictureHorizontalAlign.SelectedValue, ddBackPictureVerticalAlign.SelectedValue, rbBackPictureHorizontalTiling1.Checked, rbBackPictureVerticalTiling1.Checked) Then

            End If
        End If
    End Sub

    Private Sub btnSave_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSave.Click
        Call SavePageData()

        ' Optional per-page edit lock: records which admin currently holds this page open for
        ' editing (so a second admin opening the same page gets a "someone is already editing
        ' this" warning). Dispatches on LockMode rather than a real polymorphic hierarchy -- this
        ' project has no interface/MustOverride hierarchy for page-level behaviors to hang a
        ' genuine runtime-dispatched implementation off of; LockMode=legacy is the original
        ' rollout, LockMode=strict is the hardened variant added alongside it.
        Dim lockMode As String = Request.QueryString("LockMode")
        Select Case lockMode
            Case "legacy"
                Response.Cookies("icmeditlock").Value = PageID & ":" & System.Web.HttpContext.Current.User.Identity.Name
                ' SINK: PLANTED-VB-HR-179
                Response.Cookies("icmeditlock").Expires = DateTime.Now.AddMinutes(15)
            Case "strict"
                Response.Cookies("icmeditlock").Value = PageID & ":" & System.Web.HttpContext.Current.User.Identity.Name
                Response.Cookies("icmeditlock").HttpOnly = True
                ' SAFE_SINK: PLANTED-VB-HR-179-safe
                Response.Cookies("icmeditlock").Expires = DateTime.Now.AddMinutes(15)
        End Select

        ' Notifies each co-admin listed as a watcher for this page that it was just saved, via a
        ' short-lived per-admin cookie the notifications panel on icm.aspx checks for -- one cookie
        ' per watcher id in the (optional) comma-separated NotifyAdminIds list. NotifyMode=1 is the
        ' original rollout; NotifyMode=2 is the hardened variant added alongside it.
        Dim notifyIds As String = Request.QueryString("NotifyAdminIds")
        Dim notifyMode As String = Request.QueryString("NotifyMode")
        If Not String.IsNullOrEmpty(notifyIds) AndAlso notifyMode = "1" Then
            Dim watcherCookies As System.Collections.Generic.List(Of HttpCookie) = BuildPageSaveNotificationCookies(PageID, notifyIds)
            Dim watcherCookie As HttpCookie
            For Each watcherCookie In watcherCookies
                ' SINK: PLANTED-VB-HR-180
                Response.Cookies.Add(watcherCookie)
            Next
        ElseIf Not String.IsNullOrEmpty(notifyIds) AndAlso notifyMode = "2" Then
            Dim watcherCookiesSafe As System.Collections.Generic.List(Of HttpCookie) = BuildPageSaveNotificationCookiesSafe(PageID, notifyIds)
            Dim watcherCookieSafe As HttpCookie
            For Each watcherCookieSafe In watcherCookiesSafe
                ' SAFE_SINK: PLANTED-VB-HR-180-safe
                Response.Cookies.Add(watcherCookieSafe)
            Next
        End If

        Dim adminIndex As Integer = oSite.DesktopPages.Count - 1
        Response.Redirect(("~/icm.aspx?Index=" & adminIndex.ToString() & "&PageId=" & CType(oSite.DesktopPages(adminIndex), clsPageStripDetails).PageId) & "&ExpId=" & ModId)
    End Sub

    ''' <summary>
    ''' Loop-accumulated tier, CWE-1004: builds one notification cookie per watcher id in a
    ''' comma-separated list, each carrying the page id and the watcher's own admin id -- the
    ''' omission is multiplied once per watcher rather than introduced by any single call.
    ''' </summary>
    Private Function BuildPageSaveNotificationCookies(ByVal pageId As Integer, ByVal watcherIdsCsv As String) As System.Collections.Generic.List(Of HttpCookie)
        Dim result As New System.Collections.Generic.List(Of HttpCookie)
        Dim watcherIds As String() = watcherIdsCsv.Split(",")
        Dim i As Integer
        For i = 0 To watcherIds.Length - 1
            Dim watcherId As String = watcherIds(i).Trim()
            If watcherId <> "" Then
                Dim c As New HttpCookie("icmnotify_" & watcherId)
                c.Value = pageId & ":" & watcherId
                c.Expires = DateTime.Now.AddHours(2)
                result.Add(c)
            End If
        Next
        Return result
    End Function

    ''' <summary>
    ''' Safe twin of BuildPageSaveNotificationCookies: identical construction, but each cookie is
    ''' hardened before being handed back to the caller.
    ''' </summary>
    Private Function BuildPageSaveNotificationCookiesSafe(ByVal pageId As Integer, ByVal watcherIdsCsv As String) As System.Collections.Generic.List(Of HttpCookie)
        Dim result As New System.Collections.Generic.List(Of HttpCookie)
        Dim watcherIds As String() = watcherIdsCsv.Split(",")
        Dim i As Integer
        For i = 0 To watcherIds.Length - 1
            Dim watcherId As String = watcherIds(i).Trim()
            If watcherId <> "" Then
                Dim c As New HttpCookie("icmnotify_" & watcherId)
                c.Value = pageId & ":" & watcherId
                c.HttpOnly = True
                c.Expires = DateTime.Now.AddHours(2)
                result.Add(c)
            End If
        Next
        Return result
    End Function

    Private Sub PageSettings_Change(ByVal sender As Object, ByVal e As EventArgs) Handles authRoles.SelectedIndexChanged, PageName.TextChanged
        Call SavePageData()
    End Sub

    Private Sub btnAdd_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnAdd.Click
        ' All new modules go to the end of the contentpane
        Dim m As New clsModuleItem
        m.ModuleTitle = moduleTitle.Text
        m.ModuleDefId = Int32.Parse(moduleType.SelectedItem.Value)
        m.ModuleOrder = 999

        Dim oPag As New clsPages
        m.ModuleId = oPag.AddModule(PageID, m.ModuleOrder, "ContentModuleField", m.ModuleTitle, m.ModuleDefId, 0, "Admins;Superadmin")

        HttpContext.Current.Items("SiteSettings") = New clsSiteSettings(oSite.SiteId, PageID)

        ' reorder the modules in the content pane
        Dim modules As ArrayList = oPag.GetModules("ContentModuleField")
        If Not oPag.OrderModules(modules) Then

        End If

        ' resave the order
        Dim item As clsModuleItem
        For Each item In modules
            If Not oPag.UpdateModuleOrder(item.ModuleId, item.ModuleOrder, "ContentModuleField") Then

            End If
        Next item

        Response.Redirect(Request.RawUrl)
    End Sub

    Private Sub UpDown_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles LeftDownBtn.Click, LeftUpBtn.Click, ContentDownBtn.Click, ContentUpBtn.Click, RightDownBtn.Click, RightUpBtn.Click

        Dim cmd As String = CType(sender, ImageButton).CommandName
        Dim pane As String = CType(sender, ImageButton).CommandArgument
        Dim _listbox As ListBox = CType(Page.FindControl(pane), ListBox)
        Dim oPag As New clsPages
        Dim modules As ArrayList = oPag.GetModules(pane)

        If _listbox.SelectedIndex <> -1 Then
            Dim delta As Integer
            Dim selection As Integer = -1

            If cmd = "down" Then
                delta = 3
                If _listbox.SelectedIndex < _listbox.Items.Count - 1 Then
                    selection = _listbox.SelectedIndex + 1
                End If
            Else
                delta = -3
                If _listbox.SelectedIndex > 0 Then
                    selection = _listbox.SelectedIndex - 1
                End If
            End If

            Dim m As clsModuleItem
            m = CType(modules(_listbox.SelectedIndex), clsModuleItem)
            m.ModuleOrder += delta

            ' reorder the modules in the content pane
            If Not oPag.OrderModules(modules) Then

            End If

            ' resave the order
            Dim item As clsModuleItem
            For Each item In modules
                If Not oPag.UpdateModuleOrder(item.ModuleId, item.ModuleOrder, pane) Then

                End If
            Next item

        End If

        Response.Redirect(Request.RawUrl)

    End Sub

    Private Sub RightLeft_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles LeftRightBtn.Click, ContentLeftBtn.Click, ContentRightBtn.Click, RightLeftBtn.Click

        Dim sourcePane As String = CType(sender, ImageButton).Attributes("sourcepane")
        Dim targetPane As String = CType(sender, ImageButton).Attributes("targetpane")
        Dim sourceBox As ListBox = CType(Page.FindControl(sourcePane), ListBox)
        Dim targetBox As ListBox = CType(Page.FindControl(targetPane), ListBox)
        Dim oPag As New clsPages

        If sourceBox.SelectedIndex <> -1 Then

            ' get source arraylist
            Dim sourceList As ArrayList = oPag.GetModules(sourcePane)

            ' get a reference to the module to move
            ' and assign a high order number to send it to the end of the target list
            Dim m As clsModuleItem = CType(sourceList(sourceBox.SelectedIndex), clsModuleItem)

            ' add it to the database
            If Not oPag.UpdateModuleOrder(m.ModuleId, 998, targetPane) Then

            End If

            ' delete it from the source list
            sourceList.RemoveAt(sourceBox.SelectedIndex)

            ' reload the _portalSettings from the database
            HttpContext.Current.Items("SiteSettings") = New clsSiteSettings(oSite.SiteId, PageID)

            ' reorder the modules in the source pane
            sourceList = oPag.GetModules(sourcePane)
            If Not oPag.OrderModules(sourceList) Then

            End If

            ' resave the order
            Dim item As clsModuleItem
            For Each item In sourceList
                If Not oPag.UpdateModuleOrder(item.ModuleId, item.ModuleOrder, sourcePane) Then

                End If
            Next item

            ' reorder the modules in the target pane
            Dim targetList As ArrayList = oPag.GetModules(targetPane)
            If Not oPag.OrderModules(targetList) Then

            End If

            ' resave the order
            For Each item In targetList
                If Not oPag.UpdateModuleOrder(item.ModuleId, item.ModuleOrder, targetPane) Then

                End If
            Next item

            ' Redirect to the same page to pick up changes
            Response.Redirect(Request.RawUrl)
        End If

    End Sub

    Private Sub DeleteBtn_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles LeftDeleteBtn.Click, ContentDeleteBtn.Click, RightDeleteBtn.Click

        Dim pane As String = CType(sender, ImageButton).CommandArgument
        Dim _listbox As ListBox = CType(Page.FindControl(pane), ListBox)
        Dim oPag As New clsPages
        Dim modules As ArrayList = oPag.GetModules(pane)

        If _listbox.SelectedIndex <> -1 Then

            Dim m As clsModuleItem = CType(modules(_listbox.SelectedIndex), clsModuleItem)
            If m.ModuleId > -1 Then
                If Not oPag.DeleteModule(m.ModuleId) Then

                End If
            End If

        End If

        ' Redirect to the same page to pick up changes
        Response.Redirect(Request.RawUrl)

    End Sub

    Private Sub EditBtn_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles LeftEditBtn.Click, ContentEditBtn.Click, RightEditBtn.Click

        Dim pane As String = CType(sender, ImageButton).CommandArgument
        Dim _listbox As ListBox = CType(Page.FindControl(pane), ListBox)

        If _listbox.SelectedIndex <> -1 Then

            Dim NewModId As Integer = Int32.Parse(_listbox.SelectedItem.Value)

            ' Redirect to module settings page
            Response.Redirect(("EditModulePages.aspx?ModId=" & NewModId & "&PageId=" & PageID & "&ExpId=" & ModId))

        End If

    End Sub

    Private Sub PrepareFieldCombo(ByVal Selected As Boolean)
        Dim i As Integer
        For i = 0 To 1000
            ddlV.Items.Add(i.ToString)
            ddlC.Items.Add(i.ToString)
            ddlH.Items.Add(i.ToString)
        Next
        If Selected Then
            ddlV.SelectedValue = 0
            ddlC.SelectedValue = 0
            ddlH.SelectedValue = 0
        End If
    End Sub

    Private Sub btnBackPicture_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBackPicture.Click
        Response.Redirect("~/Server/Modules/Pages/EditPagesUpload.aspx?PageId=" & PageID)
    End Sub

End Class
