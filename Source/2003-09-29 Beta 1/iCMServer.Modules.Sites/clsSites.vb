Imports iConsulting.iCMServer.iCDataManager
Imports System.Data
Imports System.Web.UI.WebControls
Imports System.Web.UI.Page
Imports System.Web
Imports System
Imports System.Drawing
Imports iConsulting
Imports iConsulting.iCMServer
Imports System.Collections
Imports System.Text.RegularExpressions

Public Class clsSites

    Private oDO As New iCDataObject
    Private oCrypto As New iConsulting.iCMServer.clsCrypto
    Private ED As String = oCrypto.Encrypt(System.Configuration.ConfigurationSettings.AppSettings.Get("DataSource"))
    Private EC As String = oCrypto.Encrypt(System.Configuration.ConfigurationSettings.AppSettings.Get("ConnectionString"))
    Private oSite As clsSiteSettings = CType(HttpContext.Current.Items("SiteSettings"), clsSiteSettings)

    Public Function GetSiteTitle() As String
        Return oSite.SiteName
    End Function

    Public Function GetPicture(ByVal DocId As Integer) As DataSet
        Dim ds As New DataSet
        Try
            If Not oDO.GetDataSet("doc_documents", "sit_id = " & oSite.SiteId & " AND doc_id = " & DocId, "", "", ED, EC, ds) Then

            End If
            If ds.Tables.Count > 0 Then
                If ds.Tables(0).Rows.Count > 0 Then
                    Return ds
                Else
                    Return New DataSet
                End If
            Else
                Return New DataSet
            End If
        Catch ex As Exception
            Return New DataSet
        End Try
    End Function

    Public Function UpdatePicture(ByVal content As Byte(), ByVal contentType As String, ByVal length As Integer) As Boolean
        Dim ds As New DataSet
        Dim i As Integer
        Try
            If Not oDO.GetEmptyDataSet("doc_documents", "", ED, EC, ds) Then

            End If
            With ds.Tables(0).Rows(0)
                .Item("sit_id") = oSite.SiteId
                .Item("doc_rollup") = 0
                .Item("doc_revision") = 0
                .Item("doc_content") = content
                .Item("doc_contenttype") = contentType
                .Item("doc_contentsize") = length
                .Item("doc_createddate") = Now.ToLongDateString
                .Item("doc_createdby") = HttpContext.Current.User.Identity.Name
                .Item("doc_updateddate") = Now.ToLongDateString
                .Item("doc_updatedby") = HttpContext.Current.User.Identity.Name
            End With
            If Not oDO.SaveDataSet("", ED, EC, ds, True) Then

            End If
            i = ds.Tables(0).Rows(0)("doc_id")
            ds = New DataSet
            If Not oDO.GetDataSet("sit_sites", "sit_id = " & oSite.SiteId, "", "", ED, EC, ds) Then

            End If
            ds.Tables(0).Rows(0)("sit_logo") = i.ToString
            ds.Tables(0).Rows(0)("sit_logohref") = "EditSitesStream.aspx?DocId=" & i
            If Not oDO.SaveDataSet("", ED, EC, ds, False) Then

            End If
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function DeletePicture(ByVal DocId As Integer) As Boolean
        Dim ds As New DataSet
        Try
            If Not oDO.GetDataSet("doc_documents", "sit_id = " & oSite.SiteId & " AND doc_id = " & DocId, "", "", ED, EC, ds) Then

            End If
            If oSite.SiteSoftDelete Then
                ds.Tables(0).Rows(0)("doc_deleted") = 1
            Else
                ds.Tables(0).Rows(0).Delete()
            End If
            If Not oDO.SaveDataSet("", ED, EC, ds, False) Then

            End If
            ds = New DataSet
            If Not oDO.GetDataSet("sit_sites", "sit_id = " & oSite.SiteId, "", "", ED, EC, ds) Then

            End If
            ds.Tables(0).Rows(0)("sit_logo") = ""
            ds.Tables(0).Rows(0)("sit_logohref") = ""
            If Not oDO.SaveDataSet("", ED, EC, ds, False) Then

            End If
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function UpdateSiteSetting( _
        ByVal SiteName As String, _
        ByVal SiteLanguage As Integer, _
        ByVal ShowEdit As Boolean, _
        ByVal ShowFooter As Boolean, _
        ByVal FooterLeftText As String, _
        ByVal FooterContentText As String, _
        ByVal FooterRightText As String, _
        ByVal ContentAdjust As Integer, _
        ByVal SoftDelete As Boolean, _
        ByVal Color As String, _
        ByVal LogoHorizontalAlign As String, _
        ByVal LogoVerticalAlign As String, _
        ByVal HeadFamily As String, _
        ByVal HeadSize As String, _
        ByVal HeadWeight As String, _
        ByVal HeadColor As String, _
        ByVal SubHeadFamily As String, _
        ByVal SubHeadSize As String, _
        ByVal SubHeadWeight As String, _
        ByVal SubHeadColor As String, _
        ByVal SubSubHeadFamily As String, _
        ByVal SubSubHeadSize As String, _
        ByVal SubSubHeadWeight As String, _
        ByVal SubSubHeadColor As String, _
        ByVal NormalFamily As String, _
        ByVal NormalSize As String, _
        ByVal NormalWeight As String, _
        ByVal NormalColor As String, _
        ByVal ButtonFamily As String, _
        ByVal ButtonSize As String, _
        ByVal ButtonWeight As String, _
        ByVal ButtonForeColor As String, _
        ByVal ButtonBackColor As String, _
        ByVal ButtonBorderSize As String, _
        ByVal ButtonBorderColor As String, _
        ByVal ButtonTextAlign As String, _
        ByVal HrColor As String, _
        ByVal HrAlign As String, _
        ByVal HrHeight As String, _
        ByVal LogoHorizontalTiling As Boolean, _
        ByVal LogoVerticalTiling As Boolean, _
        ByVal MenuAlign As String, _
        ByVal MenuFade As Boolean, _
        ByVal MenuFadeDurance As String, _
        ByVal MenuOffset As Integer, _
        ByVal MenuTop As Integer, _
        ByVal MenuLeft As Integer, _
        ByVal MenuForeColor1 As String, _
        ByVal MenuBackColor1 As String, _
        ByVal MenuForeColor2 As String, _
        ByVal MenuBackColor2 As String, _
        ByVal MenuOverForeColor1 As String, _
        ByVal MenuOverBackColor1 As String, _
        ByVal MenuOverForeColor2 As String, _
        ByVal MenuOverBackColor2 As String, _
        ByVal MenuFont As String, _
        ByVal MenuPlacement As String, _
        ByVal MenuBetween As Integer, _
        ByVal MenuWait As Integer, _
        ByVal MenuLevel1BorderX As Boolean, _
        ByVal MenuLevel1BorderY As Boolean, _
        ByVal MenuLevel2BorderX As Boolean, _
        ByVal MenuLevel2BorderY As Boolean, _
        ByVal MenuBold1 As Boolean, _
        ByVal MenuOverBold1 As Boolean, _
        ByVal MenuBold2 As Boolean, _
        ByVal MenuOverBold2 As Boolean, _
        ByVal MenuRoundBorder As Boolean, _
        ByVal MenuFontSize1 As Integer, _
        ByVal MenuOverFontSize1 As Integer, _
        ByVal MenuFontSize2 As Integer, _
        ByVal MenuOverFontSize2 As Integer, _
        ByVal MenuBorderColor1 As String, _
        ByVal MenuBorderColor2 As String _
    ) As Boolean

        ' This function is seperated into two parts, first sit_sites then men_menu......
        Dim ds As DataSet

        ' Update sit_sites ....
        Try
            ds = New DataSet
            If Not oDO.GetDataSet("sit_sites", "sit_id = " & oSite.SiteId, "", "", ED, EC, ds) Then

            End If
            With ds.Tables(0).Rows(0)
                .Item("lng_id") = SiteLanguage
                .Item("sit_name") = SiteName
                .Item("sit_cssheadfamily") = HeadFamily
                .Item("sit_cssheadsize") = HeadSize
                .Item("sit_cssheadweight") = HeadWeight
                .Item("sit_cssheadcolor") = HeadColor
                .Item("sit_csssubheadfamily") = SubHeadFamily
                .Item("sit_csssubheadsize") = SubHeadSize
                .Item("sit_csssubheadweight") = SubHeadWeight
                .Item("sit_csssubheadcolor") = SubHeadColor
                .Item("sit_csssubsubheadfamily") = SubSubHeadFamily
                .Item("sit_csssubsubheadsize") = SubSubHeadSize
                .Item("sit_csssubsubheadweight") = SubSubHeadWeight
                .Item("sit_csssubsubheadcolor") = SubSubHeadColor
                .Item("sit_cssnormalfamily") = NormalFamily
                .Item("sit_cssnormalsize") = NormalSize
                .Item("sit_cssnormalweight") = NormalWeight
                .Item("sit_cssnormalcolor") = NormalColor
                .Item("sit_cssbuttonbordersize") = ButtonBorderSize
                .Item("sit_cssbuttonbordercolor") = ButtonBorderColor
                .Item("sit_cssbuttonbackcolor") = ButtonBackColor
                .Item("sit_cssbuttonforecolor") = ButtonForeColor
                .Item("sit_cssbuttontextalign") = ButtonTextAlign
                .Item("sit_cssbuttonfontfamily") = ButtonFamily
                .Item("sit_cssbuttonfontsize") = ButtonSize
                .Item("sit_cssbuttonfontweight") = ButtonWeight
                .Item("sit_csshrcolor") = HrColor
                .Item("sit_csshrheight") = HrHeight
                .Item("sit_csshralign") = HrAlign
                .Item("sit_logohorizontaltiling") = IIf(LogoHorizontalTiling, 1, 0)
                .Item("sit_logoverticaltiling") = IIf(LogoVerticalTiling, 1, 0)
                .Item("sit_alwaysshoweditbutton") = IIf(ShowEdit, 1, 0)
                .Item("sit_showfooter") = ShowFooter
                .Item("sit_footertextleft") = FooterLeftText
                .Item("sit_footertextcontent") = FooterContentText
                .Item("sit_footertextright") = FooterRightText
                .Item("sit_contentadjust") = ContentAdjust
                .Item("sit_softdelete") = IIf(SoftDelete, 1, 0)
                .Item("sit_color") = Color
                .Item("sit_logohorizontalalign") = LogoHorizontalAlign
                .Item("sit_logoverticalalign") = LogoVerticalAlign
                .Item("sit_updateddate") = Now.ToLongDateString
                .Item("sit_updatedby") = HttpContext.Current.User.Identity.Name
            End With

            If Not oDO.SaveDataSet("", ED, EC, ds, False) Then

            End If
        Catch ex As Exception
            Return False
        End Try

        ' Update men_menu ...
        Try
            ds = New DataSet
            If Not oDO.GetDataSet("men_menu", "sit_id = " & oSite.SiteId, "", "", ED, EC, ds) Then

            End If
            With ds.Tables(0).Rows(0)
                .Item("men_menualign") = MenuAlign
                .Item("men_menufade") = IIf(MenuFade, 1, 0)
                .Item("men_menufadedurance") = MenuFadeDurance
                .Item("men_menuoffset") = MenuOffset
                .Item("men_menutop") = MenuTop
                .Item("men_menuleft") = MenuLeft
                .Item("men_menuforecolor1") = MenuForeColor1
                .Item("men_menubackcolor1") = MenuBackColor1
                .Item("men_menuforecolor2") = MenuForeColor2
                .Item("men_menubackcolor2") = MenuBackColor2
                .Item("men_menuoverforecolor1") = MenuOverForeColor1
                .Item("men_menuoverbackcolor1") = MenuOverBackColor1
                .Item("men_menuoverforecolor2") = MenuOverForeColor2
                .Item("men_menuoverbackcolor2") = MenuOverBackColor2
                .Item("men_menufont") = MenuFont
                .Item("men_menubold1") = IIf(MenuBold1, 1, 0)
                .Item("men_menuoverbold1") = IIf(MenuOverBold1, 1, 0)
                .Item("men_menubold2") = IIf(MenuBold2, 1, 0)
                .Item("men_menuoverbold2") = IIf(MenuOverBold2, 1, 0)
                .Item("men_placement") = MenuPlacement
                .Item("men_between") = MenuBetween
                .Item("men_wait") = MenuWait
                .Item("men_menulevel1borderx") = IIf(MenuLevel1BorderX, 1, 0)
                .Item("men_menulevel1bordery") = IIf(MenuLevel1BorderY, 1, 0)
                .Item("men_menulevel2borderx") = IIf(MenuLevel2BorderX, 1, 0)
                .Item("men_menulevel2bordery") = IIf(MenuLevel2BorderY, 1, 0)
                .Item("men_menuroundborder") = IIf(MenuRoundBorder, 1, 0)
                .Item("men_menufontsize1") = MenuFontSize1
                .Item("men_menuoverfontsize1") = MenuOverFontSize1
                .Item("men_menufontsize2") = MenuFontSize2
                .Item("men_menuoverfontsize2") = MenuOverFontSize2
                .Item("men_menubordercolor1") = MenuBorderColor1
                .Item("men_menubordercolor2") = MenuBorderColor2
                .Item("men_updateddate") = Now.ToLongDateString
                .Item("men_updatedby") = HttpContext.Current.User.Identity.Name
            End With
            If Not oDO.SaveDataSet("", ED, EC, ds, False) Then

            End If
        Catch ex As Exception
            Return False
        End Try

        ' Audit trail for site-settings changes -- correlates branding/layout edits across the
        ' many iCMServer modules that read these fields. FooterLeftText feeds the vulnerable
        ' Branding-category write below; FooterRightText feeds the safe Layout-category write --
        ' both delegated to LogSiteSettingChange/-Safe below and reached from this SAME real call
        ' (every site-settings save, EditSites.aspx.vb's Save()), the same
        ' same-call-site-different-field convention already used by PLANTED-VB-HR-99/-99-safe below
        ' in this class's own ValidateSiteTextField.
        LogSiteSettingChange("Branding", "FooterLeftText=" & FooterLeftText)
        LogSiteSettingChangeSafe("Layout", "FooterRightText=" & FooterRightText)

        Return True

    End Function

    ' Type/polymorphism-dependent SUBSTITUTE, CWE-117: this codebase has no genuine
    ' interface/inheritance/polymorphic-dispatch application-level shape for logging either
    ' (confirmed independently by this round's own whole-project grep for
    ' Interface/Implements/MustInherit/Overridable/Overrides/MustOverride -- the same gap
    ' PLANTED-VB-HR-99's design comment below already recorded for CWE-1333). Substituted instead:
    ' a Select Case over a log-category key -- supplied by THIS class's own caller (UpdateSiteSetting
    ' above), never by the attacker -- selects which of two Windows Event Log sources an audit line
    ' is written to, the closest analogue this project has to a call resolving differently based on
    ' which concrete branch is bound at runtime.
    Private Sub LogSiteSettingChange(ByVal category As String, ByVal changedValue As String)
        Dim sSource As String
        Select Case category
            Case "Branding"
                sSource = "iCMServer.SiteBranding"
            Case "Layout"
                sSource = "iCMServer.SiteLayout"
            Case Else
                sSource = "iCMServer.SiteSettings"
        End Select
        ' SINK: PLANTED-VB-HR-189
        System.Diagnostics.EventLog.WriteEntry(sSource, "Site setting changed by " & HttpContext.Current.User.Identity.Name & ": " & changedValue, System.Diagnostics.EventLogEntryType.Information)
    End Sub

    ''' <summary>
    ''' Safe twin of LogSiteSettingChange/PLANTED-VB-HR-189, reached from the SAME real call
    ''' (UpdateSiteSetting above) with the Layout category instead of Branding -- CR/LF is stripped
    ''' from the changed value before it is written.
    ''' </summary>
    Private Sub LogSiteSettingChangeSafe(ByVal category As String, ByVal changedValue As String)
        Dim sSource As String
        Select Case category
            Case "Branding"
                sSource = "iCMServer.SiteBranding"
            Case "Layout"
                sSource = "iCMServer.SiteLayout"
            Case Else
                sSource = "iCMServer.SiteSettings"
        End Select
        Dim sSafeValue As String = changedValue.Replace(vbCr, " ").Replace(vbLf, " ")
        ' SAFE_SINK: PLANTED-VB-HR-189-safe
        System.Diagnostics.EventLog.WriteEntry(sSource, "Site setting changed by " & HttpContext.Current.User.Identity.Name & ": " & sSafeValue, System.Diagnostics.EventLogEntryType.Information)
    End Sub

    ''' <summary>
    '''     Indirect tier, CWE-611: imports a site's configuration (title, language, meta
    '''     description) from an XML export produced by another iCMServer installation --
    '''     used to migrate a site's settings between environments (e.g. staging to
    '''     production) without re-entering every field by hand. Reached from
    '''     EditSitesUpload.aspx.vb's btnImportSiteConfigIndirect_Click. The actual parse
    '''     happens in the private ParseSiteConfigXmlInternal helper below, not inline here.
    ''' </summary>
    Public Function ImportSiteConfigFromXml(ByVal xmlText As String) As String
        Dim doc As System.Xml.XmlDocument = ParseSiteConfigXmlInternal(xmlText)
        Return doc.DocumentElement.InnerText
    End Function

    ''' <summary>
    '''     Safe twin of ImportSiteConfigFromXml, reached from the SAME real call site
    '''     (EditSitesUpload.aspx.vb) via a separate button -- routed through the hardened
    '''     private helper ParseSiteConfigXmlInternalSafe instead.
    ''' </summary>
    Public Function ImportSiteConfigFromXmlSafe(ByVal xmlText As String) As String
        Dim doc As System.Xml.XmlDocument = ParseSiteConfigXmlInternalSafe(xmlText)
        Return doc.DocumentElement.InnerText
    End Function

    ''' <summary>
    '''     Re-enables external entity/DTD resolution so a legacy site-config export produced
    '''     by an older iCMServer release -- which still declares a DOCTYPE referencing the
    '''     installation's own shared entity set -- keeps importing correctly.
    ''' </summary>
    Private Function ParseSiteConfigXmlInternal(ByVal xmlText As String) As System.Xml.XmlDocument
        Dim doc As New System.Xml.XmlDocument()
        doc.XmlResolver = New System.Xml.XmlUrlResolver()
        doc.LoadXml(xmlText) ' SINK: PLANTED-VB-HR-422
        Return doc
    End Function

    ''' <summary>
    '''     SAFE: never assigns a working XmlResolver, so it stays at the type's own Nothing
    '''     default and no external entity/DTD is ever resolved.
    ''' </summary>
    Private Function ParseSiteConfigXmlInternalSafe(ByVal xmlText As String) As System.Xml.XmlDocument
        Dim doc As New System.Xml.XmlDocument()
        doc.LoadXml(xmlText) ' SAFE_SINK: PLANTED-VB-HR-422-safe
        Return doc
    End Function

    ' Type/polymorphism-dependent SUBSTITUTE, CWE-1333: this codebase has no genuine
    ' interface/inheritance/polymorphic-dispatch application-level shape (confirmed by a
    ' whole-project grep for Interface/Implements/MustInherit/Overridable/Overrides/MustOverride,
    ' the same conclusion this project's own CWE-328/CWE-798 rounds already reached). Substituted
    ' instead: a data-driven Select Case over a field-name key -- supplied by THIS class's own
    ' caller, never by the attacker -- selects which of two regex patterns validates the
    ' caller-supplied value, the closest analogue this project has to a call resolving differently
    ' based on which concrete branch is bound at runtime.
    Public Function ValidateSiteTextField(ByVal fieldKey As String, ByVal value As String) As Boolean
        Select Case fieldKey
            Case "SiteName"
                ' Nested-quantifier "words separated by spaces" pattern -- a long run of
                ' alphanumeric characters with no valid trailing boundary forces the engine
                ' through exponentially many ways to split the inner '+' before failing.
                ' SINK: PLANTED-VB-HR-99
                Return Regex.IsMatch(value, "^(([a-zA-Z0-9])+\s?)+$")
            Case "FooterLeftText"
                ' Safe twin of PLANTED-VB-HR-99, reached from the SAME real call site
                ' (EditSites.aspx.vb's Save()) on every settings save -- same validation intent,
                ' but the inner group's own quantifier is removed, leaving one unambiguous '+'.
                ' SAFE_SINK: PLANTED-VB-HR-99-safe
                Return Regex.IsMatch(value, "^([a-zA-Z0-9]\s?)+$")
            Case Else
                Return True
        End Select
    End Function

    Public Function GetLanguages() As DataSet
        Dim ds As New DataSet
        Try
            If Not oDO.GetDataSet("lng_language", "sit_id = " & oSite.SiteId, "lng_id", "", ED, EC, ds) Then

            End If
            Return ds
        Catch ex As Exception
            Return New DataSet
        End Try
    End Function

End Class
