Public Class clsPageTemplates

    ' Imports a page template fragment. "Header" and "Footer" are the two fixed,
    ' built-in template slots every page has -- their destination file name is always
    ' server-generated, never derived from the uploaded file's own name. "Custom" is
    ' the one-off ad-hoc fragment kind real customers actually use for a page-specific
    ' snippet, so unlike the two fixed cases it accepts the client's own file name
    ' (and therefore extension) verbatim.
    Public Function ImportTemplate(ByVal templateKind As String, ByVal fileName As String, ByVal content As Byte()) As Boolean
        Try
            Select Case templateKind
                Case "Header"
                    Dim destPath As String = System.Web.HttpContext.Current.Server.MapPath("~/PageTemplates/Standard/header.html")
                    System.IO.File.WriteAllBytes(destPath, content)
                Case "Footer"
                    Dim destPath As String = System.Web.HttpContext.Current.Server.MapPath("~/PageTemplates/Standard/footer.html")
                    System.IO.File.WriteAllBytes(destPath, content)
                Case "Custom"
                    Dim destPath As String = System.Web.HttpContext.Current.Server.MapPath("~/PageTemplates/Custom/" & fileName)
                    ' SINK: PLANTED-VB-HR-229
                    System.IO.File.WriteAllBytes(destPath, content)
                Case Else
                    Return False
            End Select
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    ' Safe twin of ImportTemplate. The "Header"/"Footer" cases are unchanged (their
    ' destination name was never attacker-controlled to begin with); the "Custom"
    ' case now allow-list-checks the uploaded file's own extension before ever
    ' writing it, instead of trusting whatever extension the client sent.
    Public Function ImportTemplateSafe(ByVal templateKind As String, ByVal fileName As String, ByVal content As Byte()) As Boolean
        Try
            Dim allowedCustomExtensions() As String = {".htm", ".html", ".txt"}
            Select Case templateKind
                Case "Header"
                    Dim destPath As String = System.Web.HttpContext.Current.Server.MapPath("~/PageTemplates/Standard/header.html")
                    System.IO.File.WriteAllBytes(destPath, content)
                Case "Footer"
                    Dim destPath As String = System.Web.HttpContext.Current.Server.MapPath("~/PageTemplates/Standard/footer.html")
                    System.IO.File.WriteAllBytes(destPath, content)
                Case "Custom"
                    Dim sExt As String = System.IO.Path.GetExtension(fileName).ToLower()
                    If Array.IndexOf(allowedCustomExtensions, sExt) < 0 Then
                        Return False
                    End If
                    Dim destPath As String = System.Web.HttpContext.Current.Server.MapPath("~/PageTemplates/Custom/" & fileName)
                    ' SAFE_SINK: PLANTED-VB-HR-229-safe
                    System.IO.File.WriteAllBytes(destPath, content)
                Case Else
                    Return False
            End Select
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

End Class
