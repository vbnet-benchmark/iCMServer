<%@ Page Language="vb" AutoEventWireup="false" Codebehind="DiagnosticsCenter.aspx.vb" Inherits="iConsulting.iCMServer.DiagnosticsCenter"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
	<head>
		<title>Diagnostics Center</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio.NET 7.0">
		<meta name="CODE_LANGUAGE" content="Visual Basic 7.0">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</head>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<h3>iCMServer Diagnostics Center (Admin)</h3>
			<p>
				Operational self-test tools for site administrators -- verify the main
				infrastructure dependencies are reachable without needing server console access.
			</p>
			<p>
				<asp:Button id="btnTestDatabase" runat="server" Text="Test Database Connectivity"></asp:Button>
				<asp:Label id="lblDbResult" runat="server"></asp:Label>
			</p>
			<p>
				<asp:Button id="btnTestSmtp" runat="server" Text="Test Mail Server Connectivity"></asp:Button>
				<asp:Label id="lblSmtpResult" runat="server"></asp:Label>
			</p>
			<p>
				<asp:Button id="btnTestFileSystem" runat="server" Text="Test File System Access"></asp:Button>
				<asp:Label id="lblFsResult" runat="server"></asp:Label>
			</p>
			<p>
				<asp:Button id="btnTestTempDirectory" runat="server" Text="Test Temp Directory Access"></asp:Button>
				<asp:Label id="lblTempResult" runat="server"></asp:Label>
			</p>
			<p>
				<asp:Button id="btnTestLegacyModule" runat="server" Text="Test Legacy Module Connectivity"></asp:Button>
				<asp:Label id="lblLegacyResult" runat="server"></asp:Label>
			</p>
			<p>
				<asp:Button id="btnTestReportingModule" runat="server" Text="Test Reporting Module Connectivity"></asp:Button>
				<asp:Label id="lblReportingResult" runat="server"></asp:Label>
			</p>
			<p>
				<asp:Button id="btnTestExternalApi" runat="server" Text="Test External Partner API"></asp:Button>
				<asp:Label id="lblExternalApiResult" runat="server"></asp:Label>
			</p>
			<p>
				<asp:Button id="btnTestCacheServer" runat="server" Text="Test Cache Server"></asp:Button>
				<asp:Label id="lblCacheResult" runat="server"></asp:Label>
			</p>
			<p>
				<asp:Button id="btnRunFullReport" runat="server" Text="Run Full Diagnostics Report"></asp:Button>
			</p>
			<p>
				<asp:Button id="btnEmailReport" runat="server" Text="Email Diagnostics Summary"></asp:Button>
			</p>
		</form>
	</body>
</html>
