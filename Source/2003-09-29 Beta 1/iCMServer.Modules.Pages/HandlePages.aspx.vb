Public Class HandlePages
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub

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

        Dim Mode As String
        Dim PageId As Integer = 0
        Dim ToId As Integer = 0
        Dim FromId As Integer = 0
        Dim ModId As Integer = 0
        Dim oPag As New clsPages
        Dim oSite As clsSiteSettings = CType(System.Web.HttpContext.Current.Items("SiteSettings"), clsSiteSettings)

        ' Ensure that the visiting user has access to the current page
        If clsSiteSecurity.IsInRoles("Superadmin;Admins") = False Then
            Response.Redirect("~/Server/Security/AccessDenied.aspx")
        End If

        ' Determine ItemId of Events to Update
        If Not (Request.Params("PageID") Is Nothing) Then
            PageID = Int32.Parse(Request.Params("PageID"))
        End If

        ' Determine ItemId of Events to Update
        If Not (Request.Params("ModId") Is Nothing) Then
            ModId = Int32.Parse(Request.Params("ModId"))
        End If

        ' Determine ItemId of Events to Update
        If Not (Request.Params("ToId") Is Nothing) Then
            ToId = Int32.Parse(Request.Params("ToId"))
        End If

        ' Determine ItemId of Events to Update
        If Not (Request.Params("FromId") Is Nothing) Then
            FromId = Int32.Parse(Request.Params("FromId"))
        End If

        ' Determine Handle event
        If Not (Request.Params("Mode") Is Nothing) Then
            Mode = Request.Params("Mode")
        End If

        Select Case LCase(Mode)
            Case "up"
                oPag.MoveNodeUp(PageId)
                Response.Redirect("~/icm.aspx?PageId=" & FromId & "&ExpId=" & ModId)
            Case "down"
                oPag.MoveNodeDown(PageId)
                Response.Redirect("~/icm.aspx?PageId=" & FromId & "&ExpId=" & ModId)
            Case "to"
                oPag.MoveNodeTo(PageId, ToId)
                Response.Redirect("~/icm.aspx?PageId=" & FromId & "&ExpId=" & ModId)
            Case "delete"
                oPag.DeleteNode(PageId)
                Response.Redirect("~/icm.aspx?PageId=" & FromId & "&ExpId=" & ModId)
            Case Else
                Response.Redirect("~/icm.aspx?PageId=" & FromId & "&ExpId=" & ModId)
        End Select

    End Sub

End Class
