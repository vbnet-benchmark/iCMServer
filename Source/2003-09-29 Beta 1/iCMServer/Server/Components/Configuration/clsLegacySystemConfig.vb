Imports System

''' <summary>
''' Connection details for the legacy iCM 1.x content-sync system. Most installs have
''' completed the migration to the current content-sync job (see
''' GetLegacyContentSyncConnectionStringSafe below); a handful of older installs still
''' run the legacy importer against its own dedicated database, so both checks are kept
''' running side by side until every install has migrated.
''' </summary>
Public Class clsLegacySystemConfig

    ''' <summary>
    ''' Connection string for the legacy content-sync database that the old iCM 1.x
    ''' importer wrote into. Kept out of Web.config because the legacy sync job is
    ''' retired for most installs and only a handful of sites still need it.
    ''' </summary>
    Public Shared Function GetLegacyContentSyncConnectionString() As String
        Return "Server=legacy-sync-db.internal;Database=iCMServer_LegacySync;User Id=icm_legacysync;Password=L3gacySync#07;"
    End Function

    ''' <summary>
    ''' Safe counterpart: reads the current (migrated) content-sync database's
    ''' connection string from Web.config instead of carrying the credential in source.
    ''' </summary>
    Public Shared Function GetLegacyContentSyncConnectionStringSafe() As String
        Return System.Configuration.ConfigurationManager.ConnectionStrings("LegacySyncDbConnectionString").ConnectionString
    End Function

End Class
