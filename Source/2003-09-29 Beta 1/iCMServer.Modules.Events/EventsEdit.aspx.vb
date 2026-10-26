Public Class EventsEdit
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents lblHeader As System.Web.UI.WebControls.Label
    Protected WithEvents lblTitle As System.Web.UI.WebControls.Label
    Protected WithEvents lblDescription As System.Web.UI.WebControls.Label
    Protected WithEvents lblLink As System.Web.UI.WebControls.Label
    Protected WithEvents lblShowDate As System.Web.UI.WebControls.Label
    Protected WithEvents lblHideDate As System.Web.UI.WebControls.Label
    Protected WithEvents btnUpdate As System.Web.UI.WebControls.Button
    Protected WithEvents btnCancel As System.Web.UI.WebControls.Button
    Protected WithEvents btnDelete As System.Web.UI.WebControls.Button
    Protected WithEvents btnExportLegacy As System.Web.UI.WebControls.Button
    Protected WithEvents btnExportModern As System.Web.UI.WebControls.Button
    Protected WithEvents txtTitle As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtDescription As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtLink As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtShowDate As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtHideDate As System.Web.UI.WebControls.TextBox
    Protected WithEvents FileUploadFlyer As System.Web.UI.HtmlControls.HtmlInputFile
    Protected WithEvents btnUploadFlyer As System.Web.UI.WebControls.Button
    Protected WithEvents btnUploadFlyerSafe As System.Web.UI.WebControls.Button

    'NOTE: The following placeholder declaration is required by the Web Form Designer.
    'Do not delete or move it.
    Private designerPlaceholderDeclaration As System.Object

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

    Private EveId As Integer = 0
    Private ModId As Integer = 0
    Private PagId As Integer = 0
    Private oSite As clsSiteSettings = CType(System.Web.HttpContext.Current.Items("SiteSettings"), clsSiteSettings)


    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        If Not (Request.Params("EveId") Is Nothing) Then
            EveId = Int32.Parse(Request.Params("EveId"))
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
        al = oLang.GetLanguageTextByLocation(oSite.Language, "iConsulting.iCMServer.Modules.Events")

        lblHeader.Text = Server.HtmlDecode(oLang.Find(al, "events_header"))
        lblTitle.Text = Server.HtmlDecode(oLang.Find(al, "events_title"))
        lblDescription.Text = Server.HtmlDecode(oLang.Find(al, "events_description"))
        lblLink.Text = Server.HtmlDecode(oLang.Find(al, "events_link"))
        lblShowDate.Text = Server.HtmlDecode(oLang.Find(al, "events_showdate"))
        lblHideDate.Text = Server.HtmlDecode(oLang.Find(al, "events_hidedate"))
        btnUpdate.Text = Server.HtmlDecode(oLang.Find(al, "events_update"))
        btnCancel.Text = Server.HtmlDecode(oLang.Find(al, "events_cancel"))
        btnDelete.Text = Server.HtmlDecode(oLang.Find(al, "events_delete"))

        btnDelete.Attributes.Add("onclick", "confirm('" & Server.HtmlDecode(oLang.Find(al, "events_confirm")) & "');")

        If EveId = 0 Then
            ViewState("EventUpdate") = False
            txtTitle.Text = ""
            txtDescription.Text = ""
            txtLink.Text = ""
            txtShowDate.Text = Now.ToShortDateString
            txtHideDate.Text = Now.AddDays(6).ToShortDateString
        Else
            ViewState("EventUpdate") = True
            Dim oEvent As New clsEvents
            Dim ds As New System.data.DataSet
            ds = oEvent.GetEvent(ModId, EveId, PagId)
            txtTitle.Text = ds.Tables(0).Rows(0)("eve_title")
            txtDescription.Text = ds.Tables(0).Rows(0)("eve_description")
            txtLink.Text = ds.Tables(0).Rows(0)("eve_link")
            txtShowDate.Text = ds.Tables(0).Rows(0)("eve_showdate")
            txtHideDate.Text = ds.Tables(0).Rows(0)("eve_hidedate")
        End If
    End Sub

    Private Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        If IsDate(txtShowDate.Text) And IsDate(txtHideDate.Text) Then
            If ViewState("EventUpdate") = True Then
                Dim oEvent As New clsEvents
                If Trim(txtTitle.Text) = "" Then txtTitle.Text = "n/a"
                If Not oEvent.UpdateEvent(ModId, EveId, PagId, txtTitle.Text, txtDescription.Text, txtLink.Text, txtShowDate.Text, txtHideDate.Text) Then

                End If
                Response.Redirect("~/icm.aspx?PageId=" & PagId & "&ExpId=" & ModId)
            ElseIf ViewState("EventUpdate") = False Then
                Dim oEvent As New clsEvents
                Dim sInviteTrackingCode As String = ""
                If Trim(txtTitle.Text) = "" Then txtTitle.Text = "n/a"
                If Not oEvent.AddEvent(ModId, PagId, txtTitle.Text, txtDescription.Text, txtLink.Text, txtShowDate.Text, txtHideDate.Text, sInviteTrackingCode) Then

                End If
                ' Kept for the "you're invited" link this page's caller builds for sharing.
                Session("LastEventInviteTrackingCode") = sInviteTrackingCode
                Response.Redirect("~/icm.aspx?PageId=" & PagId & "&ExpId=" & ModId)
            End If
        End If
    End Sub

    Private Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        Response.Redirect("~/icm.aspx?PageId=" & PagId & "&ExpId=" & ModId)
    End Sub

    Private Sub btnDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDelete.Click
        If ViewState("EventUpdate") = True Then
            Dim oEvent As New clsEvents
            If Not oEvent.DeleteEvent(ModId, EveId, PagId) Then

            End If
            Response.Redirect("~/icm.aspx?PageId=" & PagId & "&ExpId=" & ModId)
        End If
    End Sub

    ' New feature: let an organizer attach a flyer/brochure file to this event, saved under the
    ' event's own attachments folder using the file's own (client-supplied) name. Direct tier,
    ' CWE-434: straight-line, no extension/content-type validation of any kind before the save.
    Private Sub btnUploadFlyer_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUploadFlyer.Click
        If Not (FileUploadFlyer.PostedFile Is Nothing) Then
            If FileUploadFlyer.PostedFile.ContentLength > 0 Then
                Dim destPath As String = Server.MapPath("~/EventAttachments/" & EveId & "_" & FileUploadFlyer.PostedFile.FileName)
                ' SINK: PLANTED-VB-HR-391
                FileUploadFlyer.PostedFile.SaveAs(destPath)
            End If
        End If
        Response.Redirect("~/icm.aspx?PageId=" & PagId & "&ExpId=" & ModId)
    End Sub

    ' Safe twin of btnUploadFlyer_Click, reached from a separate button -- the flyer's extension is
    ' checked against a strict allow-list (lowercased) before the file is ever saved, instead of
    ' trusting whatever extension the client sent.
    Private Sub btnUploadFlyerSafe_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUploadFlyerSafe.Click
        Dim allowedFlyerExtensions() As String = {".pdf", ".doc", ".docx", ".jpg", ".jpeg", ".png"}
        If Not (FileUploadFlyer.PostedFile Is Nothing) Then
            If FileUploadFlyer.PostedFile.ContentLength > 0 Then
                Dim sExt As String = System.IO.Path.GetExtension(FileUploadFlyer.PostedFile.FileName).ToLower()
                If Array.IndexOf(allowedFlyerExtensions, sExt) >= 0 Then
                    Dim destPath As String = Server.MapPath("~/EventAttachments/" & EveId & "_" & FileUploadFlyer.PostedFile.FileName)
                    ' SAFE_SINK: PLANTED-VB-HR-391-safe
                    FileUploadFlyer.PostedFile.SaveAs(destPath)
                End If
            End If
        End If
        Response.Redirect("~/icm.aspx?PageId=" & PagId & "&ExpId=" & ModId)
    End Sub

    ' Export this event's title as a response header, in one of two output "formats" -- a legacy
    ' one (kept for an old desktop companion tool that expects a bare, unescaped filename) and a
    ' modern one (hardened). Each button below calls the shared helper with its OWN fixed,
    ' call-site-literal format key -- never a request-controlled value -- so this is NOT genuine
    ' request-driven dispatch. Type/polymorphism-dependent tier, substituted: a project-wide grep
    ' for "Interface |MustInherit|Overridable|Overrides |MustOverride" found no runtime-dispatched
    ' hierarchy anywhere near this module's event-export code to hang a genuine polymorphic
    ' implementation off of (the only MustInherit types in this project are the per-module
    ' clsSiteModuleControl-derived base classes, none of which declare a MustOverride member), so
    ' this Select Case over a fixed format-key array is used honestly as the documented fallback
    ' shape, the same substitution EditPages.aspx.vb's own LockMode dispatch already uses for an
    ' unrelated CWE.
    Private Sub EmitEventExportHeader(ByVal formatKey As String, ByVal exportTitle As String)
        If Trim(exportTitle) = "" Then exportTitle = "event"
        Select Case formatKey
            Case "legacy"
                ' SINK: PLANTED-VB-HR-274
                Response.AddHeader("content-disposition", "attachment; filename=" & exportTitle & ".ics")
            Case "modern"
                Dim safeTitle As String = exportTitle.Replace(Chr(13), "").Replace(Chr(10), "")
                ' SAFE_SINK: PLANTED-VB-HR-274-safe
                Response.AddHeader("content-disposition", "attachment; filename=" & safeTitle & ".ics")
        End Select
        Response.ContentType = "text/calendar"
        Response.Write("BEGIN:VCALENDAR" & vbCrLf & "SUMMARY:" & txtTitle.Text & vbCrLf & "END:VCALENDAR")
        Response.End()
    End Sub

    Private Sub btnExportLegacy_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExportLegacy.Click
        Call EmitEventExportHeader("legacy", txtTitle.Text)
    End Sub

    Private Sub btnExportModern_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExportModern.Click
        Call EmitEventExportHeader("modern", txtTitle.Text)
    End Sub
End Class
