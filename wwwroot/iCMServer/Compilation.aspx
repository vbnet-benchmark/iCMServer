<%@ Page language="c#" Src="Compilation.aspx.cs" Codebehind="Compilation.aspx.cs" AutoEventWireup="false" Inherits="WebApp.Compilation" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head>
		<title>Compilation & Precompilation</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<style type="text/css">
		BODY { MARGIN: 2px 10px 2px 5px; BACKGROUND-COLOR: white }
		BODY { FONT-SIZE: 8pt; FONT-FAMILY: Verdana }
		TABLE { FONT-SIZE: 8pt; FONT-FAMILY: Verdana }
		INPUT { FONT-SIZE: 8pt; FONT-FAMILY: Verdana }
		BUTTON { FONT-SIZE: 8pt; FONT-FAMILY: Verdana }
		TEXTAREA { FONT-SIZE: 8pt; FONT-FAMILY: Verdana }
		SELECT { FONT-SIZE: 8pt; FONT-FAMILY: Verdana }
		.file
		{
		}
		.exception_title
		{
			font-weight: bold;
		}
		.exception
		{
			font-family: Courier New;
			font-size: 9pt;
		}
		.code
		{
			font-family: Courier New;
			font-size: 9pt;
			white-space: pre;
		}
		.compiler_errors
		{
			font-family: Courier New;
			font-size: 9pt;
		}
		.compilation_error
		{
			font-weight: bold;
			color: red;
		}
		.compilation_success
		{
			font-weight: bold;
			color: blue;
		}
		.total
		{
			font-weight: bold;
		}
		</style>
	</head>
	<body>
		<form id="Form1" method="post" runat="server">
			<br>
			<br>
			<div style="FONT-WEIGHT: bold; FONT-SIZE: 12pt">
				Web Application Compilation &amp; Precompilation
			</div>
			<br>
			<table width="500">
				<tr>
					<td>
						<asp:button Runat="server" ID="buttonPrecompile" Text="Precompile" />
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>Output assembly name</td>
					<td>
						<asp:textbox Runat="server" ID="tboxAssemblyName" Text="UI.dll" Columns="40" />
					</td>
				</tr>
				<tr>
					<td width="180">Source code output directory</td>
					<td>
						<asp:textbox Runat="server" ID="tboxSourceCodePath" Text="_ASPX" Columns="40" />
					</td>
				</tr>
				<tr>
					<td>Treat warnings as errors</td>
					<td>
						<asp:checkbox Runat="server" ID="cboxWarningsAsErrors" />
					</td>
				</tr>
				<tr>
					<td>Include debug info</td>
					<td>
						<asp:checkbox Runat="server" ID="cboxDebugInfo" />
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2">
					<b>Note:</b> Both paths are relative to the application's root directory.
					For example if you specify "UI.dll" as assembly name and "_ASPX" as
					output directory the assembly will be saved at the application's root
					directory and the source code at the _ASPX sub directory.
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2">
					<b>Note:</b> You may specified either "Output assembly name", "Source code output directory"
					or both. The two checkboxes apply only on compilation.
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2">
						<asp:label Runat="server" ID="labelCompileError" ForeColor="Red" EnableViewState="False" />
					</td>
				</tr>
				<tr>
					<td>
						<asp:button Runat="server" ID="buttonCompile" Text="Compile" />
					</td>
				</tr>
				<tr>
					<td>Resource files</td>
					<td>
						<asp:textbox Runat="server" ID="tboxResources" Text="*.html,*.css,*.js,*.ico,*.gif,*.bmp,*.png,*.jpg,*.jpeg" Columns="40" />
					</td>					
				</tr>
				<tr>				
					<td colspan="2">Specify comma separated list of search patterns (wildcards are allowed)</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>				
					<td colspan="2"><b>Note:</b> All resources in the application's root directory and its sub-directories
					that match the specified patterns will be embedded in the assembly.</td>
				</tr>
			</table>
			<br>
			<b>Compiled/precompiled files:</b>
			<br><br>
			<div style="white-space: nowrap;">
				<asp:literal Runat="server" ID="labelFiles" EnableViewState="False" />
				<br>
				<asp:label Runat="server" ID="labelCompilerResults" EnableViewState="False" />
				<br>
				<asp:label Runat="server" ID="labelCompilerResults2" EnableViewState="False" />
				<br>
				<asp:label Runat="server" ID="labelCompilerResults3" EnableViewState="False" />
			</div>
		</form>
	</body>
</html>
