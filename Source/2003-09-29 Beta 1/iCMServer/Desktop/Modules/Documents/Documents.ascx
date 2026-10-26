<%@ Register TagPrefix="Site" TagName="Title" Src="~/Desktop/Controls/DesktopModuleTitle.ascx"%>
<%@ Control Language="vb" AutoEventWireup="false" Codebehind="Documents.ascx.vb" Inherits="iConsulting.iCMServer.Modules.Documents.Documents" targetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="iCMServerStyle" TagName="Title" Src="~/Server/Css/iCMServerStyle.ascx"%>
<icmserverstyle:title id="iCMServerStyle1" ViewSource="Main" ViewType="Standard" runat="server"></icmserverstyle:title>
<script src="Server/Modules/Pages/XLoadTree/xtree.js" type="text/javascript"></script>
<script src="Server/Modules/Pages/XLoadTree/xmlextras.js" type="text/javascript"></script>
<script src="Server/Modules/Pages/XLoadTree/xloadtree.js" type="text/javascript"></script>
<script language="javascript">
	// WebFX Config...
	webFXTreeConfig.rootIcon		= "Desktop/Modules/Documents/XLoadTree/images/xp/folder.png";
	webFXTreeConfig.openRootIcon	= "Desktop/Modules/Documents/XLoadTree/images/xp/openfolder.png";
	webFXTreeConfig.folderIcon		= "Desktop/Modules/Documents/XLoadTree/images/xp/folder.png";
	webFXTreeConfig.openFolderIcon	= "Desktop/Modules/Documents/XLoadTree/images/xp/openfolder.png";
	webFXTreeConfig.fileIcon		= "Desktop/Modules/Documents/XLoadTree/images/xp/file.png";
	webFXTreeConfig.lMinusIcon		= "Desktop/Modules/Documents/XLoadTree/images/xp/Lminus.png";
	webFXTreeConfig.lPlusIcon		= "Desktop/Modules/Documents/XLoadTree/images/xp/Lplus.png";
	webFXTreeConfig.tMinusIcon		= "Desktop/Modules/Documents/XLoadTree/images/xp/Tminus.png";
	webFXTreeConfig.tPlusIcon		= "Desktop/Modules/Documents/XLoadTree/images/xp/Tplus.png";
	webFXTreeConfig.iIcon			= "Desktop/Modules/Documents/XLoadTree/images/xp/I.png";
	webFXTreeConfig.lIcon			= "Desktop/Modules/Documents/XLoadTree/images/xp/L.png";
	webFXTreeConfig.tIcon			= "Desktop/Modules/Documents/XLoadTree/images/xp/T.png";
	var <%=TreeName%> = new WebFXLoadTree("<%=ModTitle%>", "Desktop/Modules/Documents/DocumentsEngine.aspx?sID=0,<%=ModId%>,0", "Javascript:GetDocuments(0)", "explorer", "Desktop/Modules/Documents/XLoadTree/images/xp/folder.png","Desktop/Modules/Documents/XLoadTree/images/xp/openfolder.png");
	<%=TreeName%>.setBehavior("explorer");
	
	// Object Variables
	var Object_Toggle="";
	var Object_Select="";
	var Object_deSelect="";
	var Object_Focus="";
	var Object_Blur="";
	var Object_Child=false;
	var Object_Root=false;
	var Object_ID=0;
	var SelectedSubItem=0;
	var DeselectedSubItem=0;
	var Report="";
	var CurrentFolder=0;
	
	// Object Properties
	
	// This Properties will be set in XLoadTree\xtree.js
	function SetToggle(object){Object_Toggle=object;BuildReport();}
	function SetSelect(object){Object_Select=object;BuildReport();}
	function SetdeSelect(object){Object_deSelect=object;BuildReport();}
	function SetFocus(object){Object_Focus=object;SetChild(object);SetID(object);BuildReport();}
	function SetBlur(object){Object_Blur=object;BuildReport();}
	
	// This Property will be set in this context
	function SetCurrentFolder(id){CurrentFolder=id;BuildReport();}
	function SetChild(object){if(object.childNodes.length > 0){Object_Child=true;}else{Object_Child=false;}}
	function SetID(object){tempstr=object.id;Object_ID=tempstr.substr(18,5);if(Object_ID==4){SetRoot(true)}else{SetRoot(false)}}
	function SetRoot(x){Object_Root=x;}
	function GetToggle(){return Object_Toggle;}
	function GetToggleText(){return Object_Toggle.text;}
	function GetFocus(){return Object_Focus;}
	function GetFocusText(){return Object_Focus.text;}
	
	// Build Variables Report
	function BuildReport(){
		Report="Object_Toggle = "+Object_Toggle.text+"\nObject_Select = "+Object_Select.text+"\nObject_deSelect = "+Object_deSelect.text+"\nObject_Focus = "+Object_Focus.text+"\nObject_Blur = "+Object_Blur.text+"\nCurrentFolder = "+CurrentFolder+"\nObject_Child = "+Object_Child+"\nObject_ID = "+Object_ID+"\nObject_Root = "+Object_Root+"\nDeselectedSubItem = "+DeselectedSubItem;
	}
	// Reload the tree or just the selected node, Executed from CatalogsModule\CatalogEdit.aspx
	function ReloadSelectedNode(mode){
		switch (mode){
			case 'ADD':
				if((Object_Child==true)&&(Object_Root==false)){	
					Object_Focus.reload();
				}
				else{
					window.location.reload();
				}
				break
			case 'DELETE':
				window.location.reload();
				break
			default:
				window.location.reload();
		}
	}
	function ToggleSelectedNode(){
		if(Object_Focus!=""){
			webFXTreeHandler.select(Object_Focus);
			window.setTimeout("GetDocuments(CurrentFolder);",500) 
		} 
	}
	function AddFolder(){
		if(!Object_Focus==""){
			var title=prompt("<%=AddFolderConfirm1%>"+Object_Focus.text+"<%=AddFolderConfirm2%>","<%=AddFolderDefaultText%>");
			if(title==null){
				return;
			}
			else{
				document.getElementById("FileContainer").src="Desktop/Modules/Documents/DocumentsFolderEdit.aspx?Mode=ADDFOLDER&CatId="+CurrentFolder+"&ModId="+"<%=ModId%>&Title="+title+"&PagId="+<%=PagId%>;
			}
		}
	}
	function DeleteFolder(){
		if((Object_Root==false) && (!Object_Focus=="")){
			if(confirm("<%=DeleteFolderConfirm%>"+Object_Focus.text+" ?")){
				document.getElementById("FileContainer").src="Desktop/Modules/Documents/DocumentsFolderEdit.aspx?Mode=DELETEFOLDER&CatId="+CurrentFolder+"&ModId="+"<%=ModId%>"+"&PagId="+<%=PagId%>;
			}
		}
	}
	function EditFile(){
		document.getElementById("FileContainer").src="Desktop/Modules/Documents/DocumentsEdit.aspx?CatId="+CurrentFolder+"&ModId="+"<%=ModId%>"+"&PageId="+<%=PagId%>;
	}
	function UploadFile(){
		document.getElementById("FileContainer").src="Desktop/Modules/Documents/DocumentsEdit.aspx?CatId="+CurrentFolder+"&ModId="+"<%=ModId%>"+"&PageId="+<%=PagId%>;
	}
	function SimpleView(){
		alert("SimpleView");
	}
	function DefaultView(){
		alert("DefaultView");
	}
	/*
	function AddFile(){
		if((Object_Root==false) && (!Object_Focus=="")){
			window.open("Desktop/Modules/Documents/DocumentsEdit.aspx?ModId=<%=ModId%>&CatId="+CurrentFolder);
		}
	}
	*/
	function GetDocuments(CatId){
		SetCurrentFolder(CatId);
		document.getElementById("FileContainer").src="Desktop/Modules/Documents/DocumentsGetFiles.aspx?CatId="+CatId+"&ModId="+"<%=ModId%>";
	}
</script>
<SITE:TITLE id="Title2" runat="server"></SITE:TITLE>
<div id="Minimizer" runat="server">
<TABLE id="Table1" height="98%" cellSpacing="1" cellPadding="1" width="99%" align="left"
	border="0">
	<!-- Button Bar -->
	<tr>
		<td>
			<TABLE id="Table2" height="21" cellSpacing="0" cellPadding="1" width="100%" align="left"
				border="0">
				<TR>
					<td width="3">&nbsp;</td>
					<TD bgColor="#e1e1e1">
						&nbsp;<IMG id="btnAddFolder" onclick="AddFolder()" alt="<%=AddFolderAltText%>" src="Desktop/Modules/Documents/Images/AddFolder.gif" style="cursor:hand">
						&nbsp;<IMG id="btnDeleteFolder" onclick="DeleteFolder()" alt="<%=DeleteFolderAltText%>" src="Desktop/Modules/Documents/Images/DeleteFolder.gif" style="cursor:hand">
						&nbsp;<IMG id="btnUploadFile" onclick="UploadFile()" alt="<%=UploadFileAltText%>" src="Desktop/Modules/Documents/Images/UploadFile.gif" style="cursor:hand">&nbsp;
						&nbsp;<IMG id="btnSimpleView" onclick="SimpleView()" alt="<%=SimpleViewAltText%>" src="Desktop/Modules/Documents/Images/SimpleView.gif" style="cursor:hand">
						&nbsp;<IMG id="btnDefaultView" onclick="DefaultView()" alt="<%=DefaultViewAltText%>" src="Desktop/Modules/Documents/Images/DefaultView.gif" style="cursor:hand">
					</TD>
				</TR>
			</TABLE>
		</td>
	</tr>
	<!-- Info Bar -->
	<tr>
		<td>
			<TABLE id="Table3" height="21" cellSpacing="0" cellPadding="1" width="100%" align="left"
				border="0">
				<TR>
					<td width="3">&nbsp;</td>
					<TD width="30%" bgColor="#e1e1e1">&nbsp;
						<asp:label id="lblFolders" runat="server" CssClass="SubHead">Folders</asp:label></TD>
					<TD vAlign="top" align="left" width="18" bgColor="#e1e1e1" height="100%">
						<div style="BORDER-RIGHT: darkgray thin solid; FONT-WEIGHT: bold; FONT-SIZE: small; VERTICAL-ALIGN: baseline; WIDTH: 18px; FONT-FAMILY: Verdana; POSITION: static; HEIGHT: 100%; BACKGROUND-COLOR: #e1e1e1; TEXT-ALIGN: center"></div>
					</TD>
					<TD align="left" width="70%" bgColor="#e1e1e1">
						<table id="Table4" cellSpacing="0" cellPadding="0" bgColor="#e1e1e1">
							<tr>
								<TD width="180">&nbsp;</TD>
								<TD width="5%">&nbsp;</TD>
								<TD width="29%"><asp:label id="lblTitle" runat="server" CssClass="SubHead">Title</asp:label></TD>
								<TD width="26%"><asp:label id="lblCreatedBy" runat="server" CssClass="SubHead">CreatedBy</asp:label></TD>
								<TD align="right" width="15%"><asp:label id="lblCreatedDate" runat="server" CssClass="SubHead">CreatedDate</asp:label></TD>
							</tr>
						</table>
					</TD>
				</TR>
			</TABLE>
		</td>
	</tr>
	<!-- Folders & Files -->
	<tr>
		<td>
			<TABLE id="Table5" height="100%" cellSpacing="0" cellPadding="1" width="100%" align="left"
				border="0">
				<TR>
					<td width="3">&nbsp;</td>
					<TD vAlign="top" align="left" width="30%" height="100%">
						<script>document.write(<%=TreeName%>)</script>
					</TD>
					<TD vAlign="top" align="left" width="18" height="100%"><div style="BORDER-RIGHT: darkgray thin solid; FONT-WEIGHT: bold; FONT-SIZE: small; VERTICAL-ALIGN: baseline; WIDTH: 18px; FONT-FAMILY: Verdana; POSITION: static; HEIGHT: 100%; BACKGROUND-COLOR: #e1e1e1; TEXT-ALIGN: center"></div>
					</TD>
					<TD vAlign="top" align="left" width="70%" height="100%"><iframe id="FileContainer" style="WIDTH: 100%; HEIGHT: 400px" marginWidth="0" marginHeight="0"
							src="" frameBorder="0" width="100%" scrolling="auto" height="400"></iframe>
					</TD>
				</TR>
			</TABLE>
		</td>
	</tr>
</TABLE>
<script>
	GetDocuments(0);
</script>
</div>
