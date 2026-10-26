''' <summary>
''' Interprocedural / diversity tiers of CWE-434 for this module's custom-icon feature,
''' QuicklinksEdit.aspx.vb's new "attach icon" and "bulk import icons" buttons -- a genuinely
''' separate call chain, in its own cross-file class, reached two ways: a single-file save
''' (SaveIcon/SaveIconSafe) and a bulk/multi-file save (SaveIconBatch/SaveIconBatchSafe) used from
''' a loop over Request.Files.AllKeys rather than by numeric index.
''' </summary>
Public Class QuicklinkIconUploadService

    ' Interprocedural tier, CWE-434: no extension/content-type validation of any kind before the
    ' write -- the file's own client-supplied name is used verbatim for the saved path.
    Public Sub SaveIcon(ByVal fileName As String, ByVal content As Byte())
        Dim destPath As String = System.Web.HttpContext.Current.Server.MapPath("~/QuicklinkIcons/" & fileName)
        ' SINK: PLANTED-VB-HR-393
        System.IO.File.WriteAllBytes(destPath, content)
    End Sub

    ' Safe twin of SaveIcon: the icon's extension is checked against a strict allow-list
    ' (lowercased) before the file is ever written.
    Public Sub SaveIconSafe(ByVal fileName As String, ByVal content As Byte())
        Dim allowedIconExtensions() As String = {".png", ".gif", ".jpg", ".jpeg", ".ico"}
        Dim sExt As String = System.IO.Path.GetExtension(fileName).ToLower()
        If Array.IndexOf(allowedIconExtensions, sExt) >= 0 Then
            Dim destPath As String = System.Web.HttpContext.Current.Server.MapPath("~/QuicklinkIcons/" & fileName)
            ' SAFE_SINK: PLANTED-VB-HR-393-safe
            System.IO.File.WriteAllBytes(destPath, content)
        End If
    End Sub

    ' Diversity tier, CWE-434: bulk-import shape -- called once per posted file from
    ' QuicklinksEdit.aspx.vb's btnBulkImportIcons_Click loop (filtered by Request.Files.AllKeys,
    ' not by index, unlike Mediagallery's own bulk-import loop elsewhere in this project), with no
    ' per-file extension check -- a distinct sink line from the single-icon SaveIcon above, even
    ' though both ultimately perform the same kind of unchecked write.
    Public Sub SaveIconBatch(ByVal fileName As String, ByVal content As Byte())
        Dim destPath As String = System.Web.HttpContext.Current.Server.MapPath("~/QuicklinkIcons/" & fileName)
        ' SINK: PLANTED-VB-HR-395
        System.IO.File.WriteAllBytes(destPath, content)
    End Sub

    ' Safe twin of SaveIconBatch: identical batch shape, but each file's extension is checked
    ' against the same strict allow-list before it is written.
    Public Sub SaveIconBatchSafe(ByVal fileName As String, ByVal content As Byte())
        Dim allowedIconExtensions() As String = {".png", ".gif", ".jpg", ".jpeg", ".ico"}
        Dim sExt As String = System.IO.Path.GetExtension(fileName).ToLower()
        If Array.IndexOf(allowedIconExtensions, sExt) >= 0 Then
            Dim destPath As String = System.Web.HttpContext.Current.Server.MapPath("~/QuicklinkIcons/" & fileName)
            ' SAFE_SINK: PLANTED-VB-HR-395-safe
            System.IO.File.WriteAllBytes(destPath, content)
        End If
    End Sub

End Class
