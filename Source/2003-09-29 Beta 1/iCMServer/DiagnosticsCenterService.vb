Imports System.Data.Odbc
Imports System.Data.SqlClient
Imports System.Configuration

''' <summary>
''' Operational self-test BLL helper for DiagnosticsCenter.aspx. Each Test*Connectivity method
''' ALWAYS returns the real exception detail (when the probe fails) as a plain field on the
''' returned DiagnosticsResult -- it never decides on its own whether that detail is safe to show
''' a browser. That decision belongs entirely to the caller (DiagnosticsCenter.aspx.vb), which is
''' why ErrorMessage is unconditional here: gating the detail inside this class would put both the
''' decision AND the marker in the wrong layer -- the HotelCore-round marker-placement incident
''' this round was explicitly told to avoid.
''' </summary>
Public Class DiagnosticsCenterService

    ''' <summary>
    ''' Checked by DiagnosticsCenter.aspx.vb's btnTestLegacyModule_Click (vulnerable display path,
    ''' PLANTED-VB-HR-293).
    ''' </summary>
    Public Shared Function TestLegacyModuleConnectivity() As DiagnosticsResult
        Dim oResult As New DiagnosticsResult()
        Try
            Using objConn As New OdbcConnection("Driver={SQL Server};Server=legacy-icm-db.internal;Database=icmserver_legacy;Trusted_Connection=Yes;")
                objConn.Open()
            End Using
            oResult.Success = True
        Catch ex As Exception
            oResult.Success = False
            oResult.ErrorMessage = ex.Message
        End Try
        Return oResult
    End Function

    ''' <summary>
    ''' Checked by DiagnosticsCenter.aspx.vb's btnTestReportingModule_Click (safe display path,
    ''' PLANTED-VB-HR-293-safe) -- same BLL-carrier shape as TestLegacyModuleConnectivity above,
    ''' still returning the raw ErrorMessage unconditionally; the caller is what makes this one
    ''' safe.
    ''' </summary>
    Public Shared Function TestReportingModuleConnectivity() As DiagnosticsResult
        Dim oResult As New DiagnosticsResult()
        Try
            Using objConn As New SqlConnection(ConfigurationManager.ConnectionStrings("ReportingDbConnectionString").ConnectionString)
                objConn.Open()
            End Using
            oResult.Success = True
        Catch ex As Exception
            oResult.Success = False
            oResult.ErrorMessage = ex.Message
        End Try
        Return oResult
    End Function

End Class

''' <summary>
''' Plain result carrier for DiagnosticsCenterService -- ErrorMessage is always the real,
''' unfiltered exception text; whether to show it to the requesting browser is the caller's
''' decision alone, never this class's.
''' </summary>
Public Class DiagnosticsResult
    Public Success As Boolean
    Public ErrorMessage As String
End Class
