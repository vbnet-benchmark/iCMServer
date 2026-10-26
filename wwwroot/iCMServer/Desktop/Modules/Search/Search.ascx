<%@ Register TagPrefix="Site" TagName="Title" Src="~/Desktop/Controls/DesktopModuleTitle.ascx"%>
<%@ Control Language="vb" AutoEventWireup="false" Codebehind="Search.ascx.vb" Inherits="iConsulting.iCMServer.Modules.Search.Search" targetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<SITE:TITLE id="Title2" EditText="" Location="" Phrase="" EditUrl="" runat="server"></SITE:TITLE>
<div id="Minimizer" runat="server">
	<table cellpadding="0" cellspacing="0" border="0" width="100%">
		<tr>
			<td width="15">&nbsp;</td>
			<td></td>
			<td width="15">&nbsp;</td>
		</tr>
		<tr>
			<td width="15">&nbsp;</td>
			<td align="center"><asp:TextBox id="txtSearch" title="Sök i StoraSökguidens arkiv" runat="server" Width="187px"
					BorderColor="Navy" BorderStyle="Solid" BorderWidth="1px" Height="22px" ForeColor="Navy"></asp:TextBox>
				&nbsp;&nbsp;<asp:Button title="Sök filer och artiklar i intranät" id="btnSearch" runat="server" Text="Sök" BorderWidth="1px"
					BorderColor="Navy" BackColor="White" ForeColor="Navy"></asp:Button></td>
			<td width="15">&nbsp;</td>
		</tr>
		<tr>
			<td width="15">&nbsp;</td>
			<td></td>
			<td width="15">&nbsp;</td>
		</tr>
		<tr>
			<td width="15">&nbsp;</td>
			<TD align="center" style="BORDER-RIGHT: black 1px solid; BORDER-TOP: black 1px solid; OVERFLOW: auto; BORDER-LEFT: black 1px solid; BORDER-BOTTOM: black 1px solid"
				bgcolor="white" runat="server" id="ContentFieldTD"><div id="ContentField" runat="server"><asp:PlaceHolder id="ResultHolder" runat="server"></asp:PlaceHolder></div>
			</TD>
			<td width="15">&nbsp;</td>
		</tr>
	</table>
</div>
<asp:PlaceHolder id="ScriptHolder" runat="server"></asp:PlaceHolder>
