Imports System.Web

''' <summary>
''' Landing page for DiagnosticsCenter.aspx's two report-generation flows (Session/redirect
''' round-trip shape). Reads back whichever carrier key the triggering handler set on the
''' PREVIOUS request -- this Page_Load is the actual display point for both
''' PLANTED-VB-HR-295 (DiagnosticsExportDetail, vulnerable) and PLANTED-VB-HR-295-safe
''' (DiagnosticsExportDetailSafe, safe). The two keys are independently reachable via
''' DiagnosticsCenter.aspx's two distinct buttons (btnRunFullReport and btnEmailReport) -- never
''' the same control double-wired to two handlers.
''' </summary>
Public Class DiagnosticsCenterExport
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents lblExportResult As System.Web.UI.WebControls.Label

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

        Dim sRawDetail As String = CStr(Session("DiagnosticsExportDetail"))
        Dim sSafeDetail As String = CStr(Session("DiagnosticsExportDetailSafe"))

        If Not String.IsNullOrEmpty(sRawDetail) Then
            ' SINK: PLANTED-VB-HR-295
            lblExportResult.Text = "Full diagnostics report failed: " & Server.HtmlEncode(sRawDetail)
            Session("DiagnosticsExportDetail") = Nothing
        ElseIf Not String.IsNullOrEmpty(sSafeDetail) Then
            ' SAFE_SINK: PLANTED-VB-HR-295-safe
            lblExportResult.Text = sSafeDetail
            Session("DiagnosticsExportDetailSafe") = Nothing
        Else
            lblExportResult.Text = "Diagnostics report generated successfully."
        End If
    End Sub

End Class
