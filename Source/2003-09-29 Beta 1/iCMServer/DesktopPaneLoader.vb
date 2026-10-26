Imports System.Collections
Imports System.Web.UI

''' <summary>
''' Loads an extra desktop pane (a small user control shown beside the page's modules). How the pane
''' is referenced decides which loader handles it: older side-pane links carry the pane control's
''' path, newer ones carry the name the pane is registered under.
''' </summary>
Public MustInherit Class DesktopPaneLoader

    Public MustOverride Function LoadPane(ByVal hostPage As Page, ByVal paneReference As String) As Control

    Public Shared Function ForReferenceKind(ByVal referenceKind As String) As DesktopPaneLoader
        Select Case LCase(referenceKind)
            Case "path"
                Return New VirtualPathPaneLoader
            Case Else
                Return New RegisteredPaneLoader
        End Select
    End Function

End Class

''' <summary>
''' Pane referenced by the path of its user control.
''' </summary>
Public Class VirtualPathPaneLoader
    Inherits DesktopPaneLoader

    Public Overrides Function LoadPane(ByVal hostPage As Page, ByVal paneReference As String) As Control
        ' SINK: PLANTED-VB-HR-499
        Return hostPage.LoadControl(paneReference)
    End Function

End Class

''' <summary>
''' Pane referenced by its registered name; names that are not registered load nothing.
''' </summary>
Public Class RegisteredPaneLoader
    Inherits DesktopPaneLoader

    Public Overrides Function LoadPane(ByVal hostPage As Page, ByVal paneReference As String) As Control
        Dim panes As Hashtable = DesktopPaneRegistry.RegisteredPanes()
        Dim paneKey As String = LCase(Trim(paneReference))
        If Not panes.ContainsKey(paneKey) Then
            Return Nothing
        End If
        ' SAFE_SINK: PLANTED-VB-HR-499-safe
        Return hostPage.LoadControl(CStr(panes(paneKey)))
    End Function

End Class

''' <summary>
''' The desktop panes installed with this site, by name.
''' </summary>
Public Class DesktopPaneRegistry

    Public Shared Function RegisteredPanes() As Hashtable
        Dim panes As New Hashtable
        panes("calendar") = "~/Desktop/Panes/CalendarPane.ascx"
        panes("contact") = "~/Desktop/Panes/ContactPane.ascx"
        panes("news") = "~/Desktop/Panes/NewsPane.ascx"
        panes("weather") = "~/Desktop/Panes/WeatherPane.ascx"
        Return panes
    End Function

End Class
