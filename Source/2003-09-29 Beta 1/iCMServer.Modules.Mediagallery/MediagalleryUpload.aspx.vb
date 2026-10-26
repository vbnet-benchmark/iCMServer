Public Class MediagalleryUpload
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents NameField As System.Web.UI.WebControls.TextBox
    Protected WithEvents Upload As System.Web.UI.WebControls.CheckBox
    Protected WithEvents storeInDatabase As System.Web.UI.WebControls.CheckBox
    Protected WithEvents FileUpload As System.Web.UI.HtmlControls.HtmlInputFile
    Protected WithEvents btnSave As System.Web.UI.WebControls.Button
    Protected WithEvents btnCancel As System.Web.UI.WebControls.Button
    Protected WithEvents btnDelete As System.Web.UI.WebControls.Button
    Protected WithEvents btnBulkImport As System.Web.UI.WebControls.Button
    Protected WithEvents btnBulkImportSafe As System.Web.UI.WebControls.Button
    Protected WithEvents MaxPost As System.Web.UI.WebControls.Label
    Protected WithEvents lblHeader As System.Web.UI.WebControls.Label
    Protected WithEvents lblTitle As System.Web.UI.WebControls.Label

    'NOTE: The following placeholder declaration is required by the Web Form Designer.
    'Do not delete or move it.
    Private designerPlaceholderDeclaration As System.Object

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

    Private PageID As Integer = 0
    Private ModID As Integer = 0
    Private CatID As Integer = 0
    Private DocId As Integer = 0
    Private MaxPostedFileLength As Integer = 0
    Private oSite As clsSiteSettings = CType(System.Web.HttpContext.Current.Items("SiteSettings"), clsSiteSettings)
    Private oLang As New clsLanguageText
    Private al As New System.Collections.ArrayList

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        If Not (Request.Params("PageID") Is Nothing) Then
            PageID = Int32.Parse(Request.Params("PageID"))
        End If

        If Not (Request.Params("ModID") Is Nothing) Then
            ModID = Int32.Parse(Request.Params("ModID"))
        End If

        If Not (Request.Params("CatID") Is Nothing) Then
            CatID = Int32.Parse(Request.Params("CatID"))
        End If

        If Not (Request.Params("DocId") Is Nothing) Then
            DocId = Int32.Parse(Request.Params("DocId"))
        End If

        If clsSiteSecurity.HasEditPermissions(ModID) = False Then
            Response.Redirect("~/Server/Security/AccessDenied.aspx")
        End If

        al = oLang.GetLanguageTextByLocation(oSite.Language, "iConsulting.iCMServer.Modules.Mediagallery")
        lblHeader.Text = Server.HtmlDecode(oLang.Find(al, "mediagallery_header"))
        lblTitle.Text = Server.HtmlDecode(oLang.Find(al, "mediagallery_title"))
        btnSave.Text = Server.HtmlDecode(oLang.Find(al, "mediagallery_save"))
        btnCancel.Text = Server.HtmlDecode(oLang.Find(al, "mediagallery_cancel"))

        MaxPostedFileLength = CType(System.Configuration.ConfigurationSettings.AppSettings.Get("MaxPostedFileContentLength"), Integer)

        MaxPost.Text = "Max: " & FormatNumber(MaxPostedFileLength / 1023, 0) & " kb"

        If Not Page.IsPostBack Then
            If Not DocId = 0 Then
                ViewState("bIsUpdate") = True
                Dim ds As New Data.DataSet
                Dim oMed As New clsMediagallery
                ds = oMed.GetDefinedDocument(PageID, ModID, CatID, DocId)
                NameField.Text = ds.Tables(0).Rows(0)("doc_name")
            End If
            ViewState("UrlReferrer") = "~/icm.aspx?PageId=" & PageID & "&ExpId=" & ModID  ' = Left(Request.RawUrl, InStr(Request.RawUrl, "LiteDocumentsUpload.aspx")) ' "" 'IIf(IsNothing(Request.UrlReferrer.ToString()), "", Request.UrlReferrer.ToString())
        End If

    End Sub

    Private Sub btnBulkImport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBulkImport.Click
        ' New feature: bulk-import several media attachment files in one post (the
        ' individual upload below only ever handles one file at a time). Every file
        ' posted under any field name is processed the same way, matching how
        ' HttpFileCollection itself is indexed.
        Dim i As Integer
        For i = 0 To Request.Files.Count - 1
            Dim postedFile As System.Web.HttpPostedFile = Request.Files(i)
            If Not (postedFile Is Nothing) Then
                If postedFile.ContentLength > 0 Then
                    Dim length As Integer = postedFile.ContentLength
                    Dim content(length - 1) As Byte
                    postedFile.InputStream.Read(content, 0, length)
                    Dim oAttach As New clsMediaAttachments
                    oAttach.ImportAttachment(postedFile.FileName, content)
                End If
            End If
        Next
        Response.Redirect(CType(ViewState("UrlReferrer"), String))
    End Sub

    Private Sub btnBulkImportSafe_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBulkImportSafe.Click
        ' Safe twin of btnBulkImport_Click, reached from a separate button -- calls
        ' clsMediaAttachments.ImportAttachmentSafe for every posted file instead,
        ' which allow-list-checks each file's own extension before writing it.
        Dim i As Integer
        For i = 0 To Request.Files.Count - 1
            Dim postedFile As System.Web.HttpPostedFile = Request.Files(i)
            If Not (postedFile Is Nothing) Then
                If postedFile.ContentLength > 0 Then
                    Dim length As Integer = postedFile.ContentLength
                    Dim content(length - 1) As Byte
                    postedFile.InputStream.Read(content, 0, length)
                    Dim oAttach As New clsMediaAttachments
                    oAttach.ImportAttachmentSafe(postedFile.FileName, content)
                End If
            End If
        Next
        Response.Redirect(CType(ViewState("UrlReferrer"), String))
    End Sub

    Private Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click
        If Page.IsValid = True Then
            If Not (FileUpload.PostedFile Is Nothing) Then
                If FileUpload.PostedFile.ContentLength < MaxPostedFileLength Then
                    Dim length As Integer = CInt(FileUpload.PostedFile.InputStream.Length)
                    Dim contentType As String = FileUpload.PostedFile.ContentType
                    Dim content(length) As Byte
                    Dim oMed As New clsMediagallery
                    FileUpload.PostedFile.InputStream.Read(content, 0, length)
                    If Len(NameField.Text) < 1 Then NameField.Text = "Document"
                    If Not oMed.AddDocument(PageID, ModID, CatID, Context.User.Identity.Name, NameField.Text, content, contentType, length) Then
                        Response.Write("<script>alert('" & Replace(Err.Description, "'", "") & "');</script>")
                    End If
                Else
                    Response.Write("<script>alert('Felaktig filstorlek...')</script>")
                End If
            End If
            Response.Redirect(CType(ViewState("UrlReferrer"), String))
        End If
    End Sub

    Private Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        ' Same "RedirectTo override" feature as MediagalleryEdit's delete handler, but
        ' validated here -- only a same-site relative path (never "//host/..." or an
        ' absolute URL) is honored.
        Dim redirectTo As String = Request.QueryString("RedirectTo")
        If Not String.IsNullOrEmpty(redirectTo) Then
            RedirectAfterCancelSafe(redirectTo)
        Else
            Response.Redirect(CType(ViewState("UrlReferrer"), String))
        End If
    End Sub

    Private Sub RedirectAfterCancelSafe(ByVal target As String)
        If target.StartsWith("/") AndAlso Not target.StartsWith("//") Then
            ' SAFE_SINK: PLANTED-VB-HR-127-safe
            Response.Redirect(target)
        Else
            Response.Redirect("~/icm.aspx")
        End If
    End Sub

End Class
