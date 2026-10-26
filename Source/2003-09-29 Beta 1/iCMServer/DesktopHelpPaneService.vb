Imports System.IO
Imports System.Collections
Imports System.Web

''' <summary>
''' Renders a help page into the desktop's help pane. The help page is executed in-process and its
''' output captured, so the help text picks up the current site's settings and language exactly as
''' the page around it does.
''' </summary>
Public Class DesktopHelpPaneService

    ''' <summary>
    ''' Renders the help page at the given application path (the form older help links use).
    ''' </summary>
    Public Shared Function RenderTopicPage(ByVal topicPagePath As String) As String
        Dim writer As New StringWriter
        ' SINK: PLANTED-VB-HR-498
        HttpContext.Current.Server.Execute(topicPagePath, writer)
        Return writer.ToString()
    End Function

    ''' <summary>
    ''' Renders the help page registered for the given topic key; unknown keys render nothing.
    ''' </summary>
    Public Shared Function RenderRegisteredTopic(ByVal topicKey As String) As String
        Dim topics As Hashtable = HelpTopics()
        Dim key As String = LCase(Trim(topicKey))
        If Not topics.ContainsKey(key) Then
            Return ""
        End If
        Dim writer As New StringWriter
        ' SAFE_SINK: PLANTED-VB-HR-498-safe
        HttpContext.Current.Server.Execute(CStr(topics(key)), writer)
        Return writer.ToString()
    End Function

    Private Shared Function HelpTopics() As Hashtable
        Dim topics As New Hashtable
        topics("pages") = "~/Help/Pages.aspx"
        topics("modules") = "~/Help/Modules.aspx"
        topics("users") = "~/Help/Users.aspx"
        topics("roles") = "~/Help/Roles.aspx"
        topics("sites") = "~/Help/Sites.aspx"
        Return topics
    End Function

End Class
