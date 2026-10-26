Imports System.Web
Imports System.Diagnostics

''' <summary>
''' Request-diagnostics trail for the main iCMServer application pipeline -- kept as a standalone
''' class (rather than inline in Global.asax.vb) so the vulnerable error trail and the safe
''' request-completion trail are easy to compare side by side, mirroring RedirectTargetResolver.vb's
''' role in the Roles module and RoleGrantCookieBuilder.vb's in the Users module.
''' </summary>
Public Class ErrorDiagnosticsLogger

    Private Const EventSourceName As String = "iCMServer"

    ''' <summary>
    ''' Interprocedural tier, CWE-117: called from Global.asax.vb's Application_Error on every
    ''' unhandled exception in the application. Records the failing request's path and its
    ''' attacker-controlled "q" query-string value verbatim alongside the exception message, so a
    ''' support engineer can correlate a recurring failure across visitors -- but the unescaped "q"
    ''' value (URL-decoded by ASP.NET, so an embedded %0D%0A arrives as a literal CR/LF) lets an
    ''' attacker forge a second, fabricated Event Log entry.
    ''' </summary>
    Public Shared Sub LogRequestError(ByVal ex As Exception, ByVal request As HttpRequest)
        Dim sSearchTerm As String = request.QueryString("q")
        Dim sMessage As String = "Unhandled error: " & ex.Message & " | Url=" & request.Path & " | q=" & sSearchTerm
        ' SINK: PLANTED-VB-HR-188
        EventLog.WriteEntry(EventSourceName, sMessage, EventLogEntryType.Error)
    End Sub

    ''' <summary>
    ''' Safe twin of LogRequestError/PLANTED-VB-HR-188, called from Global.asax.vb's
    ''' Application_EndRequest -- the SAME "q" query-string parameter is read, but CR/LF is
    ''' stripped from it before the completion line is written, on every request rather than only
    ''' on a failing one.
    ''' </summary>
    Public Shared Sub LogRequestCompletion(ByVal request As HttpRequest, ByVal statusCode As Integer)
        Dim sSearchTerm As String = request.QueryString("q")
        If Not String.IsNullOrEmpty(sSearchTerm) Then
            sSearchTerm = sSearchTerm.Replace(vbCr, " ").Replace(vbLf, " ")
        End If
        Dim sMessage As String = "Request completed: Url=" & request.Path & " | q=" & sSearchTerm & " | Status=" & statusCode
        ' SAFE_SINK: PLANTED-VB-HR-188-safe
        EventLog.WriteEntry(EventSourceName, sMessage, EventLogEntryType.Information)
    End Sub

End Class
