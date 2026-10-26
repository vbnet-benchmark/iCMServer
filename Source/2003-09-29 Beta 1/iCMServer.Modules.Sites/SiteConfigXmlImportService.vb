''' <summary>
'''     Interprocedural tier of CWE-611 for this module's "Import Site Configuration from XML"
'''     feature, EditSitesUpload.aspx.vb's "Bulk Site Config Import" button -- a genuinely
'''     separate call chain, in its own cross-file class, used by a hosting admin who manages
'''     several sites and migrates all of their per-site configuration exports in one upload
'''     rather than one site at a time. Loops over the whole posted-files collection by index,
'''     mirroring Mediagallery's own bulk-upload loop elsewhere in this project
'''     (MediagalleryUpload.aspx.vb's "For i = 0 To Request.Files.Count - 1") rather than
'''     Quicklinks' sibling QuicklinkIconUploadService, which instead loops by
'''     Request.Files.AllKeys.
''' </summary>
Public Class SiteConfigXmlImportService

    ''' <summary>
    '''     Imports every posted site-config file in the batch, re-enabling external-entity
    '''     resolution so an older per-site export that still declares a DOCTYPE keeps
    '''     importing -- carried over unchanged from the single-site importer this batch
    '''     feature replaced.
    ''' </summary>
    Public Shared Function ImportBatch(ByVal postedFiles As System.Web.HttpFileCollection) As Integer
        Dim importedCount As Integer = 0
        For i As Integer = 0 To postedFiles.Count - 1
            Dim postedFile As System.Web.HttpPostedFile = postedFiles(i)
            If Not (postedFile Is Nothing) AndAlso postedFile.ContentLength > 0 Then
                Dim xmlText As String = New System.IO.StreamReader(postedFile.InputStream).ReadToEnd()
                Dim doc As New System.Xml.XmlDocument()
                doc.XmlResolver = New System.Xml.XmlUrlResolver()
                doc.LoadXml(xmlText) ' SINK: PLANTED-VB-HR-423
                importedCount += 1
            End If
        Next
        Return importedCount
    End Function

    ''' <summary>
    '''     Same batch-import loop as ImportBatch, but the resolver is never touched, so an
    '''     attacker-supplied DOCTYPE anywhere in the batch is rejected rather than resolved.
    ''' </summary>
    Public Shared Function ImportBatchSafe(ByVal postedFiles As System.Web.HttpFileCollection) As Integer
        Dim importedCount As Integer = 0
        For i As Integer = 0 To postedFiles.Count - 1
            Dim postedFile As System.Web.HttpPostedFile = postedFiles(i)
            If Not (postedFile Is Nothing) AndAlso postedFile.ContentLength > 0 Then
                Dim xmlText As String = New System.IO.StreamReader(postedFile.InputStream).ReadToEnd()
                Dim doc As New System.Xml.XmlDocument()
                doc.LoadXml(xmlText) ' SAFE_SINK: PLANTED-VB-HR-423-safe
                importedCount += 1
            End If
        Next
        Return importedCount
    End Function

End Class
