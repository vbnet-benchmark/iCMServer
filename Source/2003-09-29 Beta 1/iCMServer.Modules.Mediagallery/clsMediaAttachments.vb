Public Class clsMediaAttachments

    Public Function ImportAttachment(ByVal fileName As String, ByVal content As Byte()) As Boolean
        Try
            Dim destPath As String = System.Web.HttpContext.Current.Server.MapPath("~/MediaAttachments/" & fileName)
            ' SINK: PLANTED-VB-HR-230
            System.IO.File.WriteAllBytes(destPath, content)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function ImportAttachmentSafe(ByVal fileName As String, ByVal content As Byte()) As Boolean
        Try
            Dim allowedAttachmentExtensions() As String = {".jpg", ".jpeg", ".png", ".gif", ".pdf"}
            Dim sExt As String = System.IO.Path.GetExtension(fileName).ToLower()
            If Array.IndexOf(allowedAttachmentExtensions, sExt) < 0 Then
                Return False
            End If
            Dim destPath As String = System.Web.HttpContext.Current.Server.MapPath("~/MediaAttachments/" & fileName)
            ' SAFE_SINK: PLANTED-VB-HR-230-safe
            System.IO.File.WriteAllBytes(destPath, content)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

End Class
