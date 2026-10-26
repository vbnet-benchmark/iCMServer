<%@ Register TagPrefix="Site" TagName="Title" Src="~/Desktop/Controls/DesktopModuleTitle.ascx"%>
<%@ Control Language="vb" AutoEventWireup="false" Codebehind="Events.ascx.vb" Inherits="iConsulting.iCMServer.Modules.Events.Events" TargetSchema="http://schemas.microsoft.com/intellisense/ie3-2nav3-0" %>
<SITE:TITLE id="Title2" runat="server" EditUrl="~/Desktop/Modules/Events/EventsEdit.aspx" Phrase="events_edit"
	Location="iConsulting.iCMServer.Modules.Events" EditText=""></SITE:TITLE>
<div id="Minimizer" runat="server">
<asp:datalist id="myDataList" runat="server" EnableViewState="false" Width="98%" CellPadding="4">
	<ItemTemplate>
		<table border="0">
			<tr>
				<td align="left" colspan="2">
					<asp:HyperLink id=editLink runat="server" Visible="<%# IsEditable %>" NavigateUrl='<%# "~/Desktop/Modules/Events/EventsEdit.aspx?EveId=" &amp; DataBinder.Eval(Container.DataItem,"eve_id") &amp; "&amp;ModId=" &amp; ModuleId &amp; "&amp;PageId=" &amp; PagId %>' ImageUrl="Images/edit.gif">
					</asp:HyperLink>
				</td>
				<td align="left" width="100%">
					<SPAN class="SubHead" align="left">
						<%# DataBinder.Eval(Container.DataItem,"eve_title") %>
						<asp:Label id=ShowDate runat="server" Visible='<%# DataBinder.Eval(Container.DataItem,"eve_hidedate") < Now %>' CssClass="SubSubHead" ForeColor="#ff0066">c1</asp:Label>
						<asp:Label id=HideDate runat="server" Visible='<%# DataBinder.Eval(Container.DataItem,"eve_showdate") > Now %>' CssClass="SubSubHead" ForeColor="#009966">u1</asp:Label>
					</SPAN>
				</td>
			</tr>
			<tr>
				<td align="left" width="1"></td>
				<td align="left" width="1"></td>
				<td colspan="2"><SPAN class="SubSubHead"><%# DataBinder.Eval(Container.DataItem,"eve_description") %></SPAN></td>
			</tr>
			<tr>
				<td align="left" width="1"></td>
				<td align="left" width="1"></td>
				<td colspan="2">
					<asp:HyperLink id=moreLink runat="server" CssClass="SubSubHead" Visible='<%# DataBinder.Eval(Container.DataItem,"eve_link") <> String.Empty %>' NavigateUrl='<%# DataBinder.Eval(Container.DataItem,"eve_link") %>'>aaaa</asp:HyperLink></td>
			</tr>
		</table>
	</ItemTemplate>
</asp:datalist>
</div>