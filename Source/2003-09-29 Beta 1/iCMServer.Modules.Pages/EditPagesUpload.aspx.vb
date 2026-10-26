Public Class EditPagesUpload
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents FileUpload As System.Web.UI.HtmlControls.HtmlInputFile
    Protected WithEvents lblHeader As System.Web.UI.WebControls.Label
    Protected WithEvents lblMax As System.Web.UI.WebControls.Label
    Protected WithEvents btnSave As System.Web.UI.WebControls.Button
    Protected WithEvents btnCancel As System.Web.UI.WebControls.Button
    Protected WithEvents btnDelete As System.Web.UI.WebControls.Button
    Protected WithEvents FileUploadResource As System.Web.UI.HtmlControls.HtmlInputFile
    Protected WithEvents btnUploadResource As System.Web.UI.WebControls.Button
    Protected WithEvents btnUploadResourceSafe As System.Web.UI.WebControls.Button
    Protected WithEvents FileUploadTemplate As System.Web.UI.HtmlControls.HtmlInputFile
    Protected WithEvents btnImportTemplate As System.Web.UI.WebControls.Button
    Protected WithEvents btnImportTemplateSafe As System.Web.UI.WebControls.Button
    Private DocId As Integer = 0
    Private PageID As Integer = 0
    Private oSite As clsSiteSettings = CType(System.Web.HttpContext.Current.Items("SiteSettings"), clsSiteSettings)

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

        If Not (Request.Params("DocId") Is Nothing) Then
            DocId = Int32.Parse(Request.Params("DocId"))
        End If

        ' Determine ItemId of Events to Update
        If Not (Request.Params("PageID") Is Nothing) Then
            PageID = Int32.Parse(Request.Params("PageID"))
        End If

        If Not Page.IsPostBack Then
            Call BindData()
        End If

    End Sub

    Private Sub BindData()
        Dim oLang As New clsLanguageText
        Dim al As New System.Collections.ArrayList

        ' Get language text and init the controls...
        al = oLang.GetLanguageTextByLocation(oSite.Language, "iConsulting.iCMServer.Modules.Sites")
        lblHeader.Text = Server.HtmlDecode(oLang.Find(al, "sites_upload_header"))
        btnSave.Text = Server.HtmlDecode(oLang.Find(al, "sites_upload_save"))
        btnCancel.Text = Server.HtmlDecode(oLang.Find(al, "sites_upload_cancel"))
        btnDelete.Text = Server.HtmlDecode(oLang.Find(al, "sites_upload_delete"))
        btnDelete.Attributes.Add("onclick", "return confirm('" & Server.HtmlDecode(oLang.Find(al, "sites_upload_confirm")) & "');")

        lblMax.Text = "Max: 1000 kb"

    End Sub

    Private Sub btnSave_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSave.Click
        If Not FileUpload.PostedFile Is Nothing Then
            If FileUpload.PostedFile.ContentLength < 1230000 Then
                'Response.Write(FileUpload.PostedFile.ContentLength) : Response.End()
                Dim length As Integer = CInt(FileUpload.PostedFile.InputStream.Length)
                Dim contentType As String = FileUpload.PostedFile.ContentType
                Dim content(length) As Byte
                Dim oPag As New clsPages
                FileUpload.PostedFile.InputStream.Read(content, 0, length)
                If Not oPag.UpdatePicture(content, contentType, length, PageID) Then
                    Response.Write("<script>alert('" & Replace(Err.Description, "'", "") & "');</script>")
                End If
            End If
        End If
        Response.Redirect("~/Server/Modules/Pages/EditPages.aspx?ExpandMinimizer=True" & "&PageId=" & PageID)
    End Sub

    Private Sub btnCancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        Response.Redirect("~/Server/Modules/Pages/EditPages.aspx?ExpandMinimizer=True" & "&PageId=" & PageID)
    End Sub

    Private Sub btnUploadResource_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnUploadResource.Click
        ' New feature: attach an arbitrary resource file (e.g. a downloadable PDF or a
        ' supporting document) to this page, saved under the page's own resource
        ' folder using the file's own (client-supplied) name -- unlike the picture
        ' upload above, which never uses FileUpload.PostedFile.FileName at all and
        ' stores the bytes as a database BLOB instead.
        If Not (FileUploadResource.PostedFile Is Nothing) Then
            If FileUploadResource.PostedFile.ContentLength > 0 Then
                Dim destPath As String = Server.MapPath("~/PageResources/" & PageID & "_" & FileUploadResource.PostedFile.FileName)
                ' SINK: PLANTED-VB-HR-226
                FileUploadResource.PostedFile.SaveAs(destPath)
            End If
        End If
        Response.Redirect("~/Server/Modules/Pages/EditPages.aspx?ExpandMinimizer=True" & "&PageId=" & PageID)
    End Sub

    Private Sub btnUploadResourceSafe_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnUploadResourceSafe.Click
        ' Safe twin of btnUploadResource_Click, reached from a separate button -- the
        ' resource's extension is checked against a strict allow-list (lowercased)
        ' before the file is ever saved, instead of trusting whatever extension the
        ' client sent.
        Dim allowedResourceExtensions() As String = {".pdf", ".doc", ".docx", ".xls", ".xlsx", ".txt", ".csv"}
        If Not (FileUploadResource.PostedFile Is Nothing) Then
            If FileUploadResource.PostedFile.ContentLength > 0 Then
                Dim sExt As String = System.IO.Path.GetExtension(FileUploadResource.PostedFile.FileName).ToLower()
                If Array.IndexOf(allowedResourceExtensions, sExt) >= 0 Then
                    Dim destPath As String = Server.MapPath("~/PageResources/" & PageID & "_" & FileUploadResource.PostedFile.FileName)
                    ' SAFE_SINK: PLANTED-VB-HR-226-safe
                    FileUploadResource.PostedFile.SaveAs(destPath)
                End If
            End If
        End If
        Response.Redirect("~/Server/Modules/Pages/EditPages.aspx?ExpandMinimizer=True" & "&PageId=" & PageID)
    End Sub

    Private Sub btnImportTemplate_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnImportTemplate.Click
        ' New feature: import a template fragment file for this page. The kind of
        ' template being imported ("Header", "Footer" or "Custom") is posted alongside
        ' the file and dispatched inside clsPageTemplates.ImportTemplate -- see that
        ' class for the actual save. TemplateKind is an ordinary posted form value,
        ' just as attacker-choosable as any other request field, regardless of which
        ' <option> the rendered dropdown happens to show.
        If Not (FileUploadTemplate.PostedFile Is Nothing) Then
            If FileUploadTemplate.PostedFile.ContentLength > 0 Then
                Dim length As Integer = FileUploadTemplate.PostedFile.ContentLength
                Dim content(length - 1) As Byte
                FileUploadTemplate.PostedFile.InputStream.Read(content, 0, length)
                Dim oTemplates As New clsPageTemplates
                oTemplates.ImportTemplate(Request.Form("TemplateKind"), FileUploadTemplate.PostedFile.FileName, content)
            End If
        End If
        Response.Redirect("~/Server/Modules/Pages/EditPages.aspx?ExpandMinimizer=True" & "&PageId=" & PageID)
    End Sub

    Private Sub btnImportTemplateSafe_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnImportTemplateSafe.Click
        ' Safe twin of btnImportTemplate_Click, reached from a separate button --
        ' calls the validated ImportTemplateSafe overload instead, which allow-list
        ' checks the extension inside its own "Custom" case before saving.
        If Not (FileUploadTemplate.PostedFile Is Nothing) Then
            If FileUploadTemplate.PostedFile.ContentLength > 0 Then
                Dim length As Integer = FileUploadTemplate.PostedFile.ContentLength
                Dim content(length - 1) As Byte
                FileUploadTemplate.PostedFile.InputStream.Read(content, 0, length)
                Dim oTemplates As New clsPageTemplates
                oTemplates.ImportTemplateSafe(Request.Form("TemplateKind"), FileUploadTemplate.PostedFile.FileName, content)
            End If
        End If
        Response.Redirect("~/Server/Modules/Pages/EditPages.aspx?ExpandMinimizer=True" & "&PageId=" & PageID)
    End Sub

    Private Sub btnDelete_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnDelete.Click
        Dim oPag As New clsPages
        If Not oPag.DeletePicture(IIf(Trim(oSite.ActivePage.PagePictureId) = "", 0, CType(oSite.ActivePage.PagePictureId, Integer)), PageID) Then
            Response.Write("<script>alert('" & Replace(Err.Description, "'", "") & "');</script>")
        End If
        Response.Redirect("~/Server/Modules/Pages/EditPages.aspx?ExpandMinimizer=True" & "&PageId=" & PageID)
    End Sub
End Class
