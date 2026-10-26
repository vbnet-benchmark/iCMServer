Imports System.Text.RegularExpressions

' Interprocedural tier, CWE-1333: a standalone validator class, in its own file, called from
' clsiFrame.vb's UpdateiFrame -- itself called from iFrameEdit.aspx.vb's btnUpdate_Click. Crosses
' 3 call frames across 2 files, mirroring the CWE-328 round's own TokenUtil.vb precedent for this
' project (a cross-file helper class consumed by a repository-layer method).
Public Class FrameSourceValidator

    ' Nested-quantifier domain-label clause, same root shape as PLANTED-VB-HR-97's URL check --
    ' a crafted, scheme-and-dot-free frame-source value forces the engine through exponentially
    ' many ways to split the inner '+' across the outer '+' before the overall match can fail.
    Public Shared Function IsSafeFrameSource(ByVal src As String) As Boolean
        Dim sPattern As String = "^(https?:\/\/)?(www\.)?(([a-zA-Z0-9][a-zA-Z0-9\-]*)+\.)+[a-zA-Z]{2,6}(:[0-9]+)?(\/.*)?$"
        ' SINK: PLANTED-VB-HR-98
        Return Regex.IsMatch(src, sPattern)
    End Function

    ' Safe twin of PLANTED-VB-HR-98: identical pattern, but bounded with an explicit timeout --
    ' Microsoft's own documented mitigation when the ambiguous pattern itself is kept. A timeout
    ' fires closed (treated as "did not match"), never open.
    Public Shared Function IsSafeFrameSourceHardened(ByVal src As String) As Boolean
        Dim sPattern As String = "^(https?:\/\/)?(www\.)?(([a-zA-Z0-9][a-zA-Z0-9\-]*)+\.)+[a-zA-Z]{2,6}(:[0-9]+)?(\/.*)?$"
        Try
            ' SAFE_SINK: PLANTED-VB-HR-98-safe
            Return Regex.IsMatch(src, sPattern, RegexOptions.None, TimeSpan.FromMilliseconds(250))
        Catch ex As RegexMatchTimeoutException
            Return False
        End Try
    End Function

End Class
