
Imports System.Web

Public MustInherit Class Menu : Inherits clsSiteModuleControl

    Public MenuContainer(4, 0) As String

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents PlaceHolder1 As System.Web.UI.WebControls.PlaceHolder

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
        ' Obtain PortalSettings from Current Context
        Dim _SiteSettings As clsSiteSettings = CType(HttpContext.Current.Items("SiteSettings"), clsSiteSettings)
        Dim Index As Integer

        ' Dynamically render portal tab strip
        Index = _SiteSettings.ActivePage.PageId
        Dim iPages As Integer = 0
        Dim i As Integer

        For i = 0 To _SiteSettings.DesktopPages.Count - 1
            Dim Page As clsPageStripDetails = CType(_SiteSettings.DesktopPages(i), clsPageStripDetails)
            If clsSiteSecurity.IsInRoles(Page.AuthorizedRoles) And Page.IsVisible Then
                If SourceSubMenuIsAuthenticated(Page.PageParentId) Then
                    ReDim Preserve MenuContainer(4, iPages)
                    MenuContainer(0, iPages) = Page.PageId
                    MenuContainer(1, iPages) = Page.PageName
                    MenuContainer(2, iPages) = Page.PageOrder
                    MenuContainer(3, iPages) = Page.AuthorizedRoles
                    MenuContainer(4, iPages) = Page.PageParentId
                    iPages += 1
                End If
            End If
        Next i

    End Sub

    Private Sub Render_Standard()
        Response.Write("<script language='JavaScript1.2' src='Server/Js/coolmenus4.js'></script>" & vbCrLf)
        Response.Write("<script language='JavaScript1.2' src='Server/Js/cm_addins.js'></script>" & vbCrLf)
        Response.Write("<script>" & vbCrLf)
        Response.Write("/*****************************************************************************" & vbCrLf)
        Response.Write("Copyright (c) 2001 Thomas Brattli (webmaster@dhtmlcentral.com) DHTML coolMenus" & vbCrLf)
        Response.Write("- Get it at coolmenus.dhtmlcentral.com Version 4.0_beta This script can be used" & vbCrLf)
        Response.Write("freely as long as all copyright messages are intact. Extra info - Coolmenus" & vbCrLf)
        Response.Write("reference/help - Extra links to help files **** CSS help:" & vbCrLf)
        Response.Write("http://192.168.1.31/projects/coolmenus/reference.asp?m=37 General:" & vbCrLf)
        Response.Write("http://coolmenus.dhtmlcentral.com/reference.asp?m=3 Menu properties:" & vbCrLf)
        Response.Write("http://coolmenus.dhtmlcentral.com/properties.asp?m=47 Level properties:" & vbCrLf)
        Response.Write("http://coolmenus.dhtmlcentral.com/properties.asp?m=48 Background bar " & vbCrLf)
        Response.Write("properties: http://coolmenus.dhtmlcentral.com/properties.asp?m=49 Item " & vbCrLf)
        Response.Write("properties: http://coolmenus.dhtmlcentral.com/properties.asp?m=50 " & vbCrLf)
        Response.Write("******************************************************************************/ " & vbCrLf)
        Response.Write("</script>" & vbCrLf)
    End Sub

    Private Sub Render_Styles( _
        ByVal MenuForeColor1 As String, _
        ByVal MenuOverForeColor1 As String, _
        ByVal MenuForeColor2 As String, _
        ByVal MenuOverForeColor2 As String, _
        ByVal MenuBackColor1 As String, _
        ByVal MenuOverBackColor1 As String, _
        ByVal MenuBackColor2 As String, _
        ByVal MenuOverBackColor2 As String, _
        ByVal MenuBold1 As Boolean, _
        ByVal MenuOverBold1 As Boolean, _
        ByVal MenuBold2 As Boolean, _
        ByVal MenuOverBold2 As Boolean, _
        ByVal MenuFontSize1 As String, _
        ByVal MenuOverFontSize1 As String, _
        ByVal MenuFontSize2 As String, _
        ByVal MenuOverFontSize2 As String, _
        ByVal MenuBorderColor1 As String, _
        ByVal MenuBorderColor2 As String, _
        ByVal MenuFont As String)

        Dim fw1 As String
        Dim fwOver1 As String
        Dim fw2 As String
        Dim fwOver2 As String
        If MenuBold1 Then
            fw1 = "bold"
        Else
            fw1 = "normal"
        End If
        If MenuOverBold1 Then
            fwOver1 = "bold"
        Else
            fwOver1 = "normal"
        End If
        If MenuBold2 Then
            fw2 = "bold"
        Else
            fw2 = "normal"
        End If
        If MenuOverBold2 Then
            fwOver2 = "bold"
        Else
            fwOver2 = "normal"
        End If

        ' Create style classes for the menu...
        Response.Write("<style>" & vbCrLf)

        ' CoolMenus 4 - default styles
        Response.Write(".clCMAbs{position:absolute; visibility:hidden; left:0; top:0}" & vbCrLf)

        ' Styles for level 0
        Response.Write(".clsMenuFirstLevel{font-family:" & MenuFont & ";background-color:" & MenuBackColor1 & ";position:absolute; overflow:hidden; cursor:hand;padding:4px; font-size:" & MenuFontSize1 & "px; font-weight:" & fw1 & ";color:" & MenuForeColor1 & ";}" & vbCrLf)
        Response.Write(".clsMenuFirstLevelOver{font-family:" & MenuFont & ";background-color:" & MenuOverBackColor1 & ";position:absolute; overflow:hidden; cursor:hand;padding:4px; font-size:" & MenuOverFontSize1 & "px; font-weight:" & fwOver1 & ";color:" & MenuOverForeColor1 & ";}" & vbCrLf)
        Response.Write(".clsMenuFirstLevelBorder{background-color:" & MenuBorderColor1 & ";position:absolute; visibility:hidden; z-index:500}" & vbCrLf)

        ' Styles for level 1
        Response.Write(".clsMenuSecondLevel{font-family:" & MenuFont & ";position:absolute; overflow:hidden; cursor:hand;padding:2px; font-size:" & MenuFontSize2 & "px; font-weight:" & fw2 & ";color:" & MenuForeColor2 & "; background-color:" & MenuBackColor2 & ";}" & vbCrLf)
        Response.Write(".clsMenuSecondLevelOver{font-family:" & MenuFont & ";position:absolute; overflow:hidden; cursor:hand;padding:2px; font-size:" & MenuOverFontSize2 & "px; font-weight:" & fwOver2 & "; color:" & MenuOverForeColor2 & "; background-color:" & MenuOverBackColor2 & ";}" & vbCrLf)
        Response.Write(".clsMenuSecondLevelBorder{background-color:" & MenuBorderColor2 & ";position:absolute; visibility:hidden; z-index:500}" & vbCrLf)

        Response.Write("</style>" & vbCrLf)
    End Sub

    Private Sub Render_MenuObject( _
        ByVal MenuBetween As Integer, _
        ByVal MenuLeft As Integer, _
        ByVal MenuOffset As Integer, _
        ByVal MenuTop As Integer, _
        ByVal MenuAlign As String, _
        ByVal MenuPlacement As String, _
        ByVal MenuWait As Integer, _
        ByVal MenuFade As Boolean, _
        ByVal MenuDurance As String, _
        ByVal MenuLevel1BorderX As Boolean, _
        ByVal MenuLevel1BorderY As Boolean, _
        ByVal MenuLevel2BorderX As Boolean, _
        ByVal MenuLevel2BorderY As Boolean, _
        ByVal MenuRoundBorder As Boolean)

        ' Render Menu...
        Response.Write("<script>" & vbCrLf)
        Response.Write("var _OffSet = " & MenuOffset & vbCrLf)

        ' Menu object creation
        Response.Write("oCMenu=new makeCM('oCMenu')" & vbCrLf)

        ' Menu properties
        Response.Write("oCMenu.frames = 0" & vbCrLf)
        Response.Write("oCMenu.pxBetween=" & MenuBetween & vbCrLf)
        Response.Write("oCMenu.fromLeft=" & MenuLeft & vbCrLf)
        Response.Write("oCMenu.fromTop=" & MenuTop & vbCrLf)
        Select Case MenuAlign
            Case "left"
                Response.Write("oCMenu.rows=0" & vbCrLf)
                Response.Write("oCMenu.menuPlacement='" & IIf(MenuPlacement = "center", "centeroffset", MenuPlacement) & "'" & vbCrLf)
            Case "top"
                Response.Write("oCMenu.rows=1" & vbCrLf)
                Response.Write("oCMenu.menuPlacement='" & IIf(MenuPlacement = "center", "centeroffset", MenuPlacement) & "'" & vbCrLf)
            Case "right"
                Response.Write("oCMenu.rows=0" & vbCrLf)
                Response.Write("oCMenu.menuPlacement='" & IIf(MenuPlacement = "center", "centeroffset", MenuPlacement) & "'" & vbCrLf)
            Case "bottom"
                Response.Write("oCMenu.rows=1" & vbCrLf)
                Response.Write("oCMenu.menuPlacement='" & IIf(MenuPlacement = "center", "centeroffset", MenuPlacement) & "'" & vbCrLf)
        End Select
        Response.Write("oCMenu.offlineRoot=''" & vbCrLf)
        Response.Write("oCMenu.onlineRoot=''" & vbCrLf)
        Response.Write("oCMenu.resizeCheck=1" & vbCrLf)
        Response.Write("oCMenu.wait=" & MenuWait & vbCrLf)
        Response.Write("oCMenu.fillImg='../Images/DynamicMenuFiller.gif'" & vbCrLf)
        Response.Write("oCMenu.zIndex=400" & vbCrLf)

        ' Level 0 properties
        Response.Write("oCMenu.level[0]=new cm_makeLevel()" & vbCrLf)
        Response.Write("oCMenu.level[0].width=100" & vbCrLf)
        Response.Write("oCMenu.level[0].height=16" & vbCrLf)
        Response.Write("oCMenu.level[0].regClass='clsMenuFirstLevel'" & vbCrLf)
        Response.Write("oCMenu.level[0].overClass='clsMenuFirstLevelOver'" & vbCrLf)
        Response.Write("oCMenu.level[0].borderX=" & IIf(MenuLevel1BorderX, 1, 0) & vbCrLf)
        Response.Write("oCMenu.level[0].borderY=" & IIf(MenuLevel1BorderY, 1, 0) & vbCrLf)
        Response.Write("oCMenu.level[0].borderClass='clsMenuFirstLevelBorder'" & vbCrLf)
        Response.Write("oCMenu.level[0].offsetX=0" & vbCrLf)
        Response.Write("oCMenu.level[0].offsetY=0" & vbCrLf)
        If MenuRoundBorder Then
            Response.Write("oCMenu.level[0].roundBorder=1" & vbCrLf)
        End If
        Select Case MenuAlign
            Case "left"
                Response.Write("oCMenu.level[0].rows=0" & vbCrLf)
            Case "top"
                Response.Write("oCMenu.level[0].rows=0" & vbCrLf)
            Case "right"
                Response.Write("oCMenu.level[0].rows=0" & vbCrLf)
            Case "bottom"
                Response.Write("oCMenu.level[0].rows=0" & vbCrLf)
        End Select
        Response.Write("oCMenu.level[0].arrow=''" & vbCrLf)
        Response.Write("oCMenu.level[0].arrowWidth=0" & vbCrLf)
        Response.Write("oCMenu.level[0].arrowHeight=0" & vbCrLf)
        Select Case MenuAlign
            Case "left"
                Response.Write("oCMenu.level[0].align='right'" & vbCrLf)
            Case "top"
                Response.Write("oCMenu.level[0].align='bottom'" & vbCrLf)
            Case "right"
                Response.Write("oCMenu.level[0].align='left'" & vbCrLf)
            Case "bottom"
                Response.Write("oCMenu.level[0].align='top'" & vbCrLf)
        End Select
        If MenuFade Then
            Response.Write("oCMenu.level[0].filter='progid:DXImageTransform.Microsoft.Fade(duration=" & MenuDurance & ")';" & vbCrLf)
        Else
            'Response.Write("oCMenu.level[0].filter='progid:DXImageTransform.Microsoft.Fade(0.0)';" & vbCrLf)
        End If

        ' Level 1 properties
        Response.Write("oCMenu.level[1]=new cm_makeLevel()" & vbCrLf)
        Response.Write("oCMenu.level[1].width=100" & vbCrLf)
        Response.Write("oCMenu.level[1].height=16" & vbCrLf)
        Response.Write("oCMenu.level[1].regClass='clsMenuSecondLevel'" & vbCrLf)
        Response.Write("oCMenu.level[1].overClass='clsMenuSecondLevelOver'" & vbCrLf)
        If MenuRoundBorder Then
            Response.Write("oCMenu.level[1].borderX=0" & vbCrLf)
            Response.Write("oCMenu.level[1].borderY=0" & vbCrLf)
        Else
            Response.Write("oCMenu.level[1].borderX=" & IIf(MenuLevel2BorderX, 1, 0) & vbCrLf)
            Response.Write("oCMenu.level[1].borderY=" & IIf(MenuLevel2BorderY, 1, 0) & vbCrLf)
        End If
        Response.Write("oCMenu.level[1].borderClass='clsMenuSecondLevelBorder'" & vbCrLf)
        Select Case MenuAlign
            Case "left"
                Response.Write("oCMenu.level[1].offsetX=-2" & vbCrLf)
            Case "top"
                Response.Write("oCMenu.level[1].offsetX=-2" & vbCrLf)
            Case "right"
                Response.Write("oCMenu.level[1].offsetX=2" & vbCrLf)
            Case "bottom"
                Response.Write("oCMenu.level[1].offsetX=-2" & vbCrLf)
        End Select
        Response.Write("oCMenu.level[1].offsetY=2" & vbCrLf)
        Select Case MenuAlign
            Case "left"
                Response.Write("oCMenu.level[1].rows=0" & vbCrLf)
            Case "top"
                Response.Write("oCMenu.level[1].rows=0" & vbCrLf)
            Case "right"
                Response.Write("oCMenu.level[1].rows=0" & vbCrLf)
            Case "bottom"
                Response.Write("oCMenu.level[1].rows=0" & vbCrLf)
        End Select
        Response.Write("oCMenu.level[1].arrow='../Images/DynamicMenuArrow.gif'" & vbCrLf)
        Response.Write("oCMenu.level[1].arrowWidth=10" & vbCrLf)
        Response.Write("oCMenu.level[1].arrowHeight=10" & vbCrLf)
        Select Case MenuAlign
            Case "left"
                Response.Write("oCMenu.level[1].align='right'" & vbCrLf)
            Case "top"
                Response.Write("oCMenu.level[1].align='right'" & vbCrLf)
            Case "right"
                Response.Write("oCMenu.level[1].align='left'" & vbCrLf)
            Case "bottom"
                Response.Write("oCMenu.level[1].align='right'" & vbCrLf)
        End Select
        If MenuFade Then
            Response.Write("oCMenu.level[1].filter='progid:DXImageTransform.Microsoft.Fade(duration=" & MenuDurance & ")';" & vbCrLf)
        Else
            'Response.Write("oCMenu.level[1].filter='progid:DXImageTransform.Microsoft.Fade(0.0)';" & vbCrLf)
        End If

        ' Create the menuitems...
        Call CreateMenu(208, 8.5, 3)

        Response.Write("</script>" & vbCrLf)
    End Sub

    Public Sub Render_Menu()
        Dim oSite As clsSiteSettings = CType(System.Web.HttpContext.Current.Items("SiteSettings"), clsSiteSettings)
        Dim oMenu As clsMenuDetails = oSite.MenuDetails

        Call Render_Styles( _
            oMenu.MenuForeColor1, _
            oMenu.MenuOverForeColor1, _
            oMenu.MenuForeColor2, _
            oMenu.MenuOverForeColor2, _
            oMenu.MenuBackColor1, _
            oMenu.MenuOverBackColor1, _
            oMenu.MenuBackColor2, _
            oMenu.MenuOverBackColor2, _
            oMenu.MenuBold1, _
            oMenu.MenuOverBold1, _
            oMenu.MenuBold2, _
            oMenu.MenuOverBold2, _
            oMenu.MenuFontSize1, _
            oMenu.MenuOverFontSize1, _
            oMenu.MenuFontSize2, _
            oMenu.MenuOverFontSize2, _
            oMenu.MenuBorderColor1, _
            oMenu.MenuBorderColor2, _
            oMenu.MenuFont)

        Call Render_Standard()

        Call Render_MenuObject( _
            oMenu.MenuBetween, _
            oMenu.MenuLeft, _
            oMenu.MenuOffset, _
            oMenu.MenuTop, _
            oMenu.MenuAlign, _
            oMenu.MenuPlacement, _
            oMenu.MenuWait, _
            oMenu.MenuFade, _
            oMenu.MenuDurance, _
            oMenu.MenuLevel1BorderX, _
            oMenu.MenuLevel1BorderY, _
            oMenu.MenuLevel2BorderX, _
            oMenu.MenuLevel2BorderY, _
            oMenu.MenuRoundBorder)

    End Sub

    Private Function SourceSubMenuIsAuthenticated(ByVal PageParentId As Integer) As Boolean
        Dim oMenu As New clsMenu
        If PageParentId = 0 Then Return True
        Return clsSiteSecurity.IsInRoles(oMenu.GetSourceSubMenu(PageParentId))
    End Function

    Private Sub CreateMenu(ByVal iStartPosition As Integer, ByVal iTabMultiplicator As Long, ByVal iTabSpace As Long)

        Dim i As Integer = 0
        Dim iWidth As Integer = 0
        Dim iCount As Integer = 0
        Dim iLength As Integer = 0
        Dim iHeaderLength As Integer = iStartPosition
        Dim sJ As String = "oCMenu.menuPlacement=new Array("
        Dim sJava As String = ""

        ' Loop all submenus (Tabs) and print them on the screen
        For i = LBound(MenuContainer, 2) To UBound(MenuContainer, 2)
            If Len(MenuContainer(0, i)) > 0 Then
                iCount += 1
                If MenuContainer(4, i) = 0 Then
                    sJava += iHeaderLength & ", "
                    iWidth = IIf((Len(MenuContainer(1, i)) * iTabMultiplicator) < 50, 50, (Len(MenuContainer(1, i)) * iTabMultiplicator))
                    iHeaderLength += (iWidth + iTabSpace)
                Else
                    iWidth = 155
                End If
                iLength += (iWidth + iTabSpace)
                Response.Write("oCMenu.makeMenu('i" & MenuContainer(0, i) & "','" & IIf(MenuContainer(4, i) = 0, "", "i" & MenuContainer(4, i)) & "','" & MenuContainer(1, i) & "','" & Request.FilePath & "?PageId=" & MenuContainer(0, i) & "',''," & iWidth & ");")
            End If
        Next

        ' Perform the construct of the dynamic menu
        sJava = Left(sJava, Len(sJava) - 2)
        Dim sMid As String = ""
        If InStr(sJava, ",") < 1 Then
            sJava += ",0"
            sMid = sJava
        Else
            sMid = sJava
        End If

        'Response.Write(sJ & sMid & ")" & ";")
        Response.Write("oCMenu.construct();")


    End Sub

End Class
