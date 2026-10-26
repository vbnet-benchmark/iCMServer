<%@ Page Language="vb" AutoEventWireup="false" Codebehind="PublisherEditLink.aspx.vb" Inherits="iConsulting.iCMServer.Modules.Publisher.PublisherEditLink1"%>
<%@ Register TagPrefix="iCMServerStyle" TagName="Title" Src="~/Server/Css/iCMServerStyle.ascx"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
  <head>
		<title>Hyperlink</title>
		<icmserverstyle:title id="iCMServerStyle1" ViewSource="Main" ViewType="Standard" runat="server"></icmserverstyle:title>
		<script language="JavaScript">
			function ReturnLink(obj){
				try{
					window.opener.InsertNewLink(document.getElementById('urlfield').value,document.getElementById('displayfield').value)
					window.close();
				}
				catch(e){
					//alert("Hyperlink: "+e);
					this.close();
				}
				
			}
			function ChangeType(value){
				try{
					document.getElementById('urlfield').value=value;
				}
				catch(e){
					//alert(e)
				}
			}
		</script>
  </head>
  <body MS_POSITIONING="FlowLayout" bgColor="silver">

    <form id="Form1" method="post" runat="server">

			<TABLE height="74" cellSpacing="0" cellPadding="0" width="372" border="0" ID="Table1">
				<tr>
					<td colspan="7">&nbsp;</td>
				</tr>
				<tr>
					<td width="5">&nbsp;</td>
					<td width="30" class="SubHead"><%=Type%></td>
					<td width="5">&nbsp;</td>
					<td>
						<SELECT name="typefield" onchange="ChangeType(this.value);" ID="Select1">
							<option value="">(other)</option>
							<option value="file://">file:</option>
							<OPTION selected value="http://">http:</OPTION>
							<option value="https://">https:</option>
							<option value="gopher://">gopher:</option>
							<option value="mailto:">mailto:</option>
							<option value="news:">news:</option>
							<option value="telnet:">telnet:</option>
							<option value="wais:">wais:</option>
						</SELECT>
					</td>
					<td colspan="2">&nbsp;</td>
					<td rowspan="3">
						<table align="center" ID="Table2">
							<tr valign="middle">
								<td><button type="button" class="iCWebControlsII" onclick='ReturnLink();' style="WIDTH: 75px"
										onFocus="this.blur()" ID="Button1"><%=Save%></button></td>
							</tr>
							<tr valign="middle">
								<td><button type="button" class="iCWebControlsII" onclick='window.close();' style="WIDTH: 75px"
										onFocus="this.blur()" ID="Button2"><%=Cancel%></button></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td class="SubHead"><%=Show%></td>
					<td>&nbsp;</td>
					<td><INPUT id="displayfield" name="displayfield" type="text" value="MyLink..." size="28"></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td class="SubHead"><%=Url%></td>
					<td>&nbsp;</td>
					<td><INPUT id="urlfield" name="urlfield" type="text" value="http://" size="28"></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="7"></td>
				</tr>
			</TABLE>
    </form>

  </body>
</html>
