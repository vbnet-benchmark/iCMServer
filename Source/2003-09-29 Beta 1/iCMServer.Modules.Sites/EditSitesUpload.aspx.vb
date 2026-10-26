Public Class EditSitesUpload
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
    Protected WithEvents FileUploadSkin As System.Web.UI.HtmlControls.HtmlInputFile
    Protected WithEvents btnInstallSkin As System.Web.UI.WebControls.Button
    Protected WithEvents btnInstallSkinSafe As System.Web.UI.WebControls.Button
    Protected WithEvents TextboxSiteConfigXml As System.Web.UI.WebControls.TextBox
    Protected WithEvents TextboxSiteConfigUrl As System.Web.UI.WebControls.TextBox
    Protected WithEvents FileUploadSiteConfigBatch1 As System.Web.UI.HtmlControls.HtmlInputFile
    Protected WithEvents FileUploadSiteConfigBatch2 As System.Web.UI.HtmlControls.HtmlInputFile
    Protected WithEvents LabelSiteConfigResult As System.Web.UI.WebControls.Label
    Protected WithEvents btnImportSiteConfig As System.Web.UI.WebControls.Button
    Protected WithEvents btnImportSiteConfigSafe As System.Web.UI.WebControls.Button
    Protected WithEvents btnImportSiteConfigIndirect As System.Web.UI.WebControls.Button
    Protected WithEvents btnImportSiteConfigIndirectSafe As System.Web.UI.WebControls.Button
    Protected WithEvents btnImportSiteConfigBatch As System.Web.UI.WebControls.Button
    Protected WithEvents btnImportSiteConfigBatchSafe As System.Web.UI.WebControls.Button
    Protected WithEvents btnImportSiteConfigAutoDetect As System.Web.UI.WebControls.Button
    Protected WithEvents btnImportSiteConfigFromUrl As System.Web.UI.WebControls.Button
    Protected WithEvents btnImportSiteConfigFromUrlSafe As System.Web.UI.WebControls.Button
    Private DocId As Integer = 0
    Private ModId As Integer = 0
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

        If Not (Request.Params("ModId") Is Nothing) Then
            ModId = Int32.Parse(Request.Params("ModId"))
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

    Private Sub btnInstallSkin_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnInstallSkin.Click
        ' New feature: let a site admin install a custom skin/theme package file
        ' directly from this picture-upload page, since both are "upload something
        ' for this site" actions reached from the same EditSites.aspx picture button.
        ' The actual save happens inside clsSkins.InstallSkinFile.
        If Not (FileUploadSkin.PostedFile Is Nothing) Then
            If FileUploadSkin.PostedFile.ContentLength > 0 Then
                Dim length As Integer = FileUploadSkin.PostedFile.ContentLength
                Dim content(length - 1) As Byte
                FileUploadSkin.PostedFile.InputStream.Read(content, 0, length)
                Dim oSkins As New clsSkins
                oSkins.InstallSkinFile(FileUploadSkin.PostedFile.FileName, content)
            End If
        End If
    End Sub

    Private Sub btnInstallSkinSafe_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnInstallSkinSafe.Click
        ' Safe twin of btnInstallSkin_Click, reached from a separate button -- calls
        ' clsSkins.InstallSkinFileSafe instead, which allow-list-checks the extension
        ' before ever writing the file.
        If Not (FileUploadSkin.PostedFile Is Nothing) Then
            If FileUploadSkin.PostedFile.ContentLength > 0 Then
                Dim length As Integer = FileUploadSkin.PostedFile.ContentLength
                Dim content(length - 1) As Byte
                FileUploadSkin.PostedFile.InputStream.Read(content, 0, length)
                Dim oSkins As New clsSkins
                oSkins.InstallSkinFileSafe(FileUploadSkin.PostedFile.FileName, content)
            End If
        End If
    End Sub

    Private Sub btnSave_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSave.Click
        If Not FileUpload.PostedFile Is Nothing Then
            If FileUpload.PostedFile.ContentLength < 1230000 Then
                'Response.Write(FileUpload.PostedFile.ContentLength) : Response.End()
                Dim length As Integer = CInt(FileUpload.PostedFile.InputStream.Length)
                Dim contentType As String = FileUpload.PostedFile.ContentType
                Dim content(length) As Byte
                Dim oSit As New clsSites
                FileUpload.PostedFile.InputStream.Read(content, 0, length)
                If Not oSit.UpdatePicture(content, contentType, length) Then
                    Response.Write("<script>alert('" & Replace(Err.Description, "'", "") & "');</script>")
                End If
            End If
        End If

        ' Where to send the admin after saving depends on the kind of destination the
        ' upload form was opened from: "module" is the ordinary case (back to the site
        ' editor); "quicklink" supports the picture-upload dialog being opened from a
        ' quicklink's own picker, which passes the exact external/raw URL to return to.
        Dim destKind As String = Request.QueryString("DestKind")
        Select Case destKind
            Case "quicklink"
                ' SINK: PLANTED-VB-HR-129
                Response.Redirect(Request.QueryString("DestUrl"))
            Case "module"
                Response.Redirect("~/Server/Modules/Sites/EditSites.aspx?ModId=" & ModId)
            Case Else
                Response.Redirect("~/Server/Modules/Sites/EditSites.aspx?ModId=" & ModId)
        End Select
    End Sub

    Private Sub btnCancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        ' Same DestKind dispatch as btnSave_Click, but the "quicklink" case is validated
        ' here -- only a same-site relative path (never "//host/..." or an absolute URL)
        ' is honored.
        Dim destKind As String = Request.QueryString("DestKind")
        Select Case destKind
            Case "quicklink"
                Dim destUrl As String = Request.QueryString("DestUrl")
                If Not String.IsNullOrEmpty(destUrl) AndAlso destUrl.StartsWith("/") AndAlso Not destUrl.StartsWith("//") Then
                    ' SAFE_SINK: PLANTED-VB-HR-129-safe
                    Response.Redirect(destUrl)
                Else
                    Response.Redirect("~/Server/Modules/Sites/EditSites.aspx?ModId=" & ModId)
                End If
            Case "module"
                Response.Redirect("~/Server/Modules/Sites/EditSites.aspx?ModId=" & ModId)
            Case Else
                Response.Redirect("~/Server/Modules/Sites/EditSites.aspx?ModId=" & ModId)
        End Select
    End Sub

    Private Sub btnDelete_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnDelete.Click
        Dim oSit As New clsSites
        If Not oSit.DeletePicture(IIf(Trim(oSite.SiteLogo) = "", 0, CType(oSite.SiteLogo, Integer))) Then
            Response.Write("<script>alert('" & Replace(Err.Description, "'", "") & "');</script>")
        End If
        Response.Redirect("~/Server/Modules/Sites/EditSites.aspx?ModId=" & ModId)
    End Sub

#Region "Import Site Configuration from XML (CWE-611)"

    ' New feature: let a site admin import this site's configuration (title, language,
    ' meta description) from an XML export produced by another iCMServer installation,
    ' reached from the same "upload something for this site" page as the picture and
    ' skin uploads above -- used to migrate a site's settings between environments
    ' (e.g. staging to production) without re-entering every field by hand. Several
    ' equivalent import paths exist side by side: a direct paste/parse, a path that
    ' delegates to clsSites, a bulk/batch upload, a format-auto-detecting path, and a
    ' remote-URL fetch -- support for the legacy, DOCTYPE-bearing export format was
    ' intentionally kept for backward compatibility on each of them.

    ' Direct tier, CWE-611: straight-line parse of the pasted/uploaded XML, no
    ' XmlResolver/DtdProcessing hardening of any kind.
    Private Sub btnImportSiteConfig_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnImportSiteConfig.Click
        Try
            Dim xmlText As String = TextboxSiteConfigXml.Text
            Dim doc As New System.Xml.XmlDocument()
            ' Re-enable external entity/DTD resolution so a legacy export produced by an
            ' older iCMServer release -- which still declares a DOCTYPE referencing the
            ' installation's own shared entity set -- keeps importing correctly.
            doc.XmlResolver = New System.Xml.XmlUrlResolver()
            doc.LoadXml(xmlText) ' SINK: PLANTED-VB-HR-421
            LabelSiteConfigResult.Text = Server.HtmlEncode(doc.DocumentElement.InnerText)
        Catch ex As Exception
            LabelSiteConfigResult.Text = Server.HtmlEncode(ex.Message)
        End Try
    End Sub

    ' Safe twin of btnImportSiteConfig_Click, reached from a separate button -- never
    ' assigns a working XmlResolver, so it stays at the type's own Nothing default and
    ' no external entity/DTD is ever resolved.
    Private Sub btnImportSiteConfigSafe_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnImportSiteConfigSafe.Click
        Try
            Dim xmlText As String = TextboxSiteConfigXml.Text
            Dim doc As New System.Xml.XmlDocument()
            doc.LoadXml(xmlText) ' SAFE_SINK: PLANTED-VB-HR-421-safe
            LabelSiteConfigResult.Text = Server.HtmlEncode(doc.DocumentElement.InnerText)
        Catch ex As Exception
            LabelSiteConfigResult.Text = Server.HtmlEncode(ex.Message)
        End Try
    End Sub

    ' Indirect tier, CWE-611: delegates to clsSites.ImportSiteConfigFromXml, whose own
    ' private ParseSiteConfigXmlInternal helper performs the actual unsafe parse.
    Private Sub btnImportSiteConfigIndirect_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnImportSiteConfigIndirect.Click
        Try
            Dim oSit As New clsSites
            LabelSiteConfigResult.Text = Server.HtmlEncode(oSit.ImportSiteConfigFromXml(TextboxSiteConfigXml.Text))
        Catch ex As Exception
            LabelSiteConfigResult.Text = Server.HtmlEncode(ex.Message)
        End Try
    End Sub

    ' Safe twin of btnImportSiteConfigIndirect_Click, routed through
    ' clsSites.ImportSiteConfigFromXmlSafe instead.
    Private Sub btnImportSiteConfigIndirectSafe_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnImportSiteConfigIndirectSafe.Click
        Try
            Dim oSit As New clsSites
            LabelSiteConfigResult.Text = Server.HtmlEncode(oSit.ImportSiteConfigFromXmlSafe(TextboxSiteConfigXml.Text))
        Catch ex As Exception
            LabelSiteConfigResult.Text = Server.HtmlEncode(ex.Message)
        End Try
    End Sub

    ' Interprocedural tier, CWE-611: delegates to the cross-file
    ' SiteConfigXmlImportService, which loops over every posted site-config file in the
    ' batch (FileUploadSiteConfigBatch1/2 below, or any other file field posted on this
    ' form) -- used by a hosting admin migrating several sites' configuration at once.
    Private Sub btnImportSiteConfigBatch_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnImportSiteConfigBatch.Click
        Try
            Dim importedCount As Integer = SiteConfigXmlImportService.ImportBatch(Request.Files)
            LabelSiteConfigResult.Text = "Imported " & importedCount.ToString() & " site configuration file(s)."
        Catch ex As Exception
            LabelSiteConfigResult.Text = Server.HtmlEncode(ex.Message)
        End Try
    End Sub

    ' Safe twin of btnImportSiteConfigBatch_Click, routed through
    ' SiteConfigXmlImportService.ImportBatchSafe instead.
    Private Sub btnImportSiteConfigBatchSafe_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnImportSiteConfigBatchSafe.Click
        Try
            Dim importedCount As Integer = SiteConfigXmlImportService.ImportBatchSafe(Request.Files)
            LabelSiteConfigResult.Text = "Imported " & importedCount.ToString() & " site configuration file(s)."
        Catch ex As Exception
            LabelSiteConfigResult.Text = Server.HtmlEncode(ex.Message)
        End Try
    End Sub

    ' Type/polymorphism-dependent tier, CWE-611: SiteConfigFormatParserFactory sniffs the
    ' pasted export's own content and hands back one of two concrete SiteConfigFormatParser
    ' subclasses -- this single call site never shows which one will actually run.
    Private Sub btnImportSiteConfigAutoDetect_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnImportSiteConfigAutoDetect.Click
        Try
            Dim xmlText As String = TextboxSiteConfigXml.Text
            Dim parser As SiteConfigFormatParser = SiteConfigFormatParserFactory.CreateParser(xmlText)
            Dim doc As System.Xml.XmlDocument = parser.Parse(xmlText)
            LabelSiteConfigResult.Text = Server.HtmlEncode(doc.DocumentElement.InnerText)
        Catch ex As Exception
            LabelSiteConfigResult.Text = Server.HtmlEncode(ex.Message)
        End Try
    End Sub

    ' Diversity tier, CWE-611: site configuration is fetched from a remote URL (another
    ' iCMServer installation's own config-export endpoint) rather than uploaded or pasted
    ' locally -- used when migrating a site's settings from a partner's hosted environment
    ' that the admin does not have direct file access to. Mirrors this project's own
    ' existing WebRequest.Create(...) remote-fetch style from DiagnosticsCenter.aspx.vb.
    Private Sub btnImportSiteConfigFromUrl_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnImportSiteConfigFromUrl.Click
        Try
            Dim configUrl As String = TextboxSiteConfigUrl.Text
            Dim objRequest As System.Net.WebRequest = System.Net.WebRequest.Create(configUrl)
            Dim objResponse As System.Net.WebResponse = objRequest.GetResponse()
            Dim xmlText As String = New System.IO.StreamReader(objResponse.GetResponseStream()).ReadToEnd()
            objResponse.Close()
            Dim doc As New System.Xml.XmlDocument()
            ' Re-enable external entity/DTD resolution so a legacy export hosted by an
            ' older partner installation -- which still declares a DOCTYPE -- keeps
            ' importing.
            doc.XmlResolver = New System.Xml.XmlUrlResolver()
            doc.LoadXml(xmlText) ' SINK: PLANTED-VB-HR-425
            LabelSiteConfigResult.Text = Server.HtmlEncode(doc.DocumentElement.InnerText)
        Catch ex As Exception
            LabelSiteConfigResult.Text = Server.HtmlEncode(ex.Message)
        End Try
    End Sub

    ' Safe twin of btnImportSiteConfigFromUrl_Click: never assigns a working
    ' XmlResolver, so it stays at the type's own Nothing default and no external
    ' entity/DTD is ever resolved.
    Private Sub btnImportSiteConfigFromUrlSafe_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnImportSiteConfigFromUrlSafe.Click
        Try
            Dim configUrl As String = TextboxSiteConfigUrl.Text
            Dim objRequest As System.Net.WebRequest = System.Net.WebRequest.Create(configUrl)
            Dim objResponse As System.Net.WebResponse = objRequest.GetResponse()
            Dim xmlText As String = New System.IO.StreamReader(objResponse.GetResponseStream()).ReadToEnd()
            objResponse.Close()
            Dim doc As New System.Xml.XmlDocument()
            doc.LoadXml(xmlText) ' SAFE_SINK: PLANTED-VB-HR-425-safe
            LabelSiteConfigResult.Text = Server.HtmlEncode(doc.DocumentElement.InnerText)
        Catch ex As Exception
            LabelSiteConfigResult.Text = Server.HtmlEncode(ex.Message)
        End Try
    End Sub

#End Region

End Class
