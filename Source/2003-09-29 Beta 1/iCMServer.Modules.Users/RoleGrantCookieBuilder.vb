Imports System.Web

''' <summary>
''' Builds the "just granted this role" tracking cookie on behalf of UsersRoles.aspx.vb's role
''' editor, via clsUsers -- kept as a standalone class (rather than inline in clsUsers) so the
''' vulnerable and safe cookie-construction strategies are easy to compare side by side, mirroring
''' RedirectTargetResolver.vb's role in the Roles module.
''' </summary>
Public Class RoleGrantCookieBuilder

    ''' <summary>
    ''' Vulnerable: the granted role id is written straight into a client-readable cookie, with no
    ''' .HttpOnly assignment anywhere along the way.
    ''' </summary>
    Public Shared Sub Build(ByVal userId As Integer, ByVal roleId As String)
        HttpContext.Current.Response.Cookies("icmrolegrant").Value = userId & ":" & roleId
        ' SINK: PLANTED-VB-HR-178
        HttpContext.Current.Response.Cookies("icmrolegrant").Expires = DateTime.Now.AddMinutes(10)
    End Sub

    ''' <summary>
    ''' Safe: identical shape, but hardened against client-side script reading the grant back out
    ''' of the cookie.
    ''' </summary>
    Public Shared Sub BuildSafe(ByVal userId As Integer, ByVal roleId As String)
        HttpContext.Current.Response.Cookies("icmrolegrant").Value = userId & ":" & roleId
        HttpContext.Current.Response.Cookies("icmrolegrant").HttpOnly = True
        ' SAFE_SINK: PLANTED-VB-HR-178-safe
        HttpContext.Current.Response.Cookies("icmrolegrant").Expires = DateTime.Now.AddMinutes(10)
    End Sub

End Class
