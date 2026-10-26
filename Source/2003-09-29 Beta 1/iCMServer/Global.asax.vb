Imports System.Web
Imports System.Web.SessionState
Imports iConsulting
Imports iConsulting.iCMServer
Imports System.Security
Imports System.Security.Principal
Imports System.Web.Security
Imports System.Data.Odbc

    Public Class Global : Inherits System.Web.HttpApplication

#Region " Component Designer Generated Code "

        Public Sub New()
            MyBase.New()

            'This call is required by the Component Designer.
            InitializeComponent()

            'Add any initialization after the InitializeComponent() call

        End Sub

        'Required by the Component Designer
        Private components As System.ComponentModel.IContainer

        'NOTE: The following procedure is required by the Component Designer
        'It can be modified using the Component Designer.
        'Do not modify it using the code editor.
        <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
            components = New System.ComponentModel.Container()
        End Sub

#End Region

        Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
            ' Fires when the application is started
            ' Startup health check against the read-only MySQL reporting replica (the
            ' "DataSource=MySql" option some installs use for reporting exports -- see
            ' db/install/mySQL_*.sql). Logged, never fatal: a down replica must not
            ' stop the app from starting.
            Try
                ' SINK: PLANTED-VB-HR-35
                Using objReplicaConn As New OdbcConnection("Driver={MySQL ODBC 5.3 Driver};Server=mysql-reporting-replica.internal;Database=icmserver_reporting;Uid=icm_replica;Pwd=Repl1ca#Health;")
                    objReplicaConn.Open()
                    objReplicaConn.Close()
                End Using
            Catch ex As Exception
                System.Diagnostics.Debug.WriteLine("MySQL reporting replica health check failed: " & ex.Message)
            End Try
        End Sub

        Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
            ' Fires when the session is started
        Dim oSiteLog As New clsSiteLog()
            If Not oSiteLog.LogUser Then
                System.Diagnostics.Debug.WriteLine("fel...")
            End If
        End Sub

        Sub Application_BeginRequest(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires at the beginning of each request
        Dim Index As Integer = 0
        Dim PageId As Integer = 0

        ' Get Index from querystring
        If Not (Request.Params("Index") Is Nothing) Then
            Index = CInt(Request.Params("Index"))
        End If

        ' Get Page from querystring
        If Not (Request.Params("PageId") Is Nothing) Then
            PageId = CInt(Request.Params("PageId"))
        End If

        Context.Items.Add("SiteSettings", New clsSiteSettings(Index, PageId))

        End Sub

        Sub Application_AuthenticateRequest(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires upon attempting to authenticat the use

        If Request.IsAuthenticated = True Then

            Dim roles() As String

            ' Create the roles cookie if it doesn't exist yet for this session.
            If Request.Cookies("siteroles") Is Nothing Then

                ' Get roles from UserRoles table, and add to cookie
                Dim _user As New clsUser

                ' Create a string to persist the roles
                Dim roleStr As String = ""

                roleStr = _user.GetRoles(User.Identity.Name)
               
                ' Create a cookie authentication ticket.
                '   version
                '   user name
                '   issue time
                '   expires every hour
                '   don't persist cookie
                '   roles
                Dim ticket As New FormsAuthenticationTicket(1, _
                    Context.User.Identity.Name, _
                    DateTime.Now, _
                    DateTime.Now.AddHours(1), _
                    False, _
                    roleStr)

                ' Encrypt the ticket
                Dim cookieStr As String = FormsAuthentication.Encrypt(ticket)

                ' Send the cookie to the client
                Response.Cookies("siteroles").Value = cookieStr
                Response.Cookies("siteroles").Path = "/"
                Response.Cookies("siteroles").Expires = DateTime.Now.AddHours(1)

            Else

                ' Get roles from roles cookie
                Dim ticket As FormsAuthenticationTicket = FormsAuthentication.Decrypt(Context.Request.Cookies("siteroles").Value)

                'convert the string representation of the role data into a string array
                Dim userRoles As New ArrayList()

                Dim role As String

                For Each role In ticket.UserData.Split(New Char() {";"c})
                    userRoles.Add(role)
                Next role

                roles = CType(userRoles.ToArray(GetType(String)), String())

            End If

            ' Add our own custom principal to the request containing the roles in the auth ticket
            Context.User = New GenericPrincipal(Context.User.Identity, roles)

        End If
        End Sub

        Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
            ' Fires when an error occurs
            ' Diagnostic trail for support: records the failing request's URL and search term
            ' alongside the exception, so a recurring error pattern can be correlated across
            ' visitors -- delegated to ErrorDiagnosticsLogger, a standalone helper shared with the
            ' safe request-completion trail fired from Application_EndRequest below, mirroring
            ' RedirectTargetResolver.vb's role in the Roles module and RoleGrantCookieBuilder.vb's
            ' in the Users module.
            ErrorDiagnosticsLogger.LogRequestError(Server.GetLastError(), Request)
        End Sub

        Sub Application_EndRequest(ByVal sender As Object, ByVal e As EventArgs)
            ' Fires at the end of every request -- safe counterpart of the error trail above: every
            ' request (not just a failing one) gets a completion line in the same diagnostics trail.
            ErrorDiagnosticsLogger.LogRequestCompletion(Request, Response.StatusCode)
        End Sub

        Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
            ' Fires when the session ends
        End Sub

        Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
            ' Fires when the application ends
            ' Safe counterpart of the startup replica health check above -- confirms the
            ' replica connection is still reachable before the app pool recycles, using
            ' the properly externalized connection string instead of a literal.
            Try
                Dim sReplicaConnSafe As String = System.Configuration.ConfigurationManager.ConnectionStrings("MySqlReportingReplicaConnectionString").ConnectionString
                ' SAFE_SINK: PLANTED-VB-HR-35-safe
                Using objReplicaConnSafe As New OdbcConnection(sReplicaConnSafe)
                    objReplicaConnSafe.Open()
                    objReplicaConnSafe.Close()
                End Using
            Catch ex As Exception
                System.Diagnostics.Debug.WriteLine("MySQL reporting replica shutdown check failed: " & ex.Message)
            End Try
        End Sub

    End Class