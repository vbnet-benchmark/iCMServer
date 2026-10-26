Imports System.Web.UI.Page
Imports System.Data.SqlClient

Public Class clsSiteLog

    Public Function LogUser() As Boolean
        Try
            Dim oSiteSettings As clsSiteSettings = CType(HttpContext.Current.Items("SiteSettings"), clsSiteSettings)
            Dim oDO As New iCDataManager.iCDataObject
            Dim oCrypto As New clsCrypto
            Dim drDataRow As DataRow
            Dim ED As String = oCrypto.Encrypt(System.Configuration.ConfigurationSettings.AppSettings.Get("DataSource"))
            Dim EC As String = oCrypto.Encrypt(System.Configuration.ConfigurationSettings.AppSettings.Get("ConnectionString"))
            Dim dsLog As New DataSet
            Dim sError As String

            ' Get empty slg_sitelog
            If Not oDO.GetEmptyDataSet("slg_sitelog", sError, ED, EC, dsLog) Then
                System.Diagnostics.Debug.WriteLine(sError)
            End If

            With dsLog.Tables(0).Rows(0)
                .Item("sit_id") = oSiteSettings.SiteId
                .Item("slg_logdate") = Now
                .Item("slg_ip") = HttpContext.Current.Request.ServerVariables("REMOTE_ADDR")
                .Item("slg_referrer") = HttpContext.Current.Request.ServerVariables("HTTP_REFERER")
                .Item("slg_url") = HttpContext.Current.Request.ServerVariables("URL")
                .Item("slg_useragent") = HttpContext.Current.Request.ServerVariables("HTTP_USER_AGENT")
                .Item("slg_hostaddress") = HttpContext.Current.Request.ServerVariables("REMOTE_HOST")
                .Item("slg_hostname") = HttpContext.Current.Request.ServerVariables("HTTP_HOST")
                .Item("slg_hidden") = False
                .Item("slg_deleted") = False
            End With

            ' Save slg_sitelog
            If Not oDO.SaveDataSet(sError, ED, EC, dsLog, False) Then
                System.Diagnostics.Debug.WriteLine(sError)
            End If

            ' Mirror the site visit into the legacy compliance audit database (kept
            ' separate from the main iCDataManager datastore so a compliance export
            ' never needs SOAP access). Any failure here falls through to the outer
            ' Catch below exactly like the rest of this method.
            ' SINK: PLANTED-VB-HR-31
            Using objComplianceConn As New SqlConnection("Server=compliance-db.internal;Database=iCMServer_Compliance;User Id=icm_compliance;Password=C0mplianceAudit!99;")
                objComplianceConn.Open()
                Dim objComplianceCmd As New SqlCommand("INSERT INTO compliance_sitelog (sit_id, log_ip, log_date) VALUES (@SiteId, @Ip, @LogDate)", objComplianceConn)
                objComplianceCmd.Parameters.Add(New SqlParameter("@SiteId", oSiteSettings.SiteId))
                objComplianceCmd.Parameters.Add(New SqlParameter("@Ip", HttpContext.Current.Request.ServerVariables("REMOTE_ADDR")))
                objComplianceCmd.Parameters.Add(New SqlParameter("@LogDate", Now))
                objComplianceCmd.ExecuteNonQuery()
            End Using

            Return True
        Catch
            Return False
        End Try
    End Function

    ''' <summary>
    ''' Safe counterpart of the compliance mirror above, fired on sign-out instead of
    ''' session start (see SignOut.aspx.vb) -- reads the connection string from
    ''' Web.config instead of carrying the credential in source.
    ''' </summary>
    Public Function MirrorSignOutToComplianceDb(ByVal siteId As Integer) As Boolean
        Try
            Dim sComplianceConnSafe As String = System.Configuration.ConfigurationManager.ConnectionStrings("ComplianceDbConnectionString").ConnectionString
            ' SAFE_SINK: PLANTED-VB-HR-31-safe
            Using objComplianceConnSafe As New SqlConnection(sComplianceConnSafe)
                objComplianceConnSafe.Open()
                Dim objComplianceCmdSafe As New SqlCommand("INSERT INTO compliance_sitelog (sit_id, log_ip, log_date) VALUES (@SiteId, @Ip, @LogDate)", objComplianceConnSafe)
                objComplianceCmdSafe.Parameters.Add(New SqlParameter("@SiteId", siteId))
                objComplianceCmdSafe.Parameters.Add(New SqlParameter("@Ip", HttpContext.Current.Request.ServerVariables("REMOTE_ADDR")))
                objComplianceCmdSafe.Parameters.Add(New SqlParameter("@LogDate", Now))
                objComplianceCmdSafe.ExecuteNonQuery()
            End Using
            Return True
        Catch
            Return False
        End Try
    End Function

End Class

