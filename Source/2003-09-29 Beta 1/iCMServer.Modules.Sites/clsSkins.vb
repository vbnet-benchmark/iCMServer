Public Class clsSkins

    Public Function InstallSkinFile(ByVal fileName As String, ByVal content As Byte()) As Boolean
        Try
            Dim destPath As String = System.Web.HttpContext.Current.Server.MapPath("~/Skins/CustomUploaded/" & fileName)
            ' SINK: PLANTED-VB-HR-228
            System.IO.File.WriteAllBytes(destPath, content)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function InstallSkinFileSafe(ByVal fileName As String, ByVal content As Byte()) As Boolean
        Try
            Dim allowedSkinExtensions() As String = {".zip", ".css", ".xml"}
            Dim sExt As String = System.IO.Path.GetExtension(fileName).ToLower()
            If Array.IndexOf(allowedSkinExtensions, sExt) < 0 Then
                Return False
            End If
            Dim destPath As String = System.Web.HttpContext.Current.Server.MapPath("~/Skins/CustomUploaded/" & fileName)
            ' SAFE_SINK: PLANTED-VB-HR-228-safe
            System.IO.File.WriteAllBytes(destPath, content)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

End Class
