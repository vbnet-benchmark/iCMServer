<%@ Page Language="vb" AutoEventWireup="false" Codebehind="EditSitesUpload.aspx.vb" Inherits="iConsulting.iCMServer.Modules.Sites.EditSitesUpload"%>
<%@ Register TagPrefix="iCMServerStyle" TagName="Title" Src="~/Server/Css/iCMServerStyle.ascx"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>EditSitesUpload</title>
		<icmserverstyle:title id="iCMServerStyle1" ViewSource="Main" ViewType="Standard" runat="server"></icmserverstyle:title>
	</HEAD>
	<body leftmargin="0" bottommargin="0" rightmargin="0" topmargin="0" marginheight="0" marginwidth="0">
		<form enctype="multipart/form-data" runat="server" ID="Form1">
			<table width="100%" cellspacing="0" cellpadding="0" border="0">
				<tr valign="top" height="100">
					<td colspan="2">
					</td>
				</tr>
				<tr>
					<td>
						<br>
						<table width="98%" cellspacing="0" cellpadding="4" border="0">
							<tr valign="top">
								<td width="80">
									&nbsp;
								</td>
								<td>
									<table width="455" cellspacing="0" cellpadding="0">
										<tr>
											<td align="left" class="Head">
												<asp:Label id="lblHeader" runat="server">lblHeader</asp:Label>
											</td>
											<td align="right" class="SubHead">
												<asp:Label id="lblMax" runat="server">lblMax</asp:Label>
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<hr noshade size="1">
											</td>
										</tr>
										<tr>
											<td class="SubHead"></td>
											<td align="right"><input type="file" id="FileUpload" width="300" style="WIDTH:353px;FONT-FAMILY:verdana"
													runat="server" NAME="FileUpload"></td>
										</tr>
										<tr>
											<td colspan="2">
												<hr noshade size="1">
											</td>
										</tr>
										<tr>
											<td colspan="2" align="right">
												<asp:Button id="btnSave" runat="server" Text="btnSave" CssClass="iCWebControlsII"></asp:Button>&nbsp;
												<asp:Button id="btnCancel" runat="server" Text="btnCancel" CssClass="iCWebControlsII"></asp:Button>&nbsp;
												<asp:Button id="btnDelete" runat="server" Text="btnDelete" CssClass="iCWebControlsII"></asp:Button>
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<hr noshade size="1">
											</td>
										</tr>
										<tr>
											<td class="SubHead">Install skin package:</td>
											<td align="right"><input type="file" id="FileUploadSkin" width="300" style="WIDTH:353px;FONT-FAMILY:verdana"
													runat="server" NAME="FileUploadSkin"></td>
										</tr>
										<tr>
											<td colspan="2" align="right">
												<asp:Button id="btnInstallSkin" runat="server" Text="btnInstallSkin" CssClass="iCWebControlsII"></asp:Button>&nbsp;
												<asp:Button id="btnInstallSkinSafe" runat="server" Text="btnInstallSkinSafe" CssClass="iCWebControlsII"></asp:Button>
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<hr noshade size="1">
											</td>
										</tr>
										<tr>
											<td class="SubHead" colspan="2">Import site configuration from XML:</td>
										</tr>
										<tr>
											<td class="SubHead">Paste site config XML:</td>
											<td align="right"><asp:TextBox id="TextboxSiteConfigXml" runat="server" TextMode="MultiLine" Rows="4" Columns="40"></asp:TextBox></td>
										</tr>
										<tr>
											<td colspan="2" align="right">
												<asp:Button id="btnImportSiteConfig" runat="server" Text="btnImportSiteConfig" CssClass="iCWebControlsII"></asp:Button>&nbsp;
												<asp:Button id="btnImportSiteConfigSafe" runat="server" Text="btnImportSiteConfigSafe" CssClass="iCWebControlsII"></asp:Button>&nbsp;
												<asp:Button id="btnImportSiteConfigIndirect" runat="server" Text="btnImportSiteConfigIndirect" CssClass="iCWebControlsII"></asp:Button>&nbsp;
												<asp:Button id="btnImportSiteConfigIndirectSafe" runat="server" Text="btnImportSiteConfigIndirectSafe" CssClass="iCWebControlsII"></asp:Button>&nbsp;
												<asp:Button id="btnImportSiteConfigAutoDetect" runat="server" Text="btnImportSiteConfigAutoDetect" CssClass="iCWebControlsII"></asp:Button>
											</td>
										</tr>
										<tr>
											<td class="SubHead">Bulk site config files:</td>
											<td align="right"><input type="file" id="FileUploadSiteConfigBatch1" width="300" style="WIDTH:353px;FONT-FAMILY:verdana"
													runat="server" NAME="FileUploadSiteConfigBatch1"></td>
										</tr>
										<tr>
											<td class="SubHead"></td>
											<td align="right"><input type="file" id="FileUploadSiteConfigBatch2" width="300" style="WIDTH:353px;FONT-FAMILY:verdana"
													runat="server" NAME="FileUploadSiteConfigBatch2"></td>
										</tr>
										<tr>
											<td colspan="2" align="right">
												<asp:Button id="btnImportSiteConfigBatch" runat="server" Text="btnImportSiteConfigBatch" CssClass="iCWebControlsII"></asp:Button>&nbsp;
												<asp:Button id="btnImportSiteConfigBatchSafe" runat="server" Text="btnImportSiteConfigBatchSafe" CssClass="iCWebControlsII"></asp:Button>
											</td>
										</tr>
										<tr>
											<td class="SubHead">Config export URL:</td>
											<td align="right"><asp:TextBox id="TextboxSiteConfigUrl" runat="server" Columns="40"></asp:TextBox></td>
										</tr>
										<tr>
											<td colspan="2" align="right">
												<asp:Button id="btnImportSiteConfigFromUrl" runat="server" Text="btnImportSiteConfigFromUrl" CssClass="iCWebControlsII"></asp:Button>&nbsp;
												<asp:Button id="btnImportSiteConfigFromUrlSafe" runat="server" Text="btnImportSiteConfigFromUrlSafe" CssClass="iCWebControlsII"></asp:Button>
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<asp:Label id="LabelSiteConfigResult" runat="server"></asp:Label>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
