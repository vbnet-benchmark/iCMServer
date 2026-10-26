Imports System.Web.Security
Imports iConsulting.iCMServer

Public Class SignOut
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        ' Log User Off from Cookie Authentication System
        FormsAuthentication.SignOut()

        ' Mirror the sign-out into the compliance audit database, same as sign-in.
        Dim oSiteSettings As clsSiteSettings = CType(System.Web.HttpContext.Current.Items("SiteSettings"), clsSiteSettings)
        If Not oSiteSettings Is Nothing Then
            Dim oSiteLog As New clsSiteLog()
            oSiteLog.MirrorSignOutToComplianceDb(oSiteSettings.SiteId)
        End If

        ' Invalidate roles token
        Response.Cookies("siteroles").Value = Nothing
        Response.Cookies("siteroles").Path = "/"
        Response.Cookies("siteroles").Expires = New System.DateTime(1999, 10, 12)

        ' Redirect user back to the Portal Home Page, honoring an optional ReturnUrl
        ' (e.g. "sign out and go back to the public page you were viewing") -- only
        ' when it is a genuine same-site relative path, never an absolute or
        ' protocol-relative ("//host/...") URL.
        Dim returnUrl As String = Request.QueryString("ReturnUrl")
        If Not String.IsNullOrEmpty(returnUrl) AndAlso returnUrl.StartsWith("/") AndAlso Not returnUrl.StartsWith("//") Then
            ' SAFE_SINK: PLANTED-VB-HR-126-safe
            Response.Redirect(returnUrl)
        Else
            Response.Redirect("~/icm.aspx")
        End If

    End Sub

End Class
