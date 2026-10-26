<%@ Page CodeBehind="AccessDenied.aspx.vb" language="vb" AutoEventWireup="false" Inherits="iConsulting.iCMServer.AccessDeniedPage" %>
<%@ Register TagPrefix="Site" TagName="Title" Src="~/Desktop/Controls/DesktopModuleTitle.ascx"%>
<%@ OutputCache Duration="36000" VaryByParam="none" %>
<HTML>
	<HEAD>
		<title>iCMServer</title>
		<link rel="stylesheet" href="../../Server/Css/iCMServer.css" type="text/css">
	</HEAD>
	<body leftmargin="0" bottommargin="0" rightmargin="0" topmargin="0" marginheight="0" marginwidth="0">
		<form runat="server">
			<table width="100%" cellspacing="0" cellpadding="0" border="0">
				<tr valign="top">
					<td colspan="2">
						<Site:title runat="server" id="Title2" />
					</td>
				</tr>
				<tr>
					<td valign="top">
						<center>
							<br>
							<table width="500" border="0">
								<tr>
									<td class="Normal">
										<br>
										<br>
										<br>
										<br>
										<span class="Head">Tillträde förbjudet</span>
										<br>
										<br>
										<hr noshade size="1">
										<br>
										Antingen är du inte inloggad för tillfället, eller har du inte rättigheter till 
										denna sidan i iCMLite.
										<br>
										<br>
										<a href="~/icm.aspx">Tillbaka till startsidan</a>
									</td>
								</tr>
							</table>
						</center>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
