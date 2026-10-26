<%@ Register TagPrefix="iCMServerStyle" TagName="Title" Src="~/Server/Css/iCMServerStyle.ascx"%>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="iCM.aspx.vb" Inherits="iConsulting.iCMServer.iCM"%>
<HTML>
	<HEAD>
		<title>iConsulting Management Server</title>
		<icmserverstyle:title id="iCMServerStyle1" ViewSource="Main" ViewType="Standard" runat="server"></icmserverstyle:title>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body id="iCMBody" bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="0" marginheight="0"
		marginwidth="0" runat="server">
		<form id="Form1" runat="server">
			<asp:Panel id="JavaScriptHolder" runat="server"></asp:Panel>
			<table id="iCMPage" height="100%" cellSpacing="0" cellPadding="0" width="100%" border="0"
				runat="server">
				<TBODY>
					<tr>
						<td vAlign="top">
							<table cellSpacing="0" cellPadding="0" width="100%" border="0">
								<tr vAlign="top">
									<td id="TopModuleField" height="15" runat="server"></td>
									<td align="right">
										<table width="100%" border="0">
											<tr>
												<td>&nbsp;</td>
											</tr>
											<tr>
												<td align="right">
													<asp:LinkButton id="btnLogIn" runat="server" CssClass="SubSubHead">LinkButton</asp:LinkButton>
													<asp:LinkButton id="btnLogOut" runat="server" CssClass="SubSubHead">LinkButton</asp:LinkButton>
													<asp:LinkButton id="btnSaveLayout" runat="server" CssClass="SubSubHead">Save my layout</asp:LinkButton>
													<input type="hidden" id="hdnMinimizedModuleIds" runat="server"></td>
											</tr>
										</table>
									</td>
								</tr>
								<asp:placeholder id="ContentAdjust1" runat="server"></asp:placeholder>
								<TR>
									<TD colSpan="2">
										<div id="iCMPageHeight" runat="server">
											<table cellSpacing="0" cellPadding="2" width="100%" border="0">
												<tr vAlign="top" height="100%">
													<td class="LeftModuleField" id="LeftModuleField" vAlign="top" width="20%" runat="server"
														Visible="True"><br>
														<asp:image id="LeftModuleFieldSpacer" ImageUrl="~/Server/Images/spacer.gif" Height="1" BorderWidth="0"
															Runat="server"></asp:image></td>
													<td class="ContentModuleField" id="ContentModuleField" vAlign="top" runat="server" Visible="True"><br>
														<asp:image id="ContentModuleFieldSpacer" Width="1" ImageUrl="~/Server/Images/spacer.gif" Height="1"
															BorderWidth="0" Runat="server"></asp:image></td>
													<td class="RightModuleField" id="RightModuleField" vAlign="top" width="20%" runat="server"
														Visible="True"><br>
														<asp:image id="RightModuleFieldSpacer" ImageUrl="~/Server/Images/spacer.gif" Height="1" BorderWidth="0"
															Runat="server"></asp:image></td>
												</tr>
											</table>
										</div>
									</TD>
								</TR>
							</table>
						</td>
					</tr>
					<tr>
						<td vAlign="bottom">
							<asp:placeholder id="FooterField1" runat="server"></asp:placeholder>
						</td>
					</tr>
				</TBODY>
			</table>
		</form>
	</body>
</HTML>
