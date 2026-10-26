''' <summary>
'''     Type/polymorphism-dependent tier of CWE-611 for this module's "Import Site
'''     Configuration from XML" feature. Two export formats exist side by side: an older,
'''     DOCTYPE-bearing export some installations still produce, and the newer, strict export
'''     format introduced when the product moved away from custom entities.
'''     SiteConfigFormatParserFactory.CreateParser picks the matching implementation by
'''     sniffing the export's own content, so EditSitesUpload.aspx.vb's single
'''     btnImportSiteConfigAutoDetect_Click call site never shows which concrete parser will
'''     actually run.
'''
'''     GENUINE, newly introduced for this feature -- this project's own pre-existing
'''     MustInherit/MustOverride hierarchy, DesktopLayoutFormatStrategy.vb, drives a desktop
'''     theme-preference deserialization feature (CWE-502) that is unrelated to XML parsing and
'''     has no fitting dispatch point to reuse here; its own doc comment says as much. The
'''     other genuine polymorphic shape in this project, Roles' IRolePolicyDocumentHandler
'''     interface (CWE-434/file-saving), is likewise a different domain. Mirrors the same
'''     feature-shape precedent already used for this exact CWE in the CammIntegrationPortal
'''     (PartnerFeedFormatParser), SchoolManagementERP and WebGoatVBNET (PartnerFeedParser)
'''     benchmark projects: a fresh content-sniffing parser hierarchy built specifically for
'''     the XML-import feature it serves.
''' </summary>
Public MustInherit Class SiteConfigFormatParser
    Public MustOverride Function Parse(ByVal xmlText As String) As System.Xml.XmlDocument
End Class

''' <summary>
'''     Legacy site-config export format: re-enables external entity/DTD resolution so an
'''     export that declares a DOCTYPE referencing the installation's own shared entity set
'''     still imports correctly.
''' </summary>
Public Class LegacySiteConfigParser
    Inherits SiteConfigFormatParser

    Public Overrides Function Parse(ByVal xmlText As String) As System.Xml.XmlDocument
        Dim doc As New System.Xml.XmlDocument()
        doc.XmlResolver = New System.Xml.XmlUrlResolver()
        doc.LoadXml(xmlText) ' SINK: PLANTED-VB-HR-424
        Return doc
    End Function
End Class

''' <summary>
'''     SAFE: modern site-config export format. Never assigns a working XmlResolver, so it
'''     stays at the type's own Nothing default and no external entity/DTD is ever resolved.
''' </summary>
Public Class ModernSiteConfigParser
    Inherits SiteConfigFormatParser

    Public Overrides Function Parse(ByVal xmlText As String) As System.Xml.XmlDocument
        Dim doc As New System.Xml.XmlDocument()
        doc.LoadXml(xmlText) ' SAFE_SINK: PLANTED-VB-HR-424-safe
        Return doc
    End Function
End Class

Public Module SiteConfigFormatParserFactory

    ''' <summary>
    '''     Sniffs the export's own content to pick the matching concrete parser -- a legacy
    '''     export declares a DOCTYPE, the modern export format never does.
    ''' </summary>
    Public Function CreateParser(ByVal xmlText As String) As SiteConfigFormatParser
        If xmlText.Contains("<!DOCTYPE") Then
            Return New LegacySiteConfigParser()
        Else
            Return New ModernSiteConfigParser()
        End If
    End Function

End Module
