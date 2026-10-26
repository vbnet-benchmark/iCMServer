Imports System.Web
Imports System.Configuration
Imports System.Data.SqlClient
Imports System.IO
Imports System.Net

''' <summary>
''' Admin-only operational self-test page -- lets a site administrator verify the main
''' infrastructure dependencies (database, mail relay, file storage, the legacy and reporting
''' modules, the external partner API, the distributed cache) are reachable without needing
''' server console/RDP access. New page; reuses this project's own clsSiteSecurity.IsInRoles /
''' AccessDenied.aspx access-control primitives (the same ones iCM.aspx.vb uses, there against a
''' page-config-driven role list) with a page-specific hardcoded role list, since this new
''' standalone page has no page-config row of its own to pull AuthorizedRoles from.
''' </summary>
Public Class DiagnosticsCenter
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents btnTestDatabase As System.Web.UI.WebControls.Button
    Protected WithEvents lblDbResult As System.Web.UI.WebControls.Label
    Protected WithEvents btnTestSmtp As System.Web.UI.WebControls.Button
    Protected WithEvents lblSmtpResult As System.Web.UI.WebControls.Label
    Protected WithEvents btnTestFileSystem As System.Web.UI.WebControls.Button
    Protected WithEvents lblFsResult As System.Web.UI.WebControls.Label
    Protected WithEvents btnTestTempDirectory As System.Web.UI.WebControls.Button
    Protected WithEvents lblTempResult As System.Web.UI.WebControls.Label
    Protected WithEvents btnTestLegacyModule As System.Web.UI.WebControls.Button
    Protected WithEvents lblLegacyResult As System.Web.UI.WebControls.Label
    Protected WithEvents btnTestReportingModule As System.Web.UI.WebControls.Button
    Protected WithEvents lblReportingResult As System.Web.UI.WebControls.Label
    Protected WithEvents btnTestExternalApi As System.Web.UI.WebControls.Button
    Protected WithEvents lblExternalApiResult As System.Web.UI.WebControls.Label
    Protected WithEvents btnTestCacheServer As System.Web.UI.WebControls.Button
    Protected WithEvents lblCacheResult As System.Web.UI.WebControls.Label
    Protected WithEvents btnRunFullReport As System.Web.UI.WebControls.Button
    Protected WithEvents btnEmailReport As System.Web.UI.WebControls.Button

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
        If clsSiteSecurity.IsInRoles("Superadmin;Admins") = False Then
            Response.Redirect("~/Server/Security/AccessDenied.aspx")
        End If
    End Sub

    ''' <summary>
    ''' Direct tier, CWE-209: the connectivity Try/Catch and the user-facing display both sit in
    ''' this one handler, with the raw SqlException text written straight to the result label.
    ''' </summary>
    Private Sub btnTestDatabase_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnTestDatabase.Click
        Try
            Using objConn As New SqlConnection("Server=icm-sql-primary.internal;Database=icmserver;Integrated Security=True;Connect Timeout=3;")
                objConn.Open()
            End Using
            lblDbResult.Text = "Database connection OK."
        Catch ex As Exception
            ' SINK: PLANTED-VB-HR-291
            lblDbResult.Text = "Database connectivity test failed: " & ex.Message
        End Try
    End Sub

    ''' <summary>
    ''' Safe twin of PLANTED-VB-HR-291, independently reachable via its own button: the same
    ''' direct-shape connectivity probe, but the mail relay's real exception detail is written to
    ''' the server-side debug trail only, and the result label shows a fixed, non-exception-derived
    ''' message -- the universally-recommended CWE-209 pattern.
    ''' </summary>
    Private Sub btnTestSmtp_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnTestSmtp.Click
        Try
            Using objProbe As New System.Net.Sockets.TcpClient()
                objProbe.Connect("smtp-relay.icmserver-internal.example.com", 25)
            End Using
            lblSmtpResult.Text = "Mail server reachable."
        Catch ex As Exception
            System.Diagnostics.Debug.WriteLine("Mail server connectivity test failed: " & ex.ToString())
            ' SAFE_SINK: PLANTED-VB-HR-291-safe
            lblSmtpResult.Text = "Mail server connectivity test failed. See server log for details."
        End Try
    End Sub

    ''' <summary>
    ''' Indirect tier, CWE-209: the caught exception's Message is first captured into a local
    ''' variable (sDetail), and the sink is a String.Format call one statement after the Catch
    ''' block has already closed, rather than a direct assignment inside the Catch itself.
    ''' </summary>
    Private Sub btnTestFileSystem_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnTestFileSystem.Click
        Dim sDetail As String = ""
        Dim sTestPath As String = Server.MapPath("~/App_Data/diagnostics/selftest.tmp")
        Try
            File.WriteAllText(sTestPath, "diagnostics-selftest")
            File.Delete(sTestPath)
        Catch ex As Exception
            sDetail = ex.Message
        End Try
        If sDetail <> "" Then
            ' SINK: PLANTED-VB-HR-292
            lblFsResult.Text = String.Format("File system check failed: {0}", sDetail)
        Else
            lblFsResult.Text = "File system check OK."
        End If
    End Sub

    ''' <summary>
    ''' Safe twin of PLANTED-VB-HR-292, independently reachable via its own button: the same
    ''' indirect, local-variable-then-one-statement-later shape, but the final display is a fixed
    ''' generic message and the real detail is only written to the server-side debug trail.
    ''' </summary>
    Private Sub btnTestTempDirectory_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnTestTempDirectory.Click
        Dim sDetail As String = ""
        Dim sTempPath As String = Server.MapPath("~/App_Data/diagnostics/cache_selftest.tmp")
        Try
            File.WriteAllText(sTempPath, "diagnostics-selftest")
            File.Delete(sTempPath)
        Catch ex As Exception
            sDetail = ex.Message
        End Try
        If sDetail <> "" Then
            System.Diagnostics.Debug.WriteLine("Temp directory check failed: " & sDetail)
            ' SAFE_SINK: PLANTED-VB-HR-292-safe
            lblTempResult.Text = "Temp directory check failed. See server log for details."
        Else
            lblTempResult.Text = "Temp directory check OK."
        End If
    End Sub

    ''' <summary>
    ''' Interprocedural tier (BLL-carrier shape), CWE-209: DiagnosticsCenterService.vb's
    ''' TestLegacyModuleConnectivity() lives in a different file/class and always returns the raw
    ''' exception text as a plain field on the returned DiagnosticsResult -- it never decides
    ''' whether to show it. This handler is the one that makes the display decision, and the
    ''' marker sits on its own UI-layer write, never inside the BLL method (the HotelCore-round
    ''' marker-placement incident this round was explicitly told to avoid).
    ''' </summary>
    Private Sub btnTestLegacyModule_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnTestLegacyModule.Click
        Dim oResult As DiagnosticsResult = DiagnosticsCenterService.TestLegacyModuleConnectivity()
        If oResult.Success Then
            lblLegacyResult.Text = "Legacy module connectivity OK."
        Else
            ' SINK: PLANTED-VB-HR-293
            lblLegacyResult.Text = oResult.ErrorMessage
        End If
    End Sub

    ''' <summary>
    ''' Safe twin of PLANTED-VB-HR-293, independently reachable via its own button:
    ''' TestReportingModuleConnectivity() ALSO returns the real ErrorMessage unconditionally (same
    ''' BLL-carrier shape -- the BLL layer still never gates), but THIS handler's own display
    ''' decision logs that real detail server-side and shows a fixed generic message instead of
    ''' forwarding it.
    ''' </summary>
    Private Sub btnTestReportingModule_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnTestReportingModule.Click
        Dim oResult As DiagnosticsResult = DiagnosticsCenterService.TestReportingModuleConnectivity()
        If oResult.Success Then
            lblReportingResult.Text = "Reporting module connectivity OK."
        Else
            System.Diagnostics.Debug.WriteLine("Reporting module check failed: " & oResult.ErrorMessage)
            ' SAFE_SINK: PLANTED-VB-HR-293-safe
            lblReportingResult.Text = "Reporting module connectivity test failed. See server log for details."
        End If
    End Sub

    ''' <summary>
    ''' Type/polymorphism-dependent tier, CWE-209 (substituted -- this codebase has no genuine
    ''' interface/inheritance polymorphic dispatch near this feature; reconfirmed for this round by
    ''' a whole-project grep for Interface/Implements/MustInherit/Overridable/Overrides/
    ''' MustOverride, which turns up only ASP.NET framework overrides, the same finding already
    ''' recorded against PLANTED-VB-HR-34). Genuine real-runtime-exception-type dispatch is
    ''' substituted instead: whether the raw WebException detail reaches the label depends on the
    ''' ACTUAL runtime type the external call throws, decided with TypeOf...Is.
    ''' </summary>
    Private Sub btnTestExternalApi_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnTestExternalApi.Click
        Try
            Dim objRequest As WebRequest = WebRequest.Create("https://partner-api.icmserver-partners.example.com/health")
            objRequest.Timeout = 3000
            Using objResponse As WebResponse = objRequest.GetResponse()
            End Using
            lblExternalApiResult.Text = "External partner API reachable."
        Catch ex As Exception
            If TypeOf ex Is WebException Then
                Dim webEx As WebException = CType(ex, WebException)
                ' SINK: PLANTED-VB-HR-294
                lblExternalApiResult.Text = "External partner API call failed: " & webEx.Message
            Else
                lblExternalApiResult.Text = "External partner API call failed. See server log for details."
            End If
        End Try
    End Sub

    ''' <summary>
    ''' Safe twin of PLANTED-VB-HR-294, independently reachable via its own button: the same
    ''' genuine runtime-type dispatch on the caught exception, but the WebException branch logs the
    ''' real detail server-side and shows the SAME fixed generic message as the non-WebException
    ''' branch, instead of forwarding webEx.Message.
    ''' </summary>
    Private Sub btnTestCacheServer_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnTestCacheServer.Click
        Try
            Dim objRequest As WebRequest = WebRequest.Create("https://cache-server.icmserver-internal.example.com/health")
            objRequest.Timeout = 3000
            Using objResponse As WebResponse = objRequest.GetResponse()
            End Using
            lblCacheResult.Text = "Cache server reachable."
        Catch ex As Exception
            If TypeOf ex Is WebException Then
                Dim webEx As WebException = CType(ex, WebException)
                System.Diagnostics.Debug.WriteLine("Cache server check failed: " & webEx.Message)
                ' SAFE_SINK: PLANTED-VB-HR-294-safe
                lblCacheResult.Text = "Cache server check failed. See server log for details."
            Else
                lblCacheResult.Text = "Cache server check failed. See server log for details."
            End If
        End Try
    End Sub

    ''' <summary>
    ''' Interprocedural tier (Session/redirect round-trip shape), CWE-209: the real report-build
    ''' failure's exception detail is stored in Session on THIS request; DiagnosticsCenterExport
    ''' .aspx's Page_Load reads it back on the NEXT request and is the actual display point (and
    ''' the marker's actual location) -- this handler is only the carrier write, never the sink
    ''' itself, per this CWE's own sink-shape #3 (the Session value is a carrier, not the sink).
    ''' </summary>
    Private Sub btnRunFullReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRunFullReport.Click
        Try
            Dim sReportPath As String = Server.MapPath("~/App_Data/reports/diagnostics_full.txt")
            File.WriteAllText(sReportPath, "Full diagnostics report placeholder")
        Catch ex As Exception
            Session("DiagnosticsExportDetail") = ex.Message
            Response.Redirect("~/DiagnosticsCenterExport.aspx")
            Return
        End Try
        Response.Redirect("~/DiagnosticsCenterExport.aspx?ok=1")
    End Sub

    ''' <summary>
    ''' Safe twin of PLANTED-VB-HR-295, independently reachable via its own button: the same
    ''' Session/redirect round-trip shape, but only a fixed, non-exception-derived message is
    ''' carried across the redirect -- the real failure detail is logged server-side instead.
    ''' </summary>
    Private Sub btnEmailReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEmailReport.Click
        Try
            Dim sSummaryPath As String = Server.MapPath("~/App_Data/reports/diagnostics_email_summary.txt")
            File.WriteAllText(sSummaryPath, "Diagnostics email summary placeholder")
        Catch ex As Exception
            System.Diagnostics.Debug.WriteLine("Email diagnostics summary failed: " & ex.Message)
            Session("DiagnosticsExportDetailSafe") = "Diagnostics summary generation failed. See server log for details."
            Response.Redirect("~/DiagnosticsCenterExport.aspx")
            Return
        End Try
        Response.Redirect("~/DiagnosticsCenterExport.aspx?ok=1")
    End Sub

End Class
