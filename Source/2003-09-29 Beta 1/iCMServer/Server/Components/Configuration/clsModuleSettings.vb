
Imports System.Data.SqlClient

Public Class clsModuleSettings

    Public ModuleId As Integer
    Public ModuleDefId As Integer
    Public PageId As Integer
    Public CacheTime As Integer
    Public ModuleOrder As Integer
    Public ModuleFieldName As String
    Public ModuleTitle As String
    Public AuthorizedEditRoles As String
    Public ShowMobile As Boolean
    Public DesktopSrc As String
    Public MobileSrc As String
    Public Language As Integer
    Public Alignment As String
    Public Color As String
    Public Border As String
    Public EditSrc As String
    Public IconFile As String
    Public EditModuleIcon As String
    Public Secure As Boolean
    Public AllPages As Boolean
    Public ShowTitle As Boolean
    Public Personalize As Integer
    Public FriendlyName As String
    Public SkinPath As String
    Public Hidden As Boolean

    'Public Shared Function GetModuleSettings(ByVal moduleId As Integer) As Hashtable

    '    ' Get Settings for this module from the database
    '    Dim _settings As New Hashtable()

    '    ' Create Instance of Connection and Command Object
    '    Dim myConnection As New SqlConnection(ConfigurationSettings.AppSettings("connectionString"))
    '    Dim myCommand As New SqlCommand("GetModuleSettings", myConnection)

    '    ' Mark the Command as a SPROC
    '    myCommand.CommandType = CommandType.StoredProcedure

    '    ' Add Parameters to SPROC
    '    Dim parameterModuleId As New SqlParameter("@ModuleID", SqlDbType.Int, 4)
    '    parameterModuleId.Value = moduleId
    '    myCommand.Parameters.Add(parameterModuleId)

    '    ' Execute the command
    '    myConnection.Open()
    '    Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)

    '    While dr.Read()

    '        _settings(dr.GetString(0)) = dr.GetString(1)
    '    End While

    '    dr.Close()

    '    Return _settings

    'End Function

End Class

