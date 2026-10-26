<%@ Page Language="vb" AutoEventWireup="false" Codebehind="ResetPasswordConfirm.aspx.vb" Inherits="iConsulting.iCMServer.Modules.Users.ResetPasswordConfirm"%>
<HTML>
	<HEAD>
	</HEAD>
	<BODY bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="0">
		<form id="Form1" runat="server">
			<table cellSpacing="0" cellPadding="4" width="98%" border="0">
				<tr>
					<td class="Head" align="left">
						<asp:label id="lblHeader" runat="server">lblHeader</asp:label>
					</td>
				</tr>
				<tr>
					<td class="SubHead">
						<asp:Label id="lblEmail" runat="server">lblEmail</asp:Label>
						<asp:TextBox id="txtEmail" runat="server" Width="277px"></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td class="SubHead">
						<asp:Label id="lblCode" runat="server">lblCode</asp:Label>
						<asp:TextBox id="txtCode" runat="server" Width="277px"></asp:TextBox>
						<asp:button id="btnConfirm" runat="server" Text="btnConfirm" CssClass="iCWebControlsII"></asp:button>
					</td>
				</tr>
				<tr>
					<td class="Normal">
						<asp:Label id="lblMessage" runat="server"></asp:Label>
					</td>
				</tr>
			</table>
		</form>
	</BODY>
</HTML>
