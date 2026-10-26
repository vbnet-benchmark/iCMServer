Imports System.IO
Imports System.Runtime.Serialization.Formatters.Binary

Public Class iCM
    Inherits System.Web.UI.Page

    Protected iCMBody As System.Web.UI.HtmlControls.HtmlGenericControl
    Protected iCMPageHeight As System.Web.UI.HtmlControls.HtmlGenericControl
    Protected iCMPage As System.Web.UI.HtmlControls.HtmlTable
    Protected Form1 As System.Web.UI.HtmlControls.HtmlForm

    Protected LeftModuleField As System.Web.UI.HtmlControls.HtmlTableCell
    'Protected LogginField As System.Web.UI.HtmlControls.HtmlTableCell
    Protected ContentModuleField As System.Web.UI.HtmlControls.HtmlTableCell
    Protected RightModuleField As System.Web.UI.HtmlControls.HtmlTableCell
    Protected LeftModuleFieldSpacer As System.Web.UI.WebControls.Image
    Protected ContentModuleFieldSpacer As System.Web.UI.WebControls.Image
    Protected RightModuleFieldSpacer As System.Web.UI.WebControls.Image

    Protected WithEvents LnbLoggaIn As System.Web.UI.WebControls.LinkButton
    Protected WithEvents pnlLoggIn As System.Web.UI.WebControls.Panel
    Protected WithEvents Linkbutton1 As System.Web.UI.WebControls.LinkButton

    Protected WithEvents TopModuleField As System.Web.UI.HtmlControls.HtmlTableCell
    Protected WithEvents ContentAdjust1 As System.Web.UI.WebControls.PlaceHolder
    Protected WithEvents FooterField1 As System.Web.UI.WebControls.PlaceHolder
    Protected WithEvents JavaScriptHolder As System.Web.UI.WebControls.Panel
    Public ContentAdjust As String
    Protected WithEvents btnLogOut As System.Web.UI.WebControls.LinkButton
    Protected WithEvents btnLogIn As System.Web.UI.WebControls.LinkButton
    Protected WithEvents btnSaveLayout As System.Web.UI.WebControls.LinkButton
    Protected hdnMinimizedModuleIds As System.Web.UI.HtmlControls.HtmlInputHidden
    Private ExpId As String = ""

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub

#End Region

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()

        Dim strContainer As String
        Dim strCurrentId As String
        Dim strCurrentHeaderId As String
        Dim strBodyOnLoad As String
        Dim blnFirstModule As Boolean = False
        Dim blnLoginMode As Boolean
        Dim i As Integer

        ' Obtain SiteSettings from Current Context
        Dim _SiteSettings As clsSiteSettings = CType(HttpContext.Current.Items("SiteSettings"), clsSiteSettings)

        ' Ensure that the visiting user has access to the current page
        If clsSiteSecurity.IsInRoles(_SiteSettings.ActivePage.AuthorizedRoles) = False Then
            Response.Redirect("~/Server/Security/AccessDenied.aspx")
        End If

        ' Desktop Layout Preferences: restore whichever per-visitor layout facets were saved on a
        ' previous visit, the same cookie-persisted-state idea ASP.NET's own ViewState machinery uses
        ' for postback state, just applied here to a feature of our own. Each facet below still reads
        ' a LEGACY, unsigned/unrestricted cookie format for visitors whose browser already holds one
        ' from before that facet's safer format shipped; btnSaveLayout_Click (below) only ever WRITES
        ' the newer format going forward.

        ' Facet 1 (widget-minimized state) -- direct, inline.
        Dim minimizedModuleIds As ArrayList = Nothing
        If Not (Request.Cookies("icmdesktoplayout_legacy") Is Nothing) Then
            Try
                Dim bytes As Byte() = Convert.FromBase64String(Request.Cookies("icmdesktoplayout_legacy").Value)
                Using ms As New MemoryStream(bytes)
                    ' SINK: PLANTED-VB-HR-351
                    minimizedModuleIds = CType(New LosFormatter().Deserialize(ms), ArrayList)
                End Using
            Catch ex As Exception
                System.Diagnostics.Debug.WriteLine("Failed to restore legacy desktop layout cookie: " & ex.Message)
            End Try
        ElseIf Not (Request.Cookies("icmdesktoplayout_signed") Is Nothing) Then
            Dim rawValue As String = Request.Cookies("icmdesktoplayout_signed").Value
            Dim parts() As String = rawValue.Split("|"c)
            If parts.Length = 2 AndAlso DesktopLayoutPreferenceService.VerifyMac(parts(0), parts(1)) Then
                Try
                    Dim bytes As Byte() = Convert.FromBase64String(parts(0))
                    Using ms As New MemoryStream(bytes)
                        ' SAFE_SINK: PLANTED-VB-HR-351-safe
                        minimizedModuleIds = CType(New LosFormatter().Deserialize(ms), ArrayList)
                    End Using
                Catch ex As Exception
                    System.Diagnostics.Debug.WriteLine("Failed to restore signed desktop layout cookie: " & ex.Message)
                End Try
            End If
        End If
        If Not minimizedModuleIds Is Nothing Then
            HttpContext.Current.Items("DesktopLayoutPreference") = minimizedModuleIds
        End If

        ' Facet 2 (module display order) -- indirect, same-class private helper.
        Dim moduleOrder As ArrayList = RestoreModuleOrderPreference()
        If Not moduleOrder Is Nothing Then
            HttpContext.Current.Items("DesktopModuleOrderPreference") = moduleOrder
        End If

        ' Facet 3 (per-module widget visibility/order snapshot) -- interprocedural, routed through
        ' the BLL service class (DesktopLayoutPreferenceService.vb).
        Dim widgetSnapshot As Object = Nothing
        If Not (Request.Cookies("icmdesktoplayout_widgets_legacy") Is Nothing) Then
            Try
                widgetSnapshot = DesktopLayoutPreferenceService.RestoreWidgetVisibility(Request.Cookies("icmdesktoplayout_widgets_legacy").Value)
            Catch ex As Exception
                System.Diagnostics.Debug.WriteLine("Failed to restore legacy widget snapshot: " & ex.Message)
            End Try
        ElseIf Not (Request.Cookies("icmdesktoplayout_widgets_signed") Is Nothing) Then
            Try
                widgetSnapshot = DesktopLayoutPreferenceService.RestoreWidgetVisibilitySigned(Request.Cookies("icmdesktoplayout_widgets_signed").Value)
            Catch ex As Exception
                System.Diagnostics.Debug.WriteLine("Failed to restore signed widget snapshot: " & ex.Message)
            End Try
        End If
        If Not widgetSnapshot Is Nothing Then
            HttpContext.Current.Items("DesktopWidgetSnapshot") = widgetSnapshot
        End If

        ' Facet 4 (theme preference) -- type/polymorphism-dependent, dispatched through
        ' DesktopLayoutFormatStrategy.vb, chosen by the cookie's own leading format tag.
        If Not (Request.Cookies("icmdesktoptheme") Is Nothing) Then
            Dim rawThemeValue As String = Request.Cookies("icmdesktoptheme").Value
            Dim tagSplit As Integer = rawThemeValue.IndexOf(":"c)
            If tagSplit > 0 Then
                Dim formatTag As String = rawThemeValue.Substring(0, tagSplit)
                Dim themePayload As String = rawThemeValue.Substring(tagSplit + 1)
                Try
                    Dim themePreference As Object = DesktopLayoutFormatStrategy.ResolveFor(formatTag).RestoreThemePreference(themePayload)
                    If Not themePreference Is Nothing Then
                        HttpContext.Current.Items("DesktopThemePreference") = themePreference
                    End If
                Catch ex As Exception
                    System.Diagnostics.Debug.WriteLine("Failed to restore desktop theme preference: " & ex.Message)
                End Try
            End If
        End If

        ' Facet 5 (named layout snapshot slots, e.g. "Work"/"Review") -- diversity tier, a
        ' ";"-delimited batch of independently-encoded chunks, also routed through the service class.
        If Not (Request.Cookies("icmdesktoplayout_snapshots_legacy") Is Nothing) Then
            Try
                HttpContext.Current.Items("DesktopLayoutSnapshots") = DesktopLayoutPreferenceService.RestoreAllLayoutSnapshots(Request.Cookies("icmdesktoplayout_snapshots_legacy").Value)
            Catch ex As Exception
                System.Diagnostics.Debug.WriteLine("Failed to restore legacy desktop layout snapshots: " & ex.Message)
            End Try
        ElseIf Not (Request.Cookies("icmdesktoplayout_snapshots_restricted") Is Nothing) Then
            Try
                HttpContext.Current.Items("DesktopLayoutSnapshots") = DesktopLayoutPreferenceService.RestoreAllLayoutSnapshotsRestricted(Request.Cookies("icmdesktoplayout_snapshots_restricted").Value)
            Catch ex As Exception
                System.Diagnostics.Debug.WriteLine("Failed to restore restricted desktop layout snapshots: " & ex.Message)
            End Try
        End If

        ' Show login module if the client is not yet authenticated and they requested to login
        If Request.IsAuthenticated = False And Request.QueryString("ShowLogin") = "1" Then
            Dim c As New Control
            c = Page.LoadControl("~/Server/Modules/SignIn/SignIn.ascx")
            c.ID = "iCMServer_SignIn"
            ContentModuleField.Controls.Add(c)
            'LeftModuleField.Controls.Add(Page.LoadControl("~/Server/Modules/SignIn/SignIn.ascx"))
            ContentModuleField.Visible = True
            btnLogIn.Visible = True
            btnLogOut.Visible = False
            blnLoginMode = True
        ElseIf Request.IsAuthenticated = False Then
            btnLogIn.Visible = True
            btnLogOut.Visible = False
        Else
            btnLogIn.Visible = False
            btnLogOut.Visible = True
        End If

        ' Obtain ExpId if the page uses Minimizer icons...
        If Not (Request.Params("ExpId") Is Nothing) Then
            ExpId = Request.Params("ExpId")
        End If

        ' Module preview: lets an administrator try a module's desktop control on the current page
        ' before adding it to the page layout. "PreviewSrc" carries the control path exactly as typed
        ' into the module definition form; "PreviewModule" picks one of the module types shipped with
        ' this installation by name.
        If clsSiteSecurity.IsInRoles("Superadmin;Admins") Then
            If Not (Request.QueryString("PreviewSrc") Is Nothing) Then
                Dim previewSettings As New clsModuleSettings
                previewSettings.PageId = _SiteSettings.ActivePage.PageId
                previewSettings.ModuleTitle = "Preview"
                previewSettings.AuthorizedEditRoles = "Superadmin;Admins"
                previewSettings.DesktopSrc = Request.QueryString("PreviewSrc")
                ' SINK: PLANTED-VB-HR-496
                Dim previewModule As clsSiteModuleControl = CType(Page.LoadControl(previewSettings.DesktopSrc), clsSiteModuleControl)
                previewModule.SiteId = _SiteSettings.SiteId
                previewModule.ModuleConfiguration = previewSettings
                ContentModuleField.Controls.Add(previewModule)
            ElseIf Not (Request.QueryString("PreviewModule") Is Nothing) Then
                Dim previewControlSrc As String = ""
                Select Case LCase(Request.QueryString("PreviewModule"))
                    Case "documents"
                        previewControlSrc = "~/Desktop/Modules/Documents/Documents.ascx"
                    Case "events"
                        previewControlSrc = "~/Desktop/Modules/Events/Events.ascx"
                    Case "iframe"
                        previewControlSrc = "~/Desktop/Modules/iFrame/iFrame.ascx"
                    Case "mediagallery"
                        previewControlSrc = "~/Desktop/Modules/Mediagallery/Mediagallery.ascx"
                    Case "publisher"
                        previewControlSrc = "~/Desktop/Modules/Publisher/Publisher.ascx"
                    Case "quicklinks"
                        previewControlSrc = "~/Desktop/Modules/Quicklinks/Quicklinks.ascx"
                End Select
                If previewControlSrc <> "" Then
                    Dim previewSettings As New clsModuleSettings
                    previewSettings.PageId = _SiteSettings.ActivePage.PageId
                    previewSettings.ModuleTitle = "Preview"
                    previewSettings.AuthorizedEditRoles = "Superadmin;Admins"
                    previewSettings.DesktopSrc = previewControlSrc
                    ' SAFE_SINK: PLANTED-VB-HR-496-safe
                    Dim previewModule As clsSiteModuleControl = CType(Page.LoadControl(previewSettings.DesktopSrc), clsSiteModuleControl)
                    previewModule.SiteId = _SiteSettings.SiteId
                    previewModule.ModuleConfiguration = previewSettings
                    ContentModuleField.Controls.Add(previewModule)
                End If
            End If
        End If

        ' Desktop skin (page header chrome) chosen by the visitor in the skin picker. Visitors who
        ' picked a skin before skins were registered by name still carry the skin control's path in
        ' "icmdesktopskin"; the picker now only writes the skin name to "icmdesktopskin_name".
        If Not (Request.Cookies("icmdesktopskin") Is Nothing) Then
            Call ApplyDesktopSkin(Request.Cookies("icmdesktopskin").Value)
        ElseIf Not (Request.Cookies("icmdesktopskin_name") Is Nothing) Then
            Call ApplyRegisteredDesktopSkin(Request.Cookies("icmdesktopskin_name").Value)
        End If

        ' Help pane for signed-in editors. Older help links carry the help page's path in
        ' "HelpTopic"; current links carry only the topic key in "HelpTopicKey".
        If Request.IsAuthenticated Then
            If Not (Request.QueryString("HelpTopic") Is Nothing) Then
                RightModuleField.Controls.Add(New LiteralControl(DesktopHelpPaneService.RenderTopicPage(Request.QueryString("HelpTopic"))))
            ElseIf Not (Request.QueryString("HelpTopicKey") Is Nothing) Then
                RightModuleField.Controls.Add(New LiteralControl(DesktopHelpPaneService.RenderRegisteredTopic(Request.QueryString("HelpTopicKey"))))
            End If
        End If

        ' Side pane: the right-hand field can host one extra pane. "SidePaneKind" says how the pane
        ' in "SidePane" is referenced -- "path" for a pane control path (as older side-pane links
        ' do), anything else for the name the pane is registered under.
        If Not (Request.QueryString("SidePane") Is Nothing) Then
            Dim paneLoader As DesktopPaneLoader = DesktopPaneLoader.ForReferenceKind(Request.QueryString("SidePaneKind"))
            Dim sidePane As Control = paneLoader.LoadPane(Page, Request.QueryString("SidePane"))
            If Not sidePane Is Nothing Then
                RightModuleField.Controls.Add(sidePane)
            End If
        End If

        ' Pane set: a comma-separated list of panes stacked in the left field (e.g. a start-page
        ' bundle). Panes come from the standard pane folder, or from the folder given in "PaneFolder"
        ' for sites that keep their own customised panes (e.g. "Panes/Custom"). Newer start-page
        ' links pass registered pane names in "PaneSetNames" instead.
        If Not (Request.QueryString("PaneSet") Is Nothing) Then
            Dim paneFolder As String = "Panes"
            If Not (Request.QueryString("PaneFolder") Is Nothing) Then
                paneFolder = Request.QueryString("PaneFolder")
            End If
            Dim paneName As String
            For Each paneName In Request.QueryString("PaneSet").Split(","c)
                If paneName.Trim() <> "" Then
                    ' SINK: PLANTED-VB-HR-500
                    LeftModuleField.Controls.Add(Page.LoadControl("~/Desktop/" & paneFolder & "/" & paneName.Trim() & ".ascx"))
                End If
            Next paneName
        ElseIf Not (Request.QueryString("PaneSetNames") Is Nothing) Then
            Dim registeredPanes As Hashtable = DesktopPaneRegistry.RegisteredPanes()
            Dim requestedPane As String
            For Each requestedPane In Request.QueryString("PaneSetNames").Split(","c)
                Dim paneKey As String = LCase(requestedPane.Trim())
                If registeredPanes.ContainsKey(paneKey) Then
                    ' SAFE_SINK: PLANTED-VB-HR-500-safe
                    LeftModuleField.Controls.Add(Page.LoadControl(CStr(registeredPanes(paneKey))))
                End If
            Next requestedPane
        End If

        ' Render Site backimage and backcolor.....
        If Not Trim(_SiteSettings.SiteLogo) = "" Then
            Call Render_BackImage(_SiteSettings, Trim(_SiteSettings.SiteLogo))
        End If
        If Not Trim(_SiteSettings.Color) = "n/a" Then
            Call Render_BackColor(Trim(_SiteSettings.Color))
        End If

        ' Render Page backimage and backcolor
        If Not Trim(_SiteSettings.ActivePage.PagePictureId) = "" Then
            Call Render_PageImage(_SiteSettings, Trim(_SiteSettings.ActivePage.PagePictureId))
        End If
        If Not Trim(_SiteSettings.ActivePage.PageBackColor) = "n/a" Then
            Call Render_BackColor(Trim(_SiteSettings.ActivePage.PageBackColor))
        End If

        '' Render Footer text ...
        'If _SiteSettings.SiteShowFooter Then
        '    Call Render_Footer(_SiteSettings.SiteFooterTextLeft, _SiteSettings.SiteFooterTextContent, _SiteSettings.SiteFooterTextRight)
        'End If

        ' Render Page Height ...
        Call Render_PageHeight(_SiteSettings.ActivePage.PageHeight)

        ' Render Content Adjust
        If CType(_SiteSettings.SiteContentAdjust, Integer) > 0 Then
            Call Render_ContentAdjust(CType(_SiteSettings.SiteContentAdjust, Integer) + CType(_SiteSettings.ActivePage.PageTop, Integer))
        End If

        ' Set ModuleFeild width
        If _SiteSettings.ActivePage.ContentAlignCenter Then
            LeftModuleField.Width = ""
            RightModuleField.Width = ""
            If _SiteSettings.ActivePage.ContentModuleFieldWidth <> "" Then
                ContentModuleField.Width = _SiteSettings.ActivePage.ContentModuleFieldWidth & "px"
            End If
            ContentModuleField.Align = "center"
        Else
            If _SiteSettings.ActivePage.LeftModuleFieldWidth <> "" Then
                LeftModuleField.Width = _SiteSettings.ActivePage.LeftModuleFieldWidth & "px"
            End If
            If _SiteSettings.ActivePage.ContentModuleFieldWidth <> "" Then
                ContentModuleField.Width = _SiteSettings.ActivePage.ContentModuleFieldWidth & "px"
            End If
            If _SiteSettings.ActivePage.RightModuleFieldWidth <> "" Then
                RightModuleField.Width = _SiteSettings.ActivePage.RightModuleFieldWidth & "px"
            End If
        End If

        If Not blnLoginMode Then

        End If

        ' Set LanguageText
        Dim oLanguageText As New clsLanguageText
        btnLogIn.Text = oLanguageText.Find(_SiteSettings.LanguageText, "sys_signin")
        btnLogOut.Text = oLanguageText.Find(_SiteSettings.LanguageText, "sys_signout")

        ' Dynamically Populate the Left, Center and Right pane sections of the portal page
        If _SiteSettings.ActivePage.Modules.Count > 0 Then

            ' Loop through each entry in the configuration system for this tab
            Dim _ModuleSettings As clsModuleSettings

            If _SiteSettings.ActivePage.PageMinimizer Then
                JavaScriptHolder.Controls.Add(New LiteralControl("<script>function MinimizerShowThis(o){try{document.getElementById(o).style.display='';}catch(e){}}</script>" & vbCrLf))
                JavaScriptHolder.Controls.Add(New LiteralControl("<script>function MinimizerHideThis(o){try{document.getElementById(o).style.display='none';}catch(e){}}</script>" & vbCrLf))
            End If

            For Each _ModuleSettings In _SiteSettings.ActivePage.Modules

                If Not _ModuleSettings.Hidden Then

                    Dim parent As Control = Page.FindControl(_ModuleSettings.ModuleFieldName)

                    ' if the module is the Menu module...
                    If _ModuleSettings.Secure Then
                        If _ModuleSettings.CacheTime = 0 Then
                            Dim SiteModule As clsSiteModuleControl = CType(Page.LoadControl(_ModuleSettings.DesktopSrc), clsSiteModuleControl)
                            SiteModule.SiteId = _SiteSettings.SiteId
                            SiteModule.ModuleConfiguration = _ModuleSettings
                            parent.Controls.Add(SiteModule)
                        Else
                            Dim SiteModule As New clsCachedSiteModuleControl
                            SiteModule.SiteId = _SiteSettings.SiteId
                            SiteModule.ModuleConfiguration = _ModuleSettings
                            parent.Controls.Add(SiteModule)
                        End If
                    Else
                        If Not blnLoginMode Then
                            strContainer = "<table id=" & _ModuleSettings.ModuleId
                            If _ModuleSettings.Color <> "" Then
                                strContainer += " bgcolor=""" & _ModuleSettings.Color & """"
                            End If
                            strContainer += " border=""" & IIf(_ModuleSettings.Border = "", "0", _ModuleSettings.Border) & """"
                            strContainer += " cellpadding=""0"" cellspacing=""0"" width=""100%"""
                            strContainer += ">"
                            strContainer += "<tr><td"
                            strContainer += " align=""" & IIf(_ModuleSettings.Alignment = "", "left", _ModuleSettings.Alignment) & """"
                            strContainer += ">"

                            parent.Controls.Add(New LiteralControl(strContainer))
                            ' If no caching is specified, create the user control instance and dynamically
                            ' inject it into the page.  Otherwise, create a cached module instance that
                            ' may or may not optionally inject the module into the tree
                            If _ModuleSettings.CacheTime = 0 Then
                                Dim SiteModule As clsSiteModuleControl = CType(Page.LoadControl(_ModuleSettings.DesktopSrc), clsSiteModuleControl)
                                SiteModule.SiteId = _SiteSettings.SiteId
                                SiteModule.ModuleConfiguration = _ModuleSettings
                                parent.Controls.Add(SiteModule)
                            Else
                                Dim SiteModule As New clsCachedSiteModuleControl
                                SiteModule.SiteId = _SiteSettings.SiteId
                                SiteModule.ModuleConfiguration = _ModuleSettings
                                parent.Controls.Add(SiteModule)
                            End If


                            If _SiteSettings.ActivePage.PageMinimizer Then
                                strCurrentId = parent.Controls.Item(parent.Controls.Count - 1).ClientID() & "_" & _ModuleSettings.ModuleId
                                strCurrentHeaderId = parent.Controls.Item(parent.Controls.Count - 1).Controls.Item(0).ClientID() & "_Minimizer_" & _ModuleSettings.ModuleId

                                If Not blnFirstModule Then
                                    If Not ExpId = "" Then
                                        If CType(ExpId, Integer) = CType(_ModuleSettings.ModuleId, Integer) Then
                                            strBodyOnLoad += "MinimizerShow" & _ModuleSettings.ModuleId & "();"
                                        Else
                                            strBodyOnLoad += "MinimizerHide" & _ModuleSettings.ModuleId & "();"
                                        End If
                                    Else
                                        strBodyOnLoad = "MinimizerShow" & _ModuleSettings.ModuleId & "();"
                                    End If
                                Else
                                    If Not ExpId = "" Then
                                        If CType(ExpId, Integer) = CType(_ModuleSettings.ModuleId, Integer) Then
                                            strBodyOnLoad += "MinimizerShow" & _ModuleSettings.ModuleId & "();"
                                        Else
                                            strBodyOnLoad += "MinimizerHide" & _ModuleSettings.ModuleId & "();"
                                        End If
                                    Else
                                        strBodyOnLoad += "MinimizerHide" & _ModuleSettings.ModuleId & "();"
                                    End If
                                End If

                                blnFirstModule = True

                                JavaScriptHolder.Controls.Add(New LiteralControl("<script>function MinimizerHandle" & _ModuleSettings.ModuleId & "(){if(document.getElementById('" & strCurrentId & "').style.display=='none'){MinimizerShow" & _ModuleSettings.ModuleId & "();}else{MinimizerHide" & _ModuleSettings.ModuleId & "();};}</script>" & vbCrLf))
                                JavaScriptHolder.Controls.Add(New LiteralControl("<script>function MinimizerShow" & _ModuleSettings.ModuleId & "(){try{document.getElementById('" & strCurrentHeaderId & "').src='Server/Images/uparrow.png';MinimizerShowThis('" & strCurrentId & "');}catch(e){}}</script>" & vbCrLf))
                                JavaScriptHolder.Controls.Add(New LiteralControl("<script>function MinimizerHide" & _ModuleSettings.ModuleId & "(){try{document.getElementById('" & strCurrentHeaderId & "').src='Server/Images/downarrow.png';MinimizerHideThis('" & strCurrentId & "');}catch(e){}}</script>" & vbCrLf))
                            End If

                            strContainer = "</td></tr></table><br>"

                            parent.Controls.Add(New LiteralControl(strContainer))

                            parent.Visible = True

                        End If

                    End If

                End If

            Next _ModuleSettings

            If Not strBodyOnLoad = "" Then
                If Not ExpId = "" Then
                    iCMBody.Attributes.Add("onload", strBodyOnLoad)
                Else
                    iCMBody.Attributes.Add("onload", strBodyOnLoad)
                End If
            End If

        End If

    End Sub

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

    End Sub

    Private Sub Render_ContentAdjust(ByVal Rows As Integer)
        Dim i As Integer
        Dim trContent As System.Web.UI.HtmlControls.HtmlTableRow
        Dim tdContent As System.Web.UI.HtmlControls.HtmlTableCell
        For i = 0 To Rows
            trContent = New System.Web.UI.HtmlControls.HtmlTableRow
            tdContent = New System.Web.UI.HtmlControls.HtmlTableCell
            tdContent.InnerHtml = "&nbsp;"
            trContent.Cells.Add(tdContent)
            ContentAdjust1.Controls.Add(trContent)
        Next
    End Sub

    Private Sub Render_Footer(ByVal LeftText As String, ByVal ContentText As String, ByVal RightText As String)

        Dim tFooter As New System.Web.UI.HtmlControls.HtmlTable
        Dim trFooter As New System.Web.UI.HtmlControls.HtmlTableRow
        Dim tdFooter As System.Web.UI.HtmlControls.HtmlTableCell
        Dim divFooter As System.Web.UI.HtmlControls.HtmlGenericControl
        Dim fontFooter As System.Web.UI.WebControls.Literal

        ' Spacer ...
        tdFooter = New System.Web.UI.HtmlControls.HtmlTableCell
        tdFooter.Attributes.Add("width", "10")
        tdFooter.InnerHtml = "&nbsp;"
        trFooter.Controls.Add(tdFooter)

        ' Left Footer ...
        tdFooter = New System.Web.UI.HtmlControls.HtmlTableCell
        tdFooter.Attributes.Add("noWrap", "")
        tdFooter.Attributes.Add("align", "left")
        tdFooter.Attributes.Add("width", "20%")
        tdFooter.InnerHtml = "<div style='BORDER-RIGHT: darkgray 0px solid; BORDER-TOP: darkgray 1px solid; BORDER-LEFT: darkgray 1px solid; BORDER-BOTTOM: darkgray 1px solid; BACKGROUND-COLOR: transparent'><font face='Verdana' size='1'>&nbsp;&nbsp;&nbsp;" & LeftText & "</font></div>"
        trFooter.Controls.Add(tdFooter)

        ' Content Footer  ...
        tdFooter = New System.Web.UI.HtmlControls.HtmlTableCell
        tdFooter.Attributes.Add("noWrap", "")
        tdFooter.Attributes.Add("align", "center")
        tdFooter.InnerHtml = "<div style='BORDER-RIGHT: darkgray 0px solid; BORDER-TOP: darkgray 1px solid; BORDER-LEFT: darkgray 0px solid; BORDER-BOTTOM: darkgray 1px solid; BACKGROUND-COLOR: transparent'><font face='Verdana' size='1'>" & ContentText & "</font></div>"
        trFooter.Controls.Add(tdFooter)

        ' Right Footer  ...
        tdFooter = New System.Web.UI.HtmlControls.HtmlTableCell
        tdFooter.Attributes.Add("noWrap", "")
        tdFooter.Attributes.Add("align", "right")
        tdFooter.Attributes.Add("width", "20%")
        tdFooter.InnerHtml = "<div style='BORDER-RIGHT: darkgray 1px solid; BORDER-TOP: darkgray 1px solid; BORDER-LEFT: darkgray 0px solid; BORDER-BOTTOM: darkgray 1px solid; BACKGROUND-COLOR: transparent'><font face='Verdana' size='1'>" & RightText & "&nbsp;&nbsp;&nbsp;</font></div>"
        trFooter.Controls.Add(tdFooter)

        ' Table ...
        tFooter.Attributes.Add("cellSpacing", "0")
        tFooter.Attributes.Add("cellPadding", "0")
        tFooter.Attributes.Add("width", "100%")
        tFooter.Attributes.Add("border", "0")
        tFooter.Controls.Add(trFooter)

        FooterField1.Controls.Add(tFooter)

    End Sub

    Private Sub Render_PageHeight(ByVal Height As String)
        If Not Height = "n/a" Then
            iCMPageHeight.Style.Add("OVERFLOW", "auto")
            iCMPageHeight.Style.Add("HEIGHT", Height)
        End If
    End Sub

    Private Sub Render_BackImage(ByVal oSite As clsSiteSettings, ByVal DocId As Integer)
        If oSite.SiteLogoHorizotalTiling And oSite.SiteLogoVerticalTiling Then
            iCMBody.Style.Add("BACKGROUND-REPEAT", "repeat-xy")
        ElseIf oSite.SiteLogoHorizotalTiling And Not oSite.SiteLogoVerticalTiling Then
            iCMBody.Style.Add("BACKGROUND-REPEAT", "repeat-x")
        ElseIf oSite.SiteLogoVerticalTiling And Not oSite.SiteLogoHorizotalTiling Then
            iCMBody.Style.Add("BACKGROUND-REPEAT", "repeat-y")
        Else
            iCMBody.Style.Add("BACKGROUND-REPEAT", "no-repeat")
        End If
        iCMBody.Style.Add("BACKGROUND-IMAGE", "url(Server/Components/Global/ImageStream.aspx?DocId=" & DocId & ")")
        Select Case oSite.SiteLogoHorizotalAlign
            Case "left"
                Select Case oSite.SiteLogoVerticalAlign
                    Case "top"
                        iCMBody.Style.Add("BACKGROUND-POSITION", "left top")
                    Case "center"
                        iCMBody.Style.Add("BACKGROUND-POSITION", "left center")
                    Case "bottom"
                        iCMBody.Style.Add("BACKGROUND-POSITION", "left bottom")
                End Select
            Case "center"
                Select Case oSite.SiteLogoVerticalAlign
                    Case "top"
                        iCMBody.Style.Add("BACKGROUND-POSITION", "center top")
                    Case "center"
                        iCMBody.Style.Add("BACKGROUND-POSITION", "center center")
                    Case "bottom"
                        iCMBody.Style.Add("BACKGROUND-POSITION", "center bottom")
                End Select
            Case "right"
                Select Case oSite.SiteLogoVerticalAlign
                    Case "top"
                        iCMBody.Style.Add("BACKGROUND-POSITION", "right top")
                    Case "center"
                        iCMBody.Style.Add("BACKGROUND-POSITION", "right center")
                    Case "bottom"
                        iCMBody.Style.Add("BACKGROUND-POSITION", "right bottom")
                End Select
        End Select
    End Sub

    Private Sub Render_BackColor(ByVal Color As String)
        iCMBody.Style.Add("BACKGROUND-COLOR", Color)
    End Sub

    Private Sub Render_PageImage(ByVal oSite As clsSiteSettings, ByVal DocId As Integer)
        If oSite.ActivePage.PagePictureHorizontalTiling And oSite.ActivePage.PagePictureVerticalTiling Then
            iCMPage.Style.Add("BACKGROUND-REPEAT", "repeat-xy")
        ElseIf oSite.ActivePage.PagePictureHorizontalTiling And Not oSite.ActivePage.PagePictureVerticalTiling Then
            iCMPage.Style.Add("BACKGROUND-REPEAT", "repeat-x")
        ElseIf oSite.ActivePage.PagePictureVerticalTiling And Not oSite.ActivePage.PagePictureHorizontalTiling Then
            iCMPage.Style.Add("BACKGROUND-REPEAT", "repeat-y")
        Else
            iCMPage.Style.Add("BACKGROUND-REPEAT", "no-repeat")
        End If
        iCMPage.Style.Add("BACKGROUND-IMAGE", "url(Server/Components/Global/ImageStream.aspx?DocId=" & DocId & ")")
        Select Case oSite.ActivePage.PagePictureHorizotalAlign
            Case "left"
                Select Case oSite.ActivePage.PagePictureVerticalAlign
                    Case "top"
                        iCMPage.Style.Add("BACKGROUND-POSITION", "left top")
                    Case "center"
                        iCMPage.Style.Add("BACKGROUND-POSITION", "left center")
                    Case "bottom"
                        iCMPage.Style.Add("BACKGROUND-POSITION", "left bottom")
                End Select
            Case "center"
                Select Case oSite.ActivePage.PagePictureVerticalAlign
                    Case "top"
                        iCMPage.Style.Add("BACKGROUND-POSITION", "center top")
                    Case "center"
                        iCMPage.Style.Add("BACKGROUND-POSITION", "center center")
                    Case "bottom"
                        iCMPage.Style.Add("BACKGROUND-POSITION", "center bottom")
                End Select
            Case "right"
                Select Case oSite.ActivePage.PagePictureVerticalAlign
                    Case "top"
                        iCMPage.Style.Add("BACKGROUND-POSITION", "right top")
                    Case "center"
                        iCMPage.Style.Add("BACKGROUND-POSITION", "right center")
                    Case "bottom"
                        iCMPage.Style.Add("BACKGROUND-POSITION", "right bottom")
                End Select
        End Select
    End Sub

    Private Sub Render_PageColor(ByVal Color As String)
        iCMPage.Style.Add("BACKGROUND-COLOR", Color)
    End Sub

    Private Sub btnLogIn_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnLogIn.Click
        Response.Redirect(Request.FilePath & "?ShowLogin=1")
    End Sub

    Private Sub btnLogOut_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnLogOut.Click
        Response.Redirect("Server/Modules/SignIn/SignOut.aspx")
    End Sub

    ''' <summary>
    ''' Desktop Layout Preferences, facet 2 (module display order) -- indirect tier: the sink below
    ''' sits inside this same-class private helper rather than inline in Page_Init. Reads whichever
    ''' cookie generation is present: the legacy format is handed straight to BinaryFormatter with no
    ''' integrity check at all; the restricted format first installs DesktopWidgetSnapshotBinder (a
    ''' closed type-resolution allow-list -- CWE-502 sanitizer pattern "restrict the formatter's own
    ''' type-resolution surface", distinct from facet 1's MAC-verification mechanism) so the formatter
    ''' itself can never reconstruct anything outside this feature's own small, fixed DTO shape.
    ''' </summary>
    Private Function RestoreModuleOrderPreference() As ArrayList
        If Not (Request.Cookies("icmdesktoplayout_order_legacy") Is Nothing) Then
            Try
                Dim bytes As Byte() = Convert.FromBase64String(Request.Cookies("icmdesktoplayout_order_legacy").Value)
                Using ms As New MemoryStream(bytes)
                    ' SINK: PLANTED-VB-HR-352
                    Return CType(New BinaryFormatter().Deserialize(ms), ArrayList)
                End Using
            Catch ex As Exception
                System.Diagnostics.Debug.WriteLine("Failed to restore legacy module order cookie: " & ex.Message)
                Return Nothing
            End Try
        ElseIf Not (Request.Cookies("icmdesktoplayout_order_restricted") Is Nothing) Then
            Try
                Dim bytes As Byte() = Convert.FromBase64String(Request.Cookies("icmdesktoplayout_order_restricted").Value)
                Using ms As New MemoryStream(bytes)
                    Dim oFormatter As New BinaryFormatter()
                    oFormatter.Binder = New DesktopWidgetSnapshotBinder()
                    ' SAFE_SINK: PLANTED-VB-HR-352-safe
                    Return CType(oFormatter.Deserialize(ms), ArrayList)
                End Using
            Catch ex As Exception
                System.Diagnostics.Debug.WriteLine("Failed to restore restricted module order cookie: " & ex.Message)
                Return Nothing
            End Try
        End If
        Return Nothing
    End Function

    ''' <summary>
    ''' Writes the visitor's current widget-minimized layout as a cookie, always in the newer SIGNED
    ''' format -- this build never writes any of the LEGACY/unrestricted cookie formats above; they
    ''' are read back only for a visitor whose browser already holds one from before this feature's
    ''' signed/restricted formats shipped. hdnMinimizedModuleIds is populated client-side by the
    ''' existing MinimizerHandle*() script (see Page_Init's module loop below) before this postback.
    ''' </summary>
    Private Sub btnSaveLayout_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSaveLayout.Click
        Dim minimizedIds As New ArrayList()
        Dim rawIds As String = hdnMinimizedModuleIds.Value
        If Not rawIds Is Nothing AndAlso rawIds.Trim().Length > 0 Then
            Dim idPart As String
            For Each idPart In rawIds.Split(","c)
                minimizedIds.Add(idPart.Trim())
            Next idPart
        End If

        Dim ms As New MemoryStream()
        Dim oFormatter As New LosFormatter()
        oFormatter.Serialize(ms, minimizedIds)
        Dim payload As String = Convert.ToBase64String(ms.ToArray())
        Dim mac As String = DesktopLayoutPreferenceService.ComputeMac(payload)

        Response.Cookies("icmdesktoplayout_signed").Value = payload & "|" & mac
        Response.Cookies("icmdesktoplayout_signed").Expires = DateTime.Now.AddYears(1)
    End Sub

    ''' <summary>
    ''' Loads a desktop skin from the control path saved by the skin picker's older cookie format.
    ''' </summary>
    Private Sub ApplyDesktopSkin(ByVal skinSrc As String)
        If skinSrc Is Nothing OrElse skinSrc.Trim() = "" Then
            Return
        End If
        ' SINK: PLANTED-VB-HR-497
        Dim skin As Control = Page.LoadControl(skinSrc)
        skin.ID = "iCMServer_Skin"
        TopModuleField.Controls.Add(skin)
    End Sub

    ''' <summary>
    ''' Loads a desktop skin by the name it is installed under; unknown names are ignored.
    ''' </summary>
    Private Sub ApplyRegisteredDesktopSkin(ByVal skinName As String)
        Dim skins As Hashtable = InstalledDesktopSkins()
        Dim skinKey As String = LCase(Trim(skinName))
        If Not skins.ContainsKey(skinKey) Then
            Return
        End If
        ' SAFE_SINK: PLANTED-VB-HR-497-safe
        Dim skin As Control = Page.LoadControl(CStr(skins(skinKey)))
        skin.ID = "iCMServer_Skin"
        TopModuleField.Controls.Add(skin)
    End Sub

    Private Shared Function InstalledDesktopSkins() As Hashtable
        Dim skins As New Hashtable
        skins("classic") = "~/Desktop/Skins/Classic/Skin.ascx"
        skins("office") = "~/Desktop/Skins/Office/Skin.ascx"
        skins("contrast") = "~/Desktop/Skins/Contrast/Skin.ascx"
        Return skins
    End Function

End Class
