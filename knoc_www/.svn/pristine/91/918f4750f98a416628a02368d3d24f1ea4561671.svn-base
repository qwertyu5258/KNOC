var HTTPStr = "http";
var URL = "jksoo.com";
var ScriptName = "/editor/image_up.php";
var Path = '/img/editor/images';
var deveditPath1 = '/devedit/demo/de';
var deveditPath = '/home/httpd/vhosts/interspire.com/httpdocs/devedit/demo/de';
var imageDir = "/devedit/demo/testimages";
var HideWebImage = 0;
var showThumbnails = 1;
var disableImageUploading = 0;
var disableImageDeleting = 0;


function SetFontSize(editor,htmlmode,name,value) {
	if (htmlmode) return;
	editor.focus();
	editor.document.execCommand('fontsize','',value);
}

function Strikethrough(editor,htmlmode) { 
	Format(editor,htmlmode,'strikethrough'); 
}

function onKeyDown_ParagraphBreak() {
	editor = editor;
	var _TAB = 9;
	var _ENTER = 13;
	var _QUOTE = 222;
	var _OPENCURLY = '&#8220;';
	var _CLOSECURLY = '&#8221;';
	
	if (editor.event.keyCode == _TAB && editor.event.ctrlKey) {
		//HtmlMode to DesignMode (Ctrl+TAB)
		if (HtmlMode && editor.event.keyCode == _TAB && editor.event.ctrlKey) {
			FTB_SetActiveTab(document.getElementById('DesignModeTab'));
			ChangeMode(editor,document.getElementById('TempFrame'),'Toolbar',false,true);
		}
		//DesignMode to HtmlMode (Ctrl+TAB)
		if (!HtmlMode && editor.event.keyCode == _TAB && editor.event.ctrlKey) {
			FTB_SetActiveTab(document.getElementById('HtmlModeTab'));
			ChangeMode(editor,document.getElementById('TempFrame'),'Toolbar',true,true);
		}
		HtmlMode = !HtmlMode;
	}
	if (editor.event.keyCode == _QUOTE && editor.event.shiftKey && !HtmlMode) {
		var sel = editor.document.selection;
		if (sel.type == 'Control') return;
		var r = sel.createRange();
		var before = FTB_CharBefore(r);
		var after = FTB_CharAfter(r);
		var r = sel.createRange();

		if (before == 'start') {
			r.pasteHTML(_OPENCURLY);
			editor.event.cancelBubble = true;
			editor.event.returnValue = false;
			return false;
		} else if (before != ' ' && after == 'end') {
			r.pasteHTML(_CLOSECURLY);
			editor.event.cancelBubble = true;
			editor.event.returnValue = false;
			return false;
		} else if (before == ' ' && after == 'end') {
			r.pasteHTML(_OPENCURLY);
			editor.event.cancelBubble = true;
			editor.event.returnValue = false;
			return false;
		} else if (before != ' ' && after == ' ') {
			r.pasteHTML(_CLOSECURLY);
			editor.event.cancelBubble = true;
			editor.event.returnValue = false;
			return false;
		} else {
			r.pasteHTML(_OPENCURLY);
			editor.event.cancelBubble = true;
			editor.event.returnValue = false;
			return false;
		}
	}

	if (editor.event.keyCode == _TAB) {
		editor.event.cancelBubble = true;
		editor.event.returnValue = false;
	}

	//check for Ctrl pressed.  Ctrl+Tab == switch modes.  Ctrl+Enter = <br>
	if ((HtmlMode && editor.event.keyCode == _ENTER) || (!HtmlMode && editor.event.ctrlKey && editor.event.keyCode == _ENTER))
	{
		var sel = editor.document.selection;
		if (sel.type == 'Control')
		{
			return;
		}
		
		var r = sel.createRange();			
		if ((!CheckTag(r.parentElement(),'LI'))&&(!CheckTag(r.parentElement(),'H')))
		{
			r.pasteHTML('<br>');
			editor.event.cancelBubble = true; 
			editor.event.returnValue = false; 
			r.select();
			r.collapse(false);
			return false;
		}
	}
	
	if (!HtmlMode && editor.event.keyCode == _ENTER)
	{
		var sel = editor.document.selection;
		if (sel.type == 'Control')
		{
			return;
		}
		
		var r = sel.createRange();			
		if ((!CheckTag(r.parentElement(),'LI'))&&(!CheckTag(r.parentElement(),'H')))
		{
			r.pasteHTML('<br>');
			editor.event.cancelBubble = true; 
			editor.event.returnValue = false; 
			r.select();
			r.collapse(false);
			return false;
		}
	}
}

function Redo(editor,htmlmode) {
	editor.focus();
 	editor.document.execCommand('redo','',null);
}

function Cut(editor,htmlmode) {
	editor.focus();
	editor.document.execCommand('cut','',null);
}

function Italic(editor,htmlmode) { 
	Format(editor,htmlmode,'italic'); 
}

function Copy(editor,htmlmode) {
	editor.focus();
	editor.document.execCommand('copy','',null);
}

function Outdent(editor,htmlmode) { 
	Format(editor,htmlmode,'outdent'); 
}

function CreateLink(editor,htmlmode) {
	if (htmlmode) return;
	editor.focus();
    editor.document.execCommand('createlink','1',null);
}

function Unlink(editor,htmlmode) {
	if (htmlmode) return;
	editor.focus();
    editor.document.execCommand('unlink','1',null);
}

function JustifyRight(editor,htmlmode) { 
	Format(editor,htmlmode,'justifyright'); 
}

function NumberedList(editor,htmlmode) { 
	Format(editor,htmlmode,'insertorderedlist'); 
}

function InsertRule(editor,htmlmode) { 
	Format(editor,htmlmode,'inserthorizontalrule'); 
}

function Subscript(editor,htmlmode) { 
	Format(editor,htmlmode,'subscript'); 
}

function Indent(editor,htmlmode) { 
	Format(editor,htmlmode,'indent'); 
}

function Undo(editor,htmlmode) {
	editor.focus();
	editor.document.execCommand('undo','',null);
}

function SetFontForeColor(editor,htmlmode,name,value) {
	if (htmlmode) return;
	editor.focus();
	editor.document.execCommand('forecolor','',value);
}

function Paste(editor,htmlmode) {
	editor.focus();
	editor.document.execCommand('paste','',null);
}

function CopyHtmlToHidden(editor,hiddenHtml,htmlmode) {
	if (htmlmode) {
		hiddenHtml.value = editor.document.body.innerText;  
	} else {
		hiddenHtml.value = editor.document.body.innerHTML;  
	}
	if (hiddenHtml.value == '<P>&nbsp;</P>') {
		hiddenHtml.value = '';
	}
}
function Format(editor,htmlmode,format) {
	if (htmlmode) return; 
	editor.focus();
	editor.document.execCommand(format,'',null);
}	
function CheckTag(item,tagName) {
	if (item.tagName.search(tagName)!=-1) {
		return item;
	}
	if (item.tagName=='BODY') {
		return false;
	}
	item=item.parentElement;
	return CheckTag(item,tagName);
}
function CharBefore(sel) {
	if (sel.move('character',-1) == -1) {
		sel.expand('character');
		return sel.text;
	} else {
		return 'start';
	}
}
function CharAfter(sel) {
	var sel2 = sel;
	if (sel.expand('character')) {
		sel2.move('character',1);
		sel2.expand('character');
		return sel2.text;
	} else {
		return 'end';
	}
}
function CharBefore(r) {
	if (r.move('character',-1) == -1) {
		r.expand('character');
		return r.text;
	} else {
		return 'start';
	}
}
function CharAfter(r) {
	var r2 = r;
	if (r.expand('character')) {
		r2.move('character',1);
		r2.expand('character');
		return r2.text;
	} else {
		return 'end';
	}
}
function GetRangeReference(editor) {
	editor.focus();
	var objReference = null;
	var RangeType = editor.document.selection.type;
	var selectedRange = editor.document.selection.createRange();

	switch(RangeType) {
		case 'Control' :
			if (selectedRange.length > 0 )  {
				objReference = selectedRange.item(0);
			}
			break;

		case 'None' :
			objReference = selectedRange.parentElement();
			break;

		case 'Text' :
			objReference = selectedRange.parentElement();
			break;
	}
	return objReference
}
// ********************************************
// Style Functions
// ********************************************
function SetButtonStyle(buttonTD,style,checkstyle) {
	if (buttonTD == null) return;
	if (buttonTD.className != checkstyle)
		buttonTD.className = style;
}
function GetClassSubName(className) {
	underscore = className.indexOf("_");
	if (underscore < 0) return className;
	return className.substring(underscore+1);
}
function ButtonOver(theTD,imageOver,imageDown) {
	SetButtonStyle(theTD,'ButtonOver',null);
	if(theTD.children.length && theTD.children[0].tagName == "IMG" && imageOver){
		oldSrc = theTD.children[0].src;
		if (oldSrc.indexOf('.over.') == -1) {
			theTD.children[0].src=oldSrc.substring(0, oldSrc.length-4) + ".over.gif";
		}
	}
}
function ButtonOut(theTD,imageOver,imageDown) {
	SetButtonStyle(theTD,'ButtonNormal',null);
	document.body.style.cursor = 'default';
	if(theTD.children.length && theTD.children[0].tagName == "IMG"){
		oldSrc = theTD.children[0].src;
		if (oldSrc.indexOf('.over.') > 0) {
			theTD.children[0].src=oldSrc.substring(0, oldSrc.length-9) + ".gif";
		}
		if (oldSrc.indexOf('.down.') > 0) {
			theTD.children[0].src=oldSrc.substring(0, oldSrc.length-9) + ".gif";
		}
	}
}
function ButtonDown(theTD,imageOver,imageDown) {
	document.body.style.cursor = 'default';
	SetButtonStyle(theTD,'ButtonDown',null);
	if(theTD.children.length && theTD.children[0].tagName == "IMG" && imageDown == 1){
		oldSrc = theTD.children[0].src;
		if (oldSrc.indexOf('.over.') > 0) {
			theTD.children[0].src=oldSrc.substring(0, oldSrc.length-9) + ".down.gif";
		}
	}
}
function ButtonUp(theTD,imageOver,imageDown) {
	document.body.style.cursor = 'auto';
	SetButtonStyle(theTD,'ButtonDown',null);
	if(theTD.children.length && theTD.children[0].tagName == "IMG" && imageOver == 1){
		oldSrc = theTD.children[0].src;
		if (oldSrc.indexOf('.over.') == -1) {
			theTD.children[0].src=oldSrc.substring(0, oldSrc.length-4) + ".over.gif";
		}
	}
}
function SetActiveTab(theTD,editorname) {
	parentTR = theTD.parentElement;
	selectedTab = 1;
	totalButtons = parentTR.cells.length-1;
	for (var i=1;i< totalButtons;i++) {
		parentTR.cells[i].className = editorname + "_TabOffRight";
		if (theTD == parentTR.cells[i]) { selectedTab = i; }

	}

	if (selectedTab==1) {
		parentTR.cells[0].className = editorname + "_StartTabOn";
	} else {
		parentTR.cells[0].className = editorname + "_StartTabOff";
		parentTR.cells[selectedTab-1].className = editorname + "_TabOffLeft";
	}

	theTD.className = editorname + "_TabOn";
}
function TabOver() {
	document.body.style.cursor='default';
}
function TabOut() {
	document.body.style.cursor='auto';
}

function WordClean(editor,htmlmode) {
	editor.focus();
	// 0bject based cleaning
	var body = editor.document.body;
	for (var index = 0; index < body.all.length; index++) {
		tag = body.all[index];
		//if (tag.Attribute["className"].indexOf("mso") > -1)
		tag.removeAttribute("className","",0);
		tag.removeAttribute("style","",0);
	}

	// Regex based cleaning
	var html = editor.document.body.innerHTML;
	html = html.replace(/<o:p>&nbsp;<\/o:p>/g, "");
	html = html.replace(/o:/g, "");
	html = html.replace(/<st1:.*?>/g, "");

	// Final clean up of empty tags
	html = html.replace(/<font>/g, "");
	html = html.replace(/<span>/g, "");
	
	editor.document.body.innerHTML = html;

}

function BulletedList(editor,htmlmode) { 
	Format(editor,htmlmode,'insertunorderedlist'); 
}

function SetFontFace(editor,htmlmode,name,value) {
	if (htmlmode) return;
	editor.focus();
	editor.document.execCommand('fontname','',value);
}

function Underline(editor,htmlmode) { 
	Format(editor,htmlmode,'underline'); 
}

function Superscript(editor,htmlmode) { 
	Format(editor,htmlmode,'superscript'); 
}

function Bold(editor,htmlmode) { 
	Format(editor,htmlmode,'bold'); 
}

function onPaste() {			
}

function JustifyFull(editor,htmlmode) { 
	Format(editor,htmlmode,'justifyfull'); 
}

function JustifyCenter(editor,htmlmode) { 
	Format(editor,htmlmode,'justifycenter'); 
}

function JustifyLeft(editor,htmlmode) { 
	Format(editor,htmlmode,'justifyleft'); 
}

function RemoveFormat(editor,htmlmode) { 
	Format(editor,htmlmode,'removeFormat'); 
}
var imageEdit = false
function doImage() {
	var leftPos = (screen.availWidth-770) / 2
	var topPos = (screen.availHeight-660) / 2 
	imageWin = window.open(ScriptName + '?PATH='+Path,'','width=400,height=160,scrollbars=no,resizable=no,titlebar=0,top=' + topPos + ',left=' + leftPos);	
}
function image_set(linktext) {	
	editor.focus();
	
	img1= new Image(); 
	img1.src=(linktext); 
	
	var html = editor.document.body.innerHTML;
	if (img1.width > "400") {
		html = html + "<img src='" + linktext + "' border=0 width=400>";	
	} else {
		html = html + "<img src='" + linktext + "' border=0>";	
	}	
	editor.document.body.innerHTML = html;
}	
img_office2003_ButtonOverImage = new Image();
img_office2003_ButtonOverImage.src = "/images/editor/toolbarbutton.over.gif";
img_office2003_ButtonDownImage = new Image();
img_office2003_ButtonDownImage.src = "/images/editor/toolbarbutton.down.gif";
img_office2003_bold = new Image();
img_office2003_bold.src = "/images/editor/bold.gif";
img_office2003_italic = new Image();
img_office2003_italic.src = "/images/editor/italic.gif";
img_office2003_underline = new Image();
img_office2003_underline.src = "/images/editor/underline.gif";
img_office2003_strikethrough = new Image();
img_office2003_strikethrough.src = "/images/editor/strikethrough.gif";
img_office2003_superscript = new Image();
img_office2003_superscript.src = "/images/editor/superscript.gif";
img_office2003_subscript = new Image();
img_office2003_subscript.src = "/images/editor/subscript.gif";
img_office2003_removeformat = new Image();
img_office2003_removeformat.src = "/images/editor/removeformat.gif";
img_office2003_justifyleft = new Image();
img_office2003_justifyleft.src = "/images/editor/justifyleft.gif";
img_office2003_justifyright = new Image();
img_office2003_justifyright.src = "/images/editor/justifyright.gif";
img_office2003_justifycenter = new Image();
img_office2003_justifycenter.src = "/images/editor/justifycenter.gif";
img_office2003_justifyfull = new Image();
img_office2003_justifyfull.src = "/images/editor/justifyfull.gif";
img_office2003_bullets = new Image();
img_office2003_bullets.src = "/images/editor/bullets.gif";
img_office2003_numberedlist = new Image();
img_office2003_numberedlist.src = "/images/editor/numberedlist.gif";
img_office2003_indent = new Image();
img_office2003_indent.src = "/images/editor/indent.gif";
img_office2003_outdent = new Image();
img_office2003_outdent.src = "/images/editor/outdent.gif";
img_office2003_createlink = new Image();
img_office2003_createlink.src = "/images/editor/createlink.gif";
img_office2003_unlink = new Image();
img_office2003_unlink.src = "/images/editor/unlink.gif";
img_office2003_insertrule = new Image();
img_office2003_insertrule.src = "/images/editor/insertrule.gif";
img_office2003_cut = new Image();
img_office2003_cut.src = "/images/editor/cut.gif";
img_office2003_copy = new Image();
img_office2003_copy.src = "/images/editor/copy.gif";
img_office2003_paste = new Image();
img_office2003_paste.src = "/images/editor/paste.gif";
img_office2003_undo = new Image();
img_office2003_undo.src = "/images/editor/undo.gif";
img_office2003_redo = new Image();
img_office2003_redo.src = "/images/editor/redo.gif";
img_office2003_SpellCheck = new Image();
img_office2003_SpellCheck.src = "/images/editor/spellcheck.gif";
img_office2003_wordclean = new Image();
img_office2003_wordclean.src = "/images/editor/wordclean.gif";


function ieSpellCheck(editor,htmlmode) {
    if (htmlmode) return;
	try {
		var tspell = new ActiveXObject('ieSpell.ieSpellExtension');
		tspell.CheckAllLinkedDocuments(window.document);
	} catch (err){
		if (window.confirm('You need ieSpell to use spell check. Would you like to install it?')){window.open('http://www.iespell.com/download.php');};
	}
}

//에디터기 2개 삽입으로 추가된 스크립트
function onKeyDown_ParagraphBreak2() {
	editor2 = editor2;
	var _TAB = 9;
	var _ENTER = 13;
	var _QUOTE = 222;
	var _OPENCURLY = '&#8220;';
	var _CLOSECURLY = '&#8221;';
	
	if (editor2.event.keyCode == _TAB && editor2.event.ctrlKey) {
		//HtmlMode to DesignMode (Ctrl+TAB)
		if (HtmlMode && editor2.event.keyCode == _TAB && editor2.event.ctrlKey) {
			FTB_SetActiveTab(document.getElementById('DesignModeTab'));
			ChangeMode(editor2,document.getElementById('TempFrame'),'Toolbar',false,true);
		}
		//DesignMode to HtmlMode (Ctrl+TAB)
		if (!HtmlMode && editor2.event.keyCode == _TAB && editor2.event.ctrlKey) {
			FTB_SetActiveTab(document.getElementById('HtmlModeTab'));
			ChangeMode(editor2,document.getElementById('TempFrame'),'Toolbar',true,true);
		}
		HtmlMode = !HtmlMode;
	}
	if (editor2.event.keyCode == _QUOTE && editor2.event.shiftKey && !HtmlMode) {
		var sel = editor2.document.selection;
		if (sel.type == 'Control') return;
		var r = sel.createRange();
		var before = FTB_CharBefore(r);
		var after = FTB_CharAfter(r);
		var r = sel.createRange();

		if (before == 'start') {
			r.pasteHTML(_OPENCURLY);
			editor2.event.cancelBubble = true;
			editor2.event.returnValue = false;
			return false;
		} else if (before != ' ' && after == 'end') {
			r.pasteHTML(_CLOSECURLY);
			editor2.event.cancelBubble = true;
			editor2.event.returnValue = false;
			return false;
		} else if (before == ' ' && after == 'end') {
			r.pasteHTML(_OPENCURLY);
			editor2.event.cancelBubble = true;
			editor2.event.returnValue = false;
			return false;
		} else if (before != ' ' && after == ' ') {
			r.pasteHTML(_CLOSECURLY);
			editor2.event.cancelBubble = true;
			editor2.event.returnValue = false;
			return false;
		} else {
			r.pasteHTML(_OPENCURLY);
			editor2.event.cancelBubble = true;
			editor2.event.returnValue = false;
			return false;
		}
	}

	if (editor2.event.keyCode == _TAB) {
		editor2.event.cancelBubble = true;
		editor2.event.returnValue = false;
	}

	//check for Ctrl pressed.  Ctrl+Tab == switch modes.  Ctrl+Enter = <br>
	if ((HtmlMode && editor2.event.keyCode == _ENTER) || (!HtmlMode && editor2.event.ctrlKey && editor2.event.keyCode == _ENTER))
	{
		var sel = editor2.document.selection;
		if (sel.type == 'Control')
		{
			return;
		}
		
		var r = sel.createRange();			
		if ((!CheckTag(r.parentElement(),'LI'))&&(!CheckTag(r.parentElement(),'H')))
		{
			r.pasteHTML('<br>');
			editor2.event.cancelBubble = true; 
			editor2.event.returnValue = false; 
			r.select();
			r.collapse(false);
			return false;
		}
	}
	
	if (!HtmlMode && editor2.event.keyCode == _ENTER)
	{
		var sel = editor2.document.selection;
		if (sel.type == 'Control')
		{
			return;
		}
		
		var r = sel.createRange();			
		if ((!CheckTag(r.parentElement(),'LI'))&&(!CheckTag(r.parentElement(),'H')))
		{
			r.pasteHTML('<br>');
			editor2.event.cancelBubble = true; 
			editor2.event.returnValue = false; 
			r.select();
			r.collapse(false);
			return false;
		}
	}
}

var imageEdit = false
function doImage2() {
	var leftPos = (screen.availWidth-770) / 2
	var topPos = (screen.availHeight-660) / 2 
	imageWin = window.open(ScriptName2 + '?PATH='+Path,'','width=400,height=160,scrollbars=no,resizable=no,titlebar=0,top=' + topPos + ',left=' + leftPos);	
}
function image_set2(linktext) {	
	editor2.focus();
	
	img1= new Image(); 
	img1.src=(linktext); 
	
	var html = editor2.document.body.innerHTML;
	if (img1.width > "400") {
		html = html + "<img src='" + linktext + "' border=0 width=400>";	
	} else {
		html = html + "<img src='" + linktext + "' border=0>";	
	}	
	editor2.document.body.innerHTML = html;
}	
//에디터기 2개 삽입으로 추가된 스크립트 끝


//에디터기 3개 삽입으로 추가된 스크립트
function onKeyDown_ParagraphBreak3() {
	editor3 = editor3;
	var _TAB = 9;
	var _ENTER = 13;
	var _QUOTE = 222;
	var _OPENCURLY = '&#8220;';
	var _CLOSECURLY = '&#8221;';
	
	if (editor3.event.keyCode == _TAB && editor3.event.ctrlKey) {
		//HtmlMode to DesignMode (Ctrl+TAB)
		if (HtmlMode && editor3.event.keyCode == _TAB && editor3.event.ctrlKey) {
			FTB_SetActiveTab(document.getElementById('DesignModeTab'));
			ChangeMode(editor3,document.getElementById('TempFrame'),'Toolbar',false,true);
		}
		//DesignMode to HtmlMode (Ctrl+TAB)
		if (!HtmlMode && editor3.event.keyCode == _TAB && editor3.event.ctrlKey) {
			FTB_SetActiveTab(document.getElementById('HtmlModeTab'));
			ChangeMode(editor3,document.getElementById('TempFrame'),'Toolbar',true,true);
		}
		HtmlMode = !HtmlMode;
	}
	if (editor3.event.keyCode == _QUOTE && editor3.event.shiftKey && !HtmlMode) {
		var sel = editor3.document.selection;
		if (sel.type == 'Control') return;
		var r = sel.createRange();
		var before = FTB_CharBefore(r);
		var after = FTB_CharAfter(r);
		var r = sel.createRange();

		if (before == 'start') {
			r.pasteHTML(_OPENCURLY);
			editor3.event.cancelBubble = true;
			editor3.event.returnValue = false;
			return false;
		} else if (before != ' ' && after == 'end') {
			r.pasteHTML(_CLOSECURLY);
			editor3.event.cancelBubble = true;
			editor3.event.returnValue = false;
			return false;
		} else if (before == ' ' && after == 'end') {
			r.pasteHTML(_OPENCURLY);
			editor3.event.cancelBubble = true;
			editor3.event.returnValue = false;
			return false;
		} else if (before != ' ' && after == ' ') {
			r.pasteHTML(_CLOSECURLY);
			editor3.event.cancelBubble = true;
			editor3.event.returnValue = false;
			return false;
		} else {
			r.pasteHTML(_OPENCURLY);
			editor3.event.cancelBubble = true;
			editor3.event.returnValue = false;
			return false;
		}
	}

	if (editor3.event.keyCode == _TAB) {
		editor3.event.cancelBubble = true;
		editor3.event.returnValue = false;
	}

	//check for Ctrl pressed.  Ctrl+Tab == switch modes.  Ctrl+Enter = <br>
	if ((HtmlMode && editor3.event.keyCode == _ENTER) || (!HtmlMode && editor3.event.ctrlKey && editor3.event.keyCode == _ENTER))
	{
		var sel = editor3.document.selection;
		if (sel.type == 'Control')
		{
			return;
		}
		
		var r = sel.createRange();			
		if ((!CheckTag(r.parentElement(),'LI'))&&(!CheckTag(r.parentElement(),'H')))
		{
			r.pasteHTML('<br>');
			editor3.event.cancelBubble = true; 
			editor3.event.returnValue = false; 
			r.select();
			r.collapse(false);
			return false;
		}
	}
	
	if (!HtmlMode && editor3.event.keyCode == _ENTER)
	{
		var sel = editor3.document.selection;
		if (sel.type == 'Control')
		{
			return;
		}
		
		var r = sel.createRange();			
		if ((!CheckTag(r.parentElement(),'LI'))&&(!CheckTag(r.parentElement(),'H')))
		{
			r.pasteHTML('<br>');
			editor3.event.cancelBubble = true; 
			editor3.event.returnValue = false; 
			r.select();
			r.collapse(false);
			return false;
		}
	}
}

var imageEdit = false
function doImage3() {
	var leftPos = (screen.availWidth-770) / 2
	var topPos = (screen.availHeight-660) / 2 
	imageWin = window.open(ScriptName3 + '?PATH='+Path,'','width=400,height=160,scrollbars=no,resizable=no,titlebar=0,top=' + topPos + ',left=' + leftPos);	
}
function image_set3(linktext) {	
	editor3.focus();
	
	img1= new Image(); 
	img1.src=(linktext); 
	
	var html = editor3.document.body.innerHTML;
	if (img1.width > "400") {
		html = html + "<img src='" + linktext + "' border=0 width=400>";	
	} else {
		html = html + "<img src='" + linktext + "' border=0>";	
	}	
	editor3.document.body.innerHTML = html;
}	
//에디터기 3개 삽입으로 추가된 스크립트 끝

//에디터기 4개 삽입으로 추가된 스크립트
function onKeyDown_ParagraphBreak4() {
	editor4 = editor4;
	var _TAB = 9;
	var _ENTER = 13;
	var _QUOTE = 222;
	var _OPENCURLY = '&#8220;';
	var _CLOSECURLY = '&#8221;';
	
	if (editor4.event.keyCode == _TAB && editor4.event.ctrlKey) {
		//HtmlMode to DesignMode (Ctrl+TAB)
		if (HtmlMode && editor4.event.keyCode == _TAB && editor4.event.ctrlKey) {
			FTB_SetActiveTab(document.getElementById('DesignModeTab'));
			ChangeMode(editor4,document.getElementById('TempFrame'),'Toolbar',false,true);
		}
		//DesignMode to HtmlMode (Ctrl+TAB)
		if (!HtmlMode && editor4.event.keyCode == _TAB && editor4.event.ctrlKey) {
			FTB_SetActiveTab(document.getElementById('HtmlModeTab'));
			ChangeMode(editor4,document.getElementById('TempFrame'),'Toolbar',true,true);
		}
		HtmlMode = !HtmlMode;
	}
	if (editor4.event.keyCode == _QUOTE && editor4.event.shiftKey && !HtmlMode) {
		var sel = editor4.document.selection;
		if (sel.type == 'Control') return;
		var r = sel.createRange();
		var before = FTB_CharBefore(r);
		var after = FTB_CharAfter(r);
		var r = sel.createRange();

		if (before == 'start') {
			r.pasteHTML(_OPENCURLY);
			editor4.event.cancelBubble = true;
			editor4.event.returnValue = false;
			return false;
		} else if (before != ' ' && after == 'end') {
			r.pasteHTML(_CLOSECURLY);
			editor4.event.cancelBubble = true;
			editor4.event.returnValue = false;
			return false;
		} else if (before == ' ' && after == 'end') {
			r.pasteHTML(_OPENCURLY);
			editor4.event.cancelBubble = true;
			editor4.event.returnValue = false;
			return false;
		} else if (before != ' ' && after == ' ') {
			r.pasteHTML(_CLOSECURLY);
			editor4.event.cancelBubble = true;
			editor4.event.returnValue = false;
			return false;
		} else {
			r.pasteHTML(_OPENCURLY);
			editor4.event.cancelBubble = true;
			editor4.event.returnValue = false;
			return false;
		}
	}

	if (editor4.event.keyCode == _TAB) {
		editor4.event.cancelBubble = true;
		editor4.event.returnValue = false;
	}

	//check for Ctrl pressed.  Ctrl+Tab == switch modes.  Ctrl+Enter = <br>
	if ((HtmlMode && editor4.event.keyCode == _ENTER) || (!HtmlMode && editor4.event.ctrlKey && editor4.event.keyCode == _ENTER))
	{
		var sel = editor4.document.selection;
		if (sel.type == 'Control')
		{
			return;
		}
		
		var r = sel.createRange();			
		if ((!CheckTag(r.parentElement(),'LI'))&&(!CheckTag(r.parentElement(),'H')))
		{
			r.pasteHTML('<br>');
			editor4.event.cancelBubble = true; 
			editor4.event.returnValue = false; 
			r.select();
			r.collapse(false);
			return false;
		}
	}
	
	if (!HtmlMode && editor4.event.keyCode == _ENTER)
	{
		var sel = editor4.document.selection;
		if (sel.type == 'Control')
		{
			return;
		}
		
		var r = sel.createRange();			
		if ((!CheckTag(r.parentElement(),'LI'))&&(!CheckTag(r.parentElement(),'H')))
		{
			r.pasteHTML('<br>');
			editor4.event.cancelBubble = true; 
			editor4.event.returnValue = false; 
			r.select();
			r.collapse(false);
			return false;
		}
	}
}

var imageEdit = false
function doImage4() {
	var leftPos = (screen.availWidth-770) / 2
	var topPos = (screen.availHeight-660) / 2 
	imageWin = window.open(ScriptName4 + '?PATH='+Path,'','width=400,height=160,scrollbars=no,resizable=no,titlebar=0,top=' + topPos + ',left=' + leftPos);	
}
function image_set4(linktext) {	
	editor4.focus();
	
	img1= new Image(); 
	img1.src=(linktext); 
	
	var html = editor4.document.body.innerHTML;
	if (img1.width > "400") {
		html = html + "<img src='" + linktext + "' border=0 width=400>";	
	} else {
		html = html + "<img src='" + linktext + "' border=0>";	
	}	
	editor4.document.body.innerHTML = html;
}	
//에디터기 4개 삽입으로 추가된 스크립트 끝

//에디터기 5개 삽입으로 추가된 스크립트
function onKeyDown_ParagraphBreak5() {
	editor5 = editor5;
	var _TAB = 9;
	var _ENTER = 13;
	var _QUOTE = 222;
	var _OPENCURLY = '&#8220;';
	var _CLOSECURLY = '&#8221;';
	
	if (editor5.event.keyCode == _TAB && editor5.event.ctrlKey) {
		//HtmlMode to DesignMode (Ctrl+TAB)
		if (HtmlMode && editor5.event.keyCode == _TAB && editor5.event.ctrlKey) {
			FTB_SetActiveTab(document.getElementById('DesignModeTab'));
			ChangeMode(editor5,document.getElementById('TempFrame'),'Toolbar',false,true);
		}
		//DesignMode to HtmlMode (Ctrl+TAB)
		if (!HtmlMode && editor5.event.keyCode == _TAB && editor5.event.ctrlKey) {
			FTB_SetActiveTab(document.getElementById('HtmlModeTab'));
			ChangeMode(editor5,document.getElementById('TempFrame'),'Toolbar',true,true);
		}
		HtmlMode = !HtmlMode;
	}
	if (editor5.event.keyCode == _QUOTE && editor5.event.shiftKey && !HtmlMode) {
		var sel = editor5.document.selection;
		if (sel.type == 'Control') return;
		var r = sel.createRange();
		var before = FTB_CharBefore(r);
		var after = FTB_CharAfter(r);
		var r = sel.createRange();

		if (before == 'start') {
			r.pasteHTML(_OPENCURLY);
			editor5.event.cancelBubble = true;
			editor5.event.returnValue = false;
			return false;
		} else if (before != ' ' && after == 'end') {
			r.pasteHTML(_CLOSECURLY);
			editor5.event.cancelBubble = true;
			editor5.event.returnValue = false;
			return false;
		} else if (before == ' ' && after == 'end') {
			r.pasteHTML(_OPENCURLY);
			editor5.event.cancelBubble = true;
			editor5.event.returnValue = false;
			return false;
		} else if (before != ' ' && after == ' ') {
			r.pasteHTML(_CLOSECURLY);
			editor5.event.cancelBubble = true;
			editor5.event.returnValue = false;
			return false;
		} else {
			r.pasteHTML(_OPENCURLY);
			editor5.event.cancelBubble = true;
			editor5.event.returnValue = false;
			return false;
		}
	}

	if (editor5.event.keyCode == _TAB) {
		editor5.event.cancelBubble = true;
		editor5.event.returnValue = false;
	}

	//check for Ctrl pressed.  Ctrl+Tab == switch modes.  Ctrl+Enter = <br>
	if ((HtmlMode && editor5.event.keyCode == _ENTER) || (!HtmlMode && editor5.event.ctrlKey && editor5.event.keyCode == _ENTER))
	{
		var sel = editor5.document.selection;
		if (sel.type == 'Control')
		{
			return;
		}
		
		var r = sel.createRange();			
		if ((!CheckTag(r.parentElement(),'LI'))&&(!CheckTag(r.parentElement(),'H')))
		{
			r.pasteHTML('<br>');
			editor5.event.cancelBubble = true; 
			editor5.event.returnValue = false; 
			r.select();
			r.collapse(false);
			return false;
		}
	}
	
	if (!HtmlMode && editor5.event.keyCode == _ENTER)
	{
		var sel = editor5.document.selection;
		if (sel.type == 'Control')
		{
			return;
		}
		
		var r = sel.createRange();			
		if ((!CheckTag(r.parentElement(),'LI'))&&(!CheckTag(r.parentElement(),'H')))
		{
			r.pasteHTML('<br>');
			editor5.event.cancelBubble = true; 
			editor5.event.returnValue = false; 
			r.select();
			r.collapse(false);
			return false;
		}
	}
}

var imageEdit = false
function doImage5() {
	var leftPos = (screen.availWidth-770) / 2
	var topPos = (screen.availHeight-660) / 2 
	imageWin = window.open(ScriptName5 + '?PATH='+Path,'','width=400,height=160,scrollbars=no,resizable=no,titlebar=0,top=' + topPos + ',left=' + leftPos);	
}
function image_set5(linktext) {	
	editor5.focus();
	
	img1= new Image(); 
	img1.src=(linktext); 
	
	var html = editor5.document.body.innerHTML;
	if (img1.width > "400") {
		html = html + "<img src='" + linktext + "' border=0 width=400>";	
	} else {
		html = html + "<img src='" + linktext + "' border=0>";	
	}	
	editor5.document.body.innerHTML = html;
}	
//에디터기 5개 삽입으로 추가된 스크립트 끝

//에디터기 6개 삽입으로 추가된 스크립트
function onKeyDown_ParagraphBreak6() {
	editor6 = editor6;
	var _TAB = 9;
	var _ENTER = 13;
	var _QUOTE = 222;
	var _OPENCURLY = '&#8220;';
	var _CLOSECURLY = '&#8221;';
	
	if (editor6.event.keyCode == _TAB && editor6.event.ctrlKey) {
		//HtmlMode to DesignMode (Ctrl+TAB)
		if (HtmlMode && editor6.event.keyCode == _TAB && editor6.event.ctrlKey) {
			FTB_SetActiveTab(document.getElementById('DesignModeTab'));
			ChangeMode(editor6,document.getElementById('TempFrame'),'Toolbar',false,true);
		}
		//DesignMode to HtmlMode (Ctrl+TAB)
		if (!HtmlMode && editor6.event.keyCode == _TAB && editor6.event.ctrlKey) {
			FTB_SetActiveTab(document.getElementById('HtmlModeTab'));
			ChangeMode(editor6,document.getElementById('TempFrame'),'Toolbar',true,true);
		}
		HtmlMode = !HtmlMode;
	}
	if (editor6.event.keyCode == _QUOTE && editor6.event.shiftKey && !HtmlMode) {
		var sel = editor6.document.selection;
		if (sel.type == 'Control') return;
		var r = sel.createRange();
		var before = FTB_CharBefore(r);
		var after = FTB_CharAfter(r);
		var r = sel.createRange();

		if (before == 'start') {
			r.pasteHTML(_OPENCURLY);
			editor6.event.cancelBubble = true;
			editor6.event.returnValue = false;
			return false;
		} else if (before != ' ' && after == 'end') {
			r.pasteHTML(_CLOSECURLY);
			editor6.event.cancelBubble = true;
			editor6.event.returnValue = false;
			return false;
		} else if (before == ' ' && after == 'end') {
			r.pasteHTML(_OPENCURLY);
			editor6.event.cancelBubble = true;
			editor6.event.returnValue = false;
			return false;
		} else if (before != ' ' && after == ' ') {
			r.pasteHTML(_CLOSECURLY);
			editor6.event.cancelBubble = true;
			editor6.event.returnValue = false;
			return false;
		} else {
			r.pasteHTML(_OPENCURLY);
			editor6.event.cancelBubble = true;
			editor6.event.returnValue = false;
			return false;
		}
	}

	if (editor6.event.keyCode == _TAB) {
		editor6.event.cancelBubble = true;
		editor6.event.returnValue = false;
	}

	//check for Ctrl pressed.  Ctrl+Tab == switch modes.  Ctrl+Enter = <br>
	if ((HtmlMode && editor6.event.keyCode == _ENTER) || (!HtmlMode && editor6.event.ctrlKey && editor6.event.keyCode == _ENTER))
	{
		var sel = editor6.document.selection;
		if (sel.type == 'Control')
		{
			return;
		}
		
		var r = sel.createRange();			
		if ((!CheckTag(r.parentElement(),'LI'))&&(!CheckTag(r.parentElement(),'H')))
		{
			r.pasteHTML('<br>');
			editor6.event.cancelBubble = true; 
			editor6.event.returnValue = false; 
			r.select();
			r.collapse(false);
			return false;
		}
	}
	
	if (!HtmlMode && editor6.event.keyCode == _ENTER)
	{
		var sel = editor6.document.selection;
		if (sel.type == 'Control')
		{
			return;
		}
		
		var r = sel.createRange();			
		if ((!CheckTag(r.parentElement(),'LI'))&&(!CheckTag(r.parentElement(),'H')))
		{
			r.pasteHTML('<br>');
			editor6.event.cancelBubble = true; 
			editor6.event.returnValue = false; 
			r.select();
			r.collapse(false);
			return false;
		}
	}
}

var imageEdit = false
function doImage6() {
	var leftPos = (screen.availWidth-770) / 2
	var topPos = (screen.availHeight-660) / 2 
	imageWin = window.open(ScriptName6 + '?PATH='+Path,'','width=400,height=160,scrollbars=no,resizable=no,titlebar=0,top=' + topPos + ',left=' + leftPos);	
}
function image_set6(linktext) {	
	editor6.focus();
	
	img1= new Image(); 
	img1.src=(linktext); 
	
	var html = editor5.document.body.innerHTML;
	if (img1.width > "400") {
		html = html + "<img src='" + linktext + "' border=0 width=400>";	
	} else {
		html = html + "<img src='" + linktext + "' border=0>";	
	}	
	editor6.document.body.innerHTML = html;
}	
//에디터기 6개 삽입으로 추가된 스크립트 끝