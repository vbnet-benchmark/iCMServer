Imports System.IO
Imports System.Text
Imports System.Security.Cryptography
Imports System.Runtime.Serialization
Imports System.Runtime.Serialization.Formatters.Binary

''' <summary>
''' BLL helper backing the "Desktop Layout Preferences" feature (iCM.aspx, Page_Init) -- lets a
''' visitor's widget-visibility snapshot and named layout-snapshot slots persist across visits
''' instead of resetting on every request, the same way ASP.NET's own ViewState machinery persists
''' page state across postbacks. Two cookie generations exist side by side for each facet, for
''' backward compatibility: a legacy, unrestricted format still read for visitors who saved a
''' preference before the newer format shipped, and the newer format used by btnSaveLayout_Click (in
''' iCM.aspx.vb) going forward. See DesktopLayoutFormatStrategy.vb for the theme-preference facet's
''' own (polymorphic) dispatch between its own legacy/signed pair.
''' </summary>
Public Class DesktopLayoutPreferenceService

    ''' <summary>
    ''' Server-only HMAC key for every SIGNED cookie format in this feature (here and in
    ''' DesktopLayoutFormatStrategy.vb's SignedDesktopLayoutFormatStrategy). Mirrors clsSiteSecurity's
    ''' own FormsAuthentication-ticket pattern already used for the "siteroles" cookie in
    ''' Global.asax.vb, but scoped to this one feature rather than to site-wide authentication.
    ''' </summary>
    Private Shared ReadOnly LayoutMacKey As Byte() = Encoding.UTF8.GetBytes("iCMServer-DesktopLayout-Mac-Key-2026")

    ''' <summary>
    ''' Computes the HMAC-SHA1 MAC for a serialized payload string. HMACSHA1 (not HMACSHA256, which
    ''' was not yet part of the .NET Framework this project targets) is the same primitive this
    ''' project's own clsCrypto.vb already reaches for its symmetric encryption key schedule.
    ''' </summary>
    Public Shared Function ComputeMac(ByVal payload As String) As String
        Dim oHmac As New HMACSHA1(LayoutMacKey)
        Dim macBytes As Byte() = oHmac.ComputeHash(Encoding.UTF8.GetBytes(payload))
        Return Convert.ToBase64String(macBytes)
    End Function

    ''' <summary>
    ''' Verifies a payload string against a previously-computed Base64 MAC, BEFORE the payload is
    ''' ever hidden to a formatter -- the same verify-before-deserialize order EnableViewStateMac
    ''' applies to real ASP.NET ViewState.
    ''' </summary>
    Public Shared Function VerifyMac(ByVal payload As String, ByVal providedMacBase64 As String) As Boolean
        Dim expectedMac As String = ComputeMac(payload)
        Return expectedMac = providedMacBase64
    End Function

    ''' <summary>
    ''' Desktop Layout Preferences, facet 3 (per-module widget visibility/order snapshot) --
    ''' interprocedural tier: called by iCM.aspx.vb's Page_Init for the
    ''' "icmdesktoplayout_widgets_legacy" cookie. Vulnerable: no integrity check at all before
    ''' BinaryFormatter reconstructs whatever type the cookie names, the idiom
    ''' (Convert.FromBase64String + MemoryStream + BinaryFormatter.Deserialize) this whole planting
    ''' round's research models throughout.
    ''' </summary>
    Public Shared Function RestoreWidgetVisibility(ByVal rawCookieValue As String) As Object
        Dim bytes As Byte() = Convert.FromBase64String(rawCookieValue)
        Using ms As New MemoryStream(bytes)
            ' SINK: PLANTED-VB-HR-353
            Return New BinaryFormatter().Deserialize(ms)
        End Using
    End Function

    ''' <summary>
    ''' Safe twin of RestoreWidgetVisibility, called for the newer "icmdesktoplayout_widgets_signed"
    ''' cookie ("base64payload|base64mac"). Verifies the MAC before the payload ever reaches
    ''' BinaryFormatter.
    ''' </summary>
    Public Shared Function RestoreWidgetVisibilitySigned(ByVal rawCookieValue As String) As Object
        Dim parts() As String = rawCookieValue.Split("|"c)
        If parts.Length <> 2 Then
            Return Nothing
        End If
        If Not VerifyMac(parts(0), parts(1)) Then
            Return Nothing
        End If
        Dim bytes As Byte() = Convert.FromBase64String(parts(0))
        Using ms As New MemoryStream(bytes)
            ' SAFE_SINK: PLANTED-VB-HR-353-safe
            Return New BinaryFormatter().Deserialize(ms)
        End Using
    End Function

    ''' <summary>
    ''' Desktop Layout Preferences, facet 5 (named layout snapshot slots, e.g. "Work"/"Review") --
    ''' diversity tier (loop/batch), a genuinely different construction shape from facets 1-4: a
    ''' visitor can save several independently-encoded snapshots in one ";"-delimited cookie. Called
    ''' by iCM.aspx.vb for the "icmdesktoplayout_snapshots_legacy" cookie. Vulnerable: every chunk is
    ''' deserialized unconditionally, with no integrity check.
    ''' </summary>
    Public Shared Function RestoreAllLayoutSnapshots(ByVal rawCookieValue As String) As ArrayList
        Dim results As New ArrayList()
        Dim chunk As String
        For Each chunk In rawCookieValue.Split(";"c)
            If chunk.Trim().Length = 0 Then
                Continue For
            End If
            Dim bytes As Byte() = Convert.FromBase64String(chunk)
            Using ms As New MemoryStream(bytes)
                ' SINK: PLANTED-VB-HR-355
                results.Add(New BinaryFormatter().Deserialize(ms))
            End Using
        Next chunk
        Return results
    End Function

    ''' <summary>
    ''' Safe twin of RestoreAllLayoutSnapshots, called for the newer "icmdesktoplayout_snapshots_restricted"
    ''' cookie. Installs DesktopWidgetSnapshotBinder (the same closed type-resolution allow-list facet
    ''' 2's safe twin uses in iCM.aspx.vb) on each chunk's formatter instance before deserializing it --
    ''' a different sanitizer mechanism than the MAC verification used by facets 1/3/4, since this
    ''' feature's restorable shape is a small, fixed set of DTOs (DesktopWidgetSnapshot plus plain
    ''' ArrayList/Hashtable containers) a Binder can enumerate exhaustively.
    ''' </summary>
    Public Shared Function RestoreAllLayoutSnapshotsRestricted(ByVal rawCookieValue As String) As ArrayList
        Dim results As New ArrayList()
        Dim chunk As String
        For Each chunk In rawCookieValue.Split(";"c)
            If chunk.Trim().Length = 0 Then
                Continue For
            End If
            Dim bytes As Byte() = Convert.FromBase64String(chunk)
            Using ms As New MemoryStream(bytes)
                Dim oFormatter As New BinaryFormatter()
                oFormatter.Binder = New DesktopWidgetSnapshotBinder()
                ' SAFE_SINK: PLANTED-VB-HR-355-safe
                results.Add(oFormatter.Deserialize(ms))
            End Using
        Next chunk
        Return results
    End Function

End Class

''' <summary>
''' Plain, fixed-shape DTO restored by the Desktop Layout Preferences feature -- the one custom type
''' (plus the plain BCL container/primitive types this feature actually round-trips)
''' DesktopWidgetSnapshotBinder allows through BinaryFormatter.
''' </summary>
<Serializable()>
Public Class DesktopWidgetSnapshot
    Public ModuleId As Integer
    Public Minimized As Boolean
    Public SortOrder As Integer
End Class

''' <summary>
''' Closed type-resolution allow-list for BinaryFormatter.Binder (CWE-502 sanitizer pattern:
''' "restrict a formatter's own type-resolution surface"). Only DesktopWidgetSnapshot and the plain
''' BCL container/primitive types this feature actually round-trips may be instantiated; anything
''' else throws before any object is constructed, so a gadget-chain type named in a tampered cookie
''' never gets as far as being built. Used by both iCM.aspx.vb's RestoreModuleOrderPreference (facet
''' 2's safe twin) and RestoreAllLayoutSnapshotsRestricted above (facet 5's safe twin).
''' </summary>
Public Class DesktopWidgetSnapshotBinder
    Inherits SerializationBinder

    Public Overrides Function BindToType(ByVal assemblyName As String, ByVal typeName As String) As Type
        Select Case typeName
            Case "iConsulting.iCMServer.DesktopWidgetSnapshot"
                Return GetType(DesktopWidgetSnapshot)
            Case "System.Collections.ArrayList"
                Return GetType(ArrayList)
            Case "System.Collections.Hashtable"
                Return GetType(Hashtable)
            Case "System.Int32", "System.Boolean", "System.String"
                Return Type.GetType(typeName)
            Case Else
                Throw New SerializationException("Blocked attempt to deserialize disallowed type: " & typeName)
        End Select
    End Function

End Class
