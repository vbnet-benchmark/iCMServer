var ContentViewMode = 1;
var Editable = false;
var ShowSpecialCommand = GetBrowserSupport();
var ShowMS6Command = GetMS6Support();

function getBrowser() {
    var vBrowser=navigator.appName;			
    var vVersion=navigator.appVersion;
    var sBrowser;
    try{
		//window.status = vBrowser+" "+vVersion+" "
    }
    catch(e){
		//alert("Do not support window.");
    }
    if (vBrowser.indexOf("Microsoft")>=0 && vVersion.indexOf("6.")>=0)
        {sBrowser="ie6";} 	// Microsoft Internet Explorer 6.x
    else if (vBrowser.indexOf("Microsoft")>=0 && vVersion.indexOf("5.5")>=0)
        {sBrowser="ie5.5";} // Microsoft Internet Explorer 5.5
    else if (vBrowser.indexOf("Microsoft")>=0 && vVersion.indexOf("5.0")>=0)
        {sBrowser="ie5";} 	// Microsoft Internet Explorer 5.x
    else if (vBrowser.indexOf("Microsoft")>=0 && vVersion.indexOf("4")>=0)
        {sBrowser="ie4";}	// Microsoft Internet Explorer 4.x
    else if (vBrowser.indexOf("Microsoft")>=0 && vVersion.indexOf("3")>=0)
        {sBrowser="ie3";}	// Microsoft Internet Explorer 3.x
    else if (vBrowser.indexOf("Netscape")>=0 && vVersion.indexOf("7")>=0)
        {sBrowser="ns7";}	// Netscape Navigator 7.x
    else if (vBrowser.indexOf("Netscape")>=0 && vVersion.indexOf("6")>=0)
        {sBrowser="ns6";}	// Netscape Navigator 6.x
    else if (vBrowser.indexOf("Netscape")>=0 && vVersion.indexOf("5")>=0)
        {sBrowser="ns5";}	// Netscape Navigator 5.x
    else if (vBrowser.indexOf("Netscape")>=0 && vVersion.indexOf("4")>=0)
        {sBrowser="ns4";}	// Netscape Navigator 4.x
    else if (vBrowser.indexOf("Netscape")>=0 && vVersion.indexOf("3")>=0)
        {sBrowser="ns3";}	// Netscape Navigator 3.x
    else
        {sBrowser="other";}	// All Others 
        
    try{
		//window.status += sBrowser
    }
    catch(e){
		//alert("Do not support window.");
    }	
    return(sBrowser);
}
function GetBrowserSupport(){
	try{
		var strBrowser = getBrowser();
		if((strBrowser == "ie6") || (strBrowser == "ie5.5")){
			return true
		}
		else{
			return false
		}
	}
	catch(e){
		return false
	}
}
function GetMS6Support(){
	try{
		var strBrowser = getBrowser();
		if((strBrowser == "ie6")){
			return true
		}
		else{
			return false
		}
	}
	catch(e){
		return false
	}
}
function IsIE456(){
	try{
		var strBrowser = getBrowser();
		if((strBrowser == "ie6") || (strBrowser == "ie5.5")){
			return true
		}
		else{
			return false
		}
	}
	catch(e){
		return false
	}
}
function getIFrameDocument(aID){
	try{
        if (document.getElementById(aID).contentDocument){
			return document.getElementById(aID).contentDocument;
		}
        else{
			return document.frames[aID].document;
		}
	}
	catch(e){
		//alert(e)
	}

}
function Initialize(){
	try{
		getIFrameDocument("ContentView").designMode = "On";
        window.setTimeout("InsertContent()",200);
        window.setTimeout("AddEvent()",400);
	}
	catch(e){
		//alert(e)
	}
}
function InsertContent(){
	try{
        var ec = document.getElementById("DesktopText");
        getIFrameDocument("ContentView").body.innerHTML=ec.value;
        document.getElementById('ContentView').contentWindow.focus();
	}
	catch(e){
		//alert(e)
	}
}
function AddEvent(){
	try{
		if(IsIE456()){
			ContentView.document.body.onclick=function(){Editable=true} 
		}
		else{
			Editable=true 
		}
	}
	catch(e){
		//alert(e)
	}
}
function alertmedd(){
	//alert("Click in the document area before inserting object.");
	alert(document.getElementById("Alert").value);
}

function SaveContent(){
	try{
        var ec = document.getElementById("EditorContent");
		if(ContentViewMode==2){ChangeContentViewMode()}
		ec.value = getIFrameDocument("ContentView").body.innerHTML;
		document.Editor.submit();
	}
	catch(e){
		//alert(e)
	}
}
 
function ChangeContentViewMode(){
	try{
		if(ContentViewMode == 1){
			var iHTML = getIFrameDocument("ContentView").body.innerHTML;
			getIFrameDocument("ContentView").body.innerText = iHTML;
			ContentViewMode = 2;
			var b = document.getElementById("POP");
			b.innerText = document.getElementById("HtmlMode").value;
		}
		else{
			var iText = getIFrameDocument("ContentView").body.innerText;
			getIFrameDocument("ContentView").body.innerHTML = iText;
			ContentViewMode = 1;
			var b = document.getElementById("POP");
			b.innerText = document.getElementById("DesignMode").value;
		}
	}
	catch(e){
		//alert(e)
	}
}
function CreateHorizontalRule(){
	try{
		getIFrameDocument("ContentView").execCommand("inserthorizontalrule",false,null);
	}
	catch(e){
		//alert(e)
	}
}
function UpperCase() {
	try{
		var t = getIFrameDocument("ContentView").body.innerHTML;
		getIFrameDocument("ContentView").body.innerHTML = t.toUpperCase()
	}
	catch(e){
		//alert(e)
	}
}
function LowerCase() {
	try{
		var t = getIFrameDocument("ContentView").body.innerHTML;
		getIFrameDocument("ContentView").body.innerHTML = t.toLowerCase()
	}
	catch(e){
		//alert(e)
	}
}
function WebBrowserPreview() {
	try{
		var obj = window.open("","","");
		obj.document.body.innerHTML = "<html><head><title>WebBrowserPreview</title></head><body>"+getIFrameDocument("ContentView").body.innerHTML+"</body></html>";
	}
	catch(e){
		//alert(e)
	}
}
function ExecuteCommand(aName, aArg){
	try{
		getIFrameDocument('ContentView').execCommand(aName,false, aArg);
		document.getElementById('ContentView').contentWindow.focus()
	}
	catch(e){
		//alert(e)
	}
}

function CreateLink(){
	CreateNewLink();
}

function CreateNewLink(){
	//var _urlfield = null;
	//var _displayfield = null;
	//showModalDialog("PublisherEditLink.aspx",window,"dialogHeight: 140px; dialogWidth: 400px; dialogTop: 200px; dialogLeft: 150px; edge: Sunken; center: Yes; help: No; resizable: No; status: No;");
	window.open("PublisherEditLink.aspx","Link","Height=140,Width=400");
}

function InsertNewLink(_urlfield,_displayfield){
	var _LinkContent = "<a href=\'"+_urlfield+"\' target='_blank'>"+_displayfield+"</a>"
	if(IsIE456()){
		var _MarkedRange = getIFrameDocument("ContentView").selection.createRange();
		_MarkedRange.pasteHTML(_LinkContent);
	}
	else{
		getIFrameDocument("ContentView").body.innerHTML = _LinkContent + getIFrameDocument("ContentView").body.innerHTML;
	}
	document.getElementById('ContentView').contentWindow.focus();
}


