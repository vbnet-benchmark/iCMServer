''' <summary>
''' Role Policy Document attachment, type/polymorphism-dependent tier of CWE-434. This
''' Interface/concrete-handler hierarchy is genuinely NEW, introduced by this plant itself -- a
''' project-wide grep for "MustInherit|MustOverride|Overrides |Interface |Implements " found no
''' pre-existing hierarchy anywhere tied to an upload-handling decision (the only genuine
''' MustInherit/MustOverride hierarchy in this project, DesktopLayoutFormatStrategy, drives
''' CWE-502 theme-cookie deserialization -- unrelated to file upload -- and every per-module
''' clsSiteModuleControl-derived MustInherit base class declares no MustOverride member at all).
''' Which concrete handler runs is chosen by a "PolicyFormat" plain HTML form
''' field posted alongside the file -- exactly as client-controlled as the format tag
''' DesktopLayoutFormatStrategy itself resolves on from a cookie -- so this is genuine
''' virtual-dispatch resolution a static analyzer cannot distinguish from a decade-old hierarchy,
''' not a substituted Select Case standing in for one.
''' </summary>
Public Interface IRolePolicyDocumentHandler
    Sub SaveDocument(ByVal fileName As String, ByVal content As Byte())
End Interface

''' <summary>
''' Pre-allow-list policy document handling, still selected (by default, when PolicyFormat is
''' absent or unrecognized) for roles whose policy workflow predates the hardened format. No
''' extension check at all before the file is written.
''' </summary>
Public Class LegacyRolePolicyDocumentHandler
    Implements IRolePolicyDocumentHandler

    Public Sub SaveDocument(ByVal fileName As String, ByVal content As Byte()) Implements IRolePolicyDocumentHandler.SaveDocument
        Dim destPath As String = System.Web.HttpContext.Current.Server.MapPath("~/RolePolicyDocuments/" & fileName)
        ' SINK: PLANTED-VB-HR-394
        System.IO.File.WriteAllBytes(destPath, content)
    End Sub
End Class

''' <summary>
''' Current policy document handling -- validates the document's own extension against a strict
''' allow-list before it is ever written, the same verify-before-write order the Legacy handler
''' above skips entirely.
''' </summary>
Public Class ValidatedRolePolicyDocumentHandler
    Implements IRolePolicyDocumentHandler

    Public Sub SaveDocument(ByVal fileName As String, ByVal content As Byte()) Implements IRolePolicyDocumentHandler.SaveDocument
        Dim allowedPolicyExtensions() As String = {".pdf", ".doc", ".docx"}
        Dim sExt As String = System.IO.Path.GetExtension(fileName).ToLower()
        If Array.IndexOf(allowedPolicyExtensions, sExt) >= 0 Then
            Dim destPath As String = System.Web.HttpContext.Current.Server.MapPath("~/RolePolicyDocuments/" & fileName)
            ' SAFE_SINK: PLANTED-VB-HR-394-safe
            System.IO.File.WriteAllBytes(destPath, content)
        End If
    End Sub
End Class

''' <summary>
''' Picks the concrete handler from the posted "PolicyFormat" form field (RolesEdit.aspx.vb's
''' btnAttachPolicy_Click reads it before calling this).
''' </summary>
Public Class RolePolicyDocumentHandlerFactory
    Public Shared Function ResolveFor(ByVal formatTag As String) As IRolePolicyDocumentHandler
        Select Case formatTag
            Case "Validated"
                Return New ValidatedRolePolicyDocumentHandler()
            Case Else
                Return New LegacyRolePolicyDocumentHandler()
        End Select
    End Function
End Class
