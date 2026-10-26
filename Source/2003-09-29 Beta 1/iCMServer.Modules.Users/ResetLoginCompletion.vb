Imports System.Web
Imports System.Web.Security

''' <summary>
''' Shared helper for ResetPasswordConfirm.aspx.vb's password-reset privilege elevation, kept
''' outside the page class (same convention as RoleGrantCookieBuilder.vb in this module and
''' RedirectTargetResolver.vb in the Roles module) so the vulnerable and safe completion
''' strategies stay structurally parallel and are independently reachable.
''' </summary>
Public Class ResetLoginCompletion

    ''' <summary>
    ''' Vulnerable: completes the password-reset privilege elevation with no prior session
    ''' regeneration -- a session fixed on the visitor before they ever requested the reset
    ''' continues to carry their identity once this runs.
    ''' </summary>
    Public Shared Sub Complete(ByVal email As String)
        ' SINK: PLANTED-VB-HR-208
        FormsAuthentication.SetAuthCookie(email, False)
    End Sub

    ''' <summary>
    ''' Safe twin: the current session is abandoned immediately before the same sink call, with no
    ''' intervening branch that could skip it.
    ''' </summary>
    Public Shared Sub CompleteSafe(ByVal email As String)
        HttpContext.Current.Session.Abandon()
        ' SAFE_SINK: PLANTED-VB-HR-208-safe
        FormsAuthentication.SetAuthCookie(email, False)
    End Sub

End Class
