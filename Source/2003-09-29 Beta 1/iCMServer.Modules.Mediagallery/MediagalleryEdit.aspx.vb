
Imports System.Web
Imports iConsulting.iCMServer.iCDataManager

Public Class MediagalleryEdit
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

    Private PageID As Integer = 0
    Private ModID As Integer = 0
    Private CatID As Integer = 0
    Private DocId As Integer = 0

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

        Dim oMed As New clsMediagallery
        If Not oMed.DeleteDocument(PageID, ModID, CatID, DocId) Then

        End If

        ' Allow the delete confirmation link to specify exactly where to send the admin
        ' back to (e.g. a multi-document batch-delete view), instead of always falling
        ' back to whatever page happened to link here.
        Dim redirectTo As String = Request.QueryString("RedirectTo")
        If Not String.IsNullOrEmpty(redirectTo) Then
            RedirectAfterDelete(redirectTo)
        Else
            Response.Redirect(CType(Request.UrlReferrer.ToString(), String))
        End If

    End Sub

    Private Sub RedirectAfterDelete(ByVal target As String)
        ' SINK: PLANTED-VB-HR-127
        Response.Redirect(target)
    End Sub

End Class
