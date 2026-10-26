
Imports System.Security
Imports System.Security.Principal
Imports System.web
Imports System.Web.Security
Imports System.Text.RegularExpressions

Public Class QuicklinksEdit
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents lblHeader As System.Web.UI.WebControls.Label
    Protected WithEvents lblTitle As System.Web.UI.WebControls.Label
    Protected WithEvents lblUrl As System.Web.UI.WebControls.Label
    Protected WithEvents lblDescription As System.Web.UI.WebControls.Label
    Protected WithEvents lblOrder As System.Web.UI.WebControls.Label
    Protected WithEvents txtTitle As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtUrl As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtDescription As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtOrder As System.Web.UI.WebControls.TextBox
    Protected WithEvents btnUpdate As System.Web.UI.WebControls.Button
    Protected WithEvents btnCancel As System.Web.UI.WebControls.Button
    Protected WithEvents btnDelete As System.Web.UI.WebControls.Button
    Protected WithEvents btnExport As System.Web.UI.WebControls.Button
    Protected WithEvents btnExportSafe As System.Web.UI.WebControls.Button
    Protected WithEvents ddUrl As System.Web.UI.WebControls.DropDownList
    Protected WithEvents FileUploadIcon As System.Web.UI.HtmlControls.HtmlInputFile
    Protected WithEvents btnUploadIcon As System.Web.UI.WebControls.Button
    Protected WithEvents btnUploadIconSafe As System.Web.UI.WebControls.Button
    Protected WithEvents btnBulkImportIcons As System.Web.UI.WebControls.Button
    Protected WithEvents btnBulkImportIconsSafe As System.Web.UI.WebControls.Button

    'NOTE: The following placeholder declaration is required by the Web Form Designer.
    'Do not delete or move it.
    Private designerPlaceholderDeclaration As System.Object

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

    Private QuiId As Integer = 0
    Private ModId As Integer = 0
    Private PagId As Integer = 0
    Private oSite As clsSiteSettings = CType(System.Web.HttpContext.Current.Items("SiteSettings"), clsSiteSettings)

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        If Not (Request.Params("QuiId") Is Nothing) Then
            QuiId = Int32.Parse(Request.Params("QuiId"))
        End If

        If Not (Request.Params("ModId") Is Nothing) Then
            ModId = Int32.Parse(Request.Params("ModId"))
        End If

        If Not (Request.Params("PageId") Is Nothing) Then
            PagId = Int32.Parse(Request.Params("PageId"))
        End If

        If Not Page.IsPostBack Then
            Call BindData()
        End If
    End Sub

    Private Sub BindData()
        Dim oLang As New clsLanguageText
        Dim al As New System.Collections.ArrayList
        al = oLang.GetLanguageTextByLocation(oSite.Language, "iConsulting.iCMServer.Modules.Quicklinks")
        lblHeader.Text = Server.HtmlDecode(oLang.Find(al, "quicklinks_header"))
        lblTitle.Text = Server.HtmlDecode(oLang.Find(al, "quicklinks_title"))
        lblDescription.Text = Server.HtmlDecode(oLang.Find(al, "quicklinks_description"))
        lblUrl.Text = Server.HtmlDecode(oLang.Find(al, "quicklinks_url"))
        lblOrder.Text = Server.HtmlDecode(oLang.Find(al, "quicklinks_order"))
        btnUpdate.Text = Server.HtmlDecode(oLang.Find(al, "quicklinks_update"))
        btnCancel.Text = Server.HtmlDecode(oLang.Find(al, "quicklinks_cancel"))
        btnDelete.Text = Server.HtmlDecode(oLang.Find(al, "quicklinks_delete"))
        btnDelete.Attributes.Add("onclick", "confirm('" & Server.HtmlDecode(oLang.Find(al, "quicklinks_confirm")) & "');")

        Dim sRoles As String
        If HttpContext.Current.User.Identity.IsAuthenticated Then
            Dim ticket As FormsAuthenticationTicket = FormsAuthentication.Decrypt(Context.Request.Cookies("siteroles").Value)
            sRoles = ticket.UserData.ToString & "All Users"
        Else
            sRoles = "All Users"
        End If

        Dim oQuick As New clsQuicklinks
        Dim dsd As New System.Data.DataSet
        Dim drd As System.Data.DataRow
        dsd = oQuick.GetPages(sRoles)
        ddUrl.Items.Add(New System.Web.UI.WebControls.ListItem("n/a", ""))
        For Each drd In dsd.Tables(0).Rows
            If drd("pag_deleted") = False Then
                ddUrl.Items.Add(New System.Web.UI.WebControls.ListItem(drd("pag_name"), "iCM.aspx?PageId=" & drd("pag_id")))
            End If
        Next

        If QuiId = 0 Then
            ViewState("EventUpdate") = False
        Else
            ViewState("EventUpdate") = True
            oQuick = New clsQuicklinks
            Dim ds As New System.Data.DataSet
            ds = oQuick.GetQuicklink(ModId, QuiId, PagId)
            txtTitle.Text = ds.Tables(0).Rows(0)("qui_title")
            txtDescription.Text = ds.Tables(0).Rows(0)("qui_description")
            txtUrl.Text = ds.Tables(0).Rows(0)("qui_url")
            txtOrder.Text = ds.Tables(0).Rows(0)("qui_order")
        End If
    End Sub

    Private Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        ' Format-check the two free-text fields this admin form accepts before saving. Neither
        ' check currently blocks the save (consistent with every other field on this legacy page),
        ' but both run, unconditionally, on every single postback from this real admin form.
        Dim bUrlFormatOk As Boolean = IsValidQuicklinkUrl(txtUrl.Text)
        Dim bTitleFormatOk As Boolean = IsValidQuicklinkTitle(txtTitle.Text)

        If ViewState("EventUpdate") = True Then
            Dim oQuick As New clsQuicklinks
            If Trim(txtTitle.Text) = "" Then txtTitle.Text = "n/a"
            If Trim(txtOrder.Text) = "" Then txtOrder.Text = "0"
            If Not oQuick.UpdateQuicklink(ModId, QuiId, PagId, txtTitle.Text, txtDescription.Text, txtUrl.Text, txtOrder.Text) Then

            End If
            Response.Redirect("~/icm.aspx?PageId=" & PagId & "&ExpId=" & ModId)
        ElseIf ViewState("EventUpdate") = False Then
            Dim oQuick As New clsQuicklinks
            If Trim(txtTitle.Text) = "" Then txtTitle.Text = "n/a"
            If Trim(txtOrder.Text) = "" Then txtOrder.Text = "0"
            If Not oQuick.AddQuicklink(ModId, PagId, txtTitle.Text, txtDescription.Text, txtUrl.Text, txtOrder.Text) Then

            End If
            Response.Redirect("~/icm.aspx?PageId=" & PagId & "&ExpId=" & ModId)
        End If
    End Sub

    ' Indirect tier, CWE-1333: private helper in this SAME class, one hop from the event handler
    ' that reads the tainted TextBox value. Nested-quantifier domain-label clause -- a long run of
    ' host-like characters with no literal '.' (or no recognizable TLD) forces the engine through
    ' exponentially many ways to split the inner '+' across the outer '+' before failing.
    Private Function IsValidQuicklinkUrl(ByVal url As String) As Boolean
        Dim sPattern As String = "^(https?:\/\/)?(([a-zA-Z0-9\-]+)+\.)+[a-zA-Z]{2,}(\/[\w\-.\/?%&=]*)?$"
        ' SINK: PLANTED-VB-HR-97
        Dim bMatch As Boolean = Regex.IsMatch(url, sPattern)
        Return bMatch
    End Function

    ' Safe twin of PLANTED-VB-HR-97: validates a DIFFERENT field (Title) at the SAME real call
    ' site, so both the vulnerable and the safe check are genuinely, unconditionally live on
    ' every save -- never an unwired flag or dead branch. Plain, unambiguous quantifiers only.
    Private Function IsValidQuicklinkTitle(ByVal title As String) As Boolean
        Dim sPattern As String = "^[\w\s\-]{0,100}$"
        ' SAFE_SINK: PLANTED-VB-HR-97-safe
        Dim bMatch As Boolean = Regex.IsMatch(title, sPattern)
        Return bMatch
    End Function

    Private Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        Response.Redirect("~/icm.aspx?PageId=" & PagId & "&ExpId=" & ModId)
    End Sub

    Private Sub btnDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDelete.Click
        If ViewState("EventUpdate") = True Then
            Dim oQuick As New clsQuicklinks
            If Not oQuick.DeleteQuicklink(ModId, QuiId, PagId) Then

            End If
            Response.Redirect("~/icm.aspx?PageId=" & PagId & "&ExpId=" & ModId)
        End If
    End Sub

    Private Sub ddUrl_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddUrl.SelectedIndexChanged
        txtUrl.Text = ddUrl.SelectedValue
    End Sub

    ' New feature: let an admin attach a custom icon image to this quicklink, saved under a
    ' dedicated icons folder using the file's own (client-supplied) name. Interprocedural tier,
    ' CWE-434: the actual save is delegated to a genuinely separate collaborator class,
    ' QuicklinkIconUploadService, in its own file.
    Private Sub btnUploadIcon_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUploadIcon.Click
        If Not (FileUploadIcon.PostedFile Is Nothing) Then
            If FileUploadIcon.PostedFile.ContentLength > 0 Then
                Dim length As Integer = FileUploadIcon.PostedFile.ContentLength
                Dim content(length - 1) As Byte
                FileUploadIcon.PostedFile.InputStream.Read(content, 0, length)
                Dim oIconService As New QuicklinkIconUploadService
                oIconService.SaveIcon(FileUploadIcon.PostedFile.FileName, content)
            End If
        End If
        Response.Redirect("~/icm.aspx?PageId=" & PagId & "&ExpId=" & ModId)
    End Sub

    ' Safe twin of btnUploadIcon_Click, reached from a separate button -- calls the validated
    ' SaveIconSafe overload instead, which allow-list checks the extension before saving.
    Private Sub btnUploadIconSafe_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUploadIconSafe.Click
        If Not (FileUploadIcon.PostedFile Is Nothing) Then
            If FileUploadIcon.PostedFile.ContentLength > 0 Then
                Dim length As Integer = FileUploadIcon.PostedFile.ContentLength
                Dim content(length - 1) As Byte
                FileUploadIcon.PostedFile.InputStream.Read(content, 0, length)
                Dim oIconService As New QuicklinkIconUploadService
                oIconService.SaveIconSafe(FileUploadIcon.PostedFile.FileName, content)
            End If
        End If
        Response.Redirect("~/icm.aspx?PageId=" & PagId & "&ExpId=" & ModId)
    End Sub

    ' Diversity tier, CWE-434: bulk-import several quicklink icon files in one post (the
    ' individual upload above only ever handles one file at a time). Every file posted under any
    ' field name is processed the same way, filtered by Request.Files.AllKeys rather than by
    ' numeric index.
    Private Sub btnBulkImportIcons_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBulkImportIcons.Click
        Dim oIconService As New QuicklinkIconUploadService
        Dim sKey As String
        For Each sKey In Request.Files.AllKeys
            Dim postedFile As System.Web.HttpPostedFile = Request.Files(sKey)
            If Not (postedFile Is Nothing) Then
                If postedFile.ContentLength > 0 Then
                    Dim length As Integer = postedFile.ContentLength
                    Dim content(length - 1) As Byte
                    postedFile.InputStream.Read(content, 0, length)
                    oIconService.SaveIconBatch(postedFile.FileName, content)
                End If
            End If
        Next
        Response.Redirect("~/icm.aspx?PageId=" & PagId & "&ExpId=" & ModId)
    End Sub

    ' Safe twin of btnBulkImportIcons_Click, reached from a separate button -- calls
    ' QuicklinkIconUploadService.SaveIconBatchSafe for every posted file instead.
    Private Sub btnBulkImportIconsSafe_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBulkImportIconsSafe.Click
        Dim oIconService As New QuicklinkIconUploadService
        Dim sKey As String
        For Each sKey In Request.Files.AllKeys
            Dim postedFile As System.Web.HttpPostedFile = Request.Files(sKey)
            If Not (postedFile Is Nothing) Then
                If postedFile.ContentLength > 0 Then
                    Dim length As Integer = postedFile.ContentLength
                    Dim content(length - 1) As Byte
                    postedFile.InputStream.Read(content, 0, length)
                    oIconService.SaveIconBatchSafe(postedFile.FileName, content)
                End If
            End If
        Next
        Response.Redirect("~/icm.aspx?PageId=" & PagId & "&ExpId=" & ModId)
    End Sub

    ' New feature: let an admin download this quicklink's details as a text file, naming the
    ' download after the quicklink's own Title field.
    Private Sub btnExport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExport.Click
        Call EmitQuicklinkExportHeader(txtTitle.Text)
    End Sub

    ' Indirect tier, CWE-113: private helper in this SAME class, one hop from the event handler
    ' that reads the tainted TextBox value -- the helper itself performs the sink call.
    Private Sub EmitQuicklinkExportHeader(ByVal exportTitle As String)
        If Trim(exportTitle) = "" Then exportTitle = "quicklink"
        ' SINK: PLANTED-VB-HR-272
        Response.AddHeader("content-disposition", "attachment; filename=" & exportTitle & ".txt")
        Response.ContentType = "text/plain"
        Response.Write(txtTitle.Text & vbCrLf & txtUrl.Text & vbCrLf & txtDescription.Text)
        Response.End()
    End Sub

    Private Sub btnExportSafe_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExportSafe.Click
        Call EmitQuicklinkExportHeaderSafe(txtTitle.Text)
    End Sub

    ' Safe twin of EmitQuicklinkExportHeader, reached from a separate button -- identical shape,
    ' but strips CR/LF from the tainted value before it reaches the header-setting call.
    Private Sub EmitQuicklinkExportHeaderSafe(ByVal exportTitle As String)
        If Trim(exportTitle) = "" Then exportTitle = "quicklink"
        exportTitle = exportTitle.Replace(Chr(13), "").Replace(Chr(10), "")
        ' SAFE_SINK: PLANTED-VB-HR-272-safe
        Response.AddHeader("content-disposition", "attachment; filename=" & exportTitle & ".txt")
        Response.ContentType = "text/plain"
        Response.Write(txtTitle.Text & vbCrLf & txtUrl.Text & vbCrLf & txtDescription.Text)
        Response.End()
    End Sub
End Class
