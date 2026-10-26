Imports System.Web
Imports System.Collections
Imports System.Data

Public MustInherit Class iFrame : Inherits clsSiteModuleControl

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents LiteralIFrame As System.Web.UI.WebControls.Literal
    Protected WithEvents LiteralIFrameSize As System.Web.UI.WebControls.Literal

    'NOTE: The following placeholder declaration is required by the Web Form Designer.
    'Do not delete or move it.
    Private designerPlaceholderDeclaration As System.Object

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region
    Protected Minimizer As System.Web.UI.HtmlControls.HtmlGenericControl

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Minimizer.ID = ModuleId
        If Not Page.IsPostBack Then
            Call BindData()
        End If
    End Sub

    Private Sub BindData()
        Dim oSite As clsSiteSettings = CType(HttpContext.Current.Items("SiteSettings"), clsSiteSettings)
        Dim oiFrame As New clsiFrame
        Dim ds As New DataSet
        ds = oiFrame.GetiFrame(ModuleId, oSite.ActivePage.PageId)
        If ds.Tables.Count > 0 Then
            If ds.Tables(0).Rows.Count > 0 Then
                LiteralIFrame.Text = "<iframe id='iframeholder' src='" & ds.Tables(0).Rows(0)("ifr_url") & "' width='" & ds.Tables(0).Rows(0)("ifr_width") & "' height='" & ds.Tables(0).Rows(0)("ifr_height") & "' frameborder='0'></iframe>"
                'LiteralIFrameSize.Text = "<script>document.getElementById('iframeholder').height = '600'</script>"
            End If
        End If
    End Sub

End Class
