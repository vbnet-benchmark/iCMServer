Imports System.IO

''' <summary>
''' Desktop Layout Preferences, facet 4 (theme preference) -- type/polymorphism-dependent tier of the
''' feature rooted in iCM.aspx.vb's Page_Init. This MustInherit/MustOverride hierarchy is genuinely
''' NEW, introduced by this plant itself (no polymorphic hierarchy existed near this feature, or
''' anywhere in this project's own cookie/layout code, before it) -- which concrete strategy runs is
''' chosen by a short format tag embedded in the "icmdesktoptheme" cookie's own value ("legacy:" /
''' "signed:"), which is exactly as client-controlled as the cookie's payload itself, so this is
''' genuine virtual-dispatch resolution a static analyzer cannot distinguish from a decade-old
''' hierarchy -- not a substituted Select Case standing in for one.
''' </summary>
Public MustInherit Class DesktopLayoutFormatStrategy

    Public MustOverride Function RestoreThemePreference(ByVal rawValue As String) As Object

    ''' <summary>
    ''' Picks the concrete strategy from the cookie's own leading format tag (iCM.aspx.vb's Page_Init
    ''' has already split the tag off before calling this).
    ''' </summary>
    Public Shared Function ResolveFor(ByVal formatTag As String) As DesktopLayoutFormatStrategy
        Select Case formatTag
            Case "signed"
                Return New SignedDesktopLayoutFormatStrategy()
            Case Else
                Return New LegacyDesktopLayoutFormatStrategy()
        End Select
    End Function

End Class

''' <summary>
''' Pre-signed-format theme restore, still read for visitors who saved a theme preference before the
''' signed cookie format shipped. No integrity check at all before the payload reaches LosFormatter.
''' </summary>
Public Class LegacyDesktopLayoutFormatStrategy
    Inherits DesktopLayoutFormatStrategy

    Public Overrides Function RestoreThemePreference(ByVal rawValue As String) As Object
        Dim bytes As Byte() = Convert.FromBase64String(rawValue)
        Using ms As New MemoryStream(bytes)
            ' SINK: PLANTED-VB-HR-354
            Return New LosFormatter().Deserialize(ms)
        End Using
    End Function

End Class

''' <summary>
''' Current theme-restore format -- verifies the HMAC DesktopLayoutPreferenceService computed at save
''' time before ever handing the payload to LosFormatter, the same verify-before-deserialize order
''' EnableViewStateMac applies to real ASP.NET ViewState.
''' </summary>
Public Class SignedDesktopLayoutFormatStrategy
    Inherits DesktopLayoutFormatStrategy

    Public Overrides Function RestoreThemePreference(ByVal rawValue As String) As Object
        Dim parts() As String = rawValue.Split("|"c)
        If parts.Length <> 2 Then
            Return Nothing
        End If
        Dim payload As String = parts(0)
        Dim providedMac As String = parts(1)
        If Not DesktopLayoutPreferenceService.VerifyMac(payload, providedMac) Then
            Return Nothing
        End If
        Dim bytes As Byte() = Convert.FromBase64String(payload)
        Using ms As New MemoryStream(bytes)
            ' SAFE_SINK: PLANTED-VB-HR-354-safe
            Return New LosFormatter().Deserialize(ms)
        End Using
    End Function

End Class
