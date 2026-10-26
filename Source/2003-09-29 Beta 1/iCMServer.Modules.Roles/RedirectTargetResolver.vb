''' <summary>
''' Resolves the "Next" continue-destination requested by the role editor's save form
''' into the actual URL to redirect to. Kept as a standalone class (rather than inline
''' in clsRoles) so the vulnerable and safe resolution strategies are easy to compare
''' side by side.
''' </summary>
Public Class RedirectTargetResolver

    ''' <summary>
    ''' Vulnerable: the caller-requested destination is trusted outright, with no check
    ''' that it is actually an internal page.
    ''' </summary>
    Public Shared Function Resolve(ByVal requestedTarget As String) As String
        Return requestedTarget
    End Function

    ''' <summary>
    ''' Safe: only a fixed allow-list of known internal module destinations is ever
    ''' returned -- an unrecognized (and therefore possibly external) value falls back
    ''' to the portal home page instead of being honored.
    ''' </summary>
    Public Shared Function ResolveSafe(ByVal requestedTarget As String) As String
        Dim allowedTargets As String() = {"~/icm.aspx", "~/Server/Modules/Roles/RolesUsers.aspx"}
        Dim i As Integer
        For i = 0 To allowedTargets.Length - 1
            If String.Equals(requestedTarget, allowedTargets(i), StringComparison.OrdinalIgnoreCase) Then
                Return requestedTarget
            End If
        Next
        Return "~/icm.aspx"
    End Function

End Class
