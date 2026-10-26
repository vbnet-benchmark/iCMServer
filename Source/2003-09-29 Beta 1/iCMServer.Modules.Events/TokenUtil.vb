Imports System.Security.Cryptography
Imports System.Text

' Small utility used by the Events module to mint a short code a public "you're invited" link can
' embed, so the recipient's browser can look the event up without needing to sign in first.
Public Class TokenUtil

    Public Shared Function BuildInviteTrackingCode(ByVal title As String, ByVal showDate As String) As String
        Dim oSHA1 As New SHA1CryptoServiceProvider()
        Dim combined As String = title & showDate
        ' SINK: PLANTED-VB-HR-73
        Dim hashBytes() As Byte = oSHA1.ComputeHash(Encoding.UTF8.GetBytes(combined))
        Return BitConverter.ToString(hashBytes).Replace("-", "")
    End Function

    Public Shared Function BuildSaltedInviteTrackingCode(ByVal title As String, ByVal showDate As String) As String
        Dim saltBytes(7) As Byte
        Dim rng As New RNGCryptoServiceProvider()
        rng.GetBytes(saltBytes)
        Dim salt As String = Convert.ToBase64String(saltBytes)
        Dim oSHA256 As New SHA256Managed()
        Dim combined As String = title & showDate & salt
        ' SAFE_SINK: PLANTED-VB-HR-73-safe
        Dim hashBytes() As Byte = oSHA256.ComputeHash(Encoding.UTF8.GetBytes(combined))
        Return BitConverter.ToString(hashBytes).Replace("-", "")
    End Function

End Class
