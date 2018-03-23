function ecatalog(docu, kd, dir, resize){
	if(screen.width < 800){
		alert("The screen resolution should be over 800*600");
		return;
	}

	var x = screen.width;
	var y = screen.height;
	var wname = "ecatalog";

	if(kd == "fixed"){
		x = 1024;
		y = 768;
		wname = "fixed_ecatalog";
	}
	else if(screen.width > 2880 || screen.height > 2880){
		x = 2880;
		y = 2880;
	}

	x = x - 10;
	y = y - 58;

	if(resize == undefined || resize == "") resize = "yes";

	property = "toolbar=no,location=no,directories=no,status=no,menubar=no,resizable=" + resize + ",scrollbars=no,copyhistory=no,";
	property += "width=" + x + ",height=" + y + ",left=" + 0 + ",top=" + 0;

	if(docu == "/") docu = "";
	ecawin = window.open(docu+"/ecatalog" +dir + ".html", wname, property);
}

function cataview(w, h, dir, param, server, fullscreen){
	var fsrc = server + "main.swf?Dir=" + dir + "&w=" + w + "&h=" + h;
	divflash.innerHTML = getJsCode("cataSwf", fsrc, param, 2880, 2880, false, "#FFFFFF", fullscreen);
}
function cataviewFireFox(w, h, dir, param, server, fullscreen){
	var fsrc = server + "main.swf?Dir=" + dir + "&w=" + w + "&h=" + h;
	divflash.innerHTML = getJsCodeFireFox("cataSwf", fsrc, param, 2880, 2880, false, "#FFFFFF", fullscreen);
}

function autoSizeswfView(fid, fsrc, param, server, w, h, fullscreen){
	divflash.innerHTML = getJsCode(fid, server+fsrc, param, w, h, false, "#FFFFFF", fullscreen);
}
function autoSizeswfViewFireFox(fid, fsrc, param, server, w, h, fullscreen){
	divflash.innerHTML = getJsCodeFireFox(fid, server+fsrc, param, w, h, false, "#FFFFFF", fullscreen);
}

function swfView(fid, fsrc, param, w, h, transp, color, fullscreen){
	document.write(getJsCode(fid, fsrc, param, w, h, transp, color, fullscreen));
}
function swfViewFireFox(fid, fsrc, param, w, h, transp, color, fullscreen){
	document.write(getJsCodeFireFox(fid, fsrc, param, w, h, transp, color, fullscreen));
}

function getJsCode(fid, fsrc, param, w, h, transp, color, fullscreen){
	var str = "<object id=\"" + fid + "\" classid=\"clsid:d27cdb6e-ae6d-11cf-96b8-444553540000\" ";
	str += " width=\"" + w + "\" height=\"" + h + "\" align=\"middle\">\n";
	str += "<param name=\"allowScriptAccess\" value=\"always\">\n";
	str += "<param name=\"allowFullScreen\" value=\"" + fullscreen + "\">\n";
	if(transp == true) str += "<param name=\"wmode\" value=\"transparent\">\n";
	str += "<param name=\"movie\" value=\"" + fsrc + "\">\n";
	str += "<param name=\"quality\" value=\"high\">\n";
	str += "<param name=\"bgcolor\" value=\"" + color + "\">\n";
	str += "<param name=\"flashVars\" value=\"" + param + "\">\n";
	str += "<embed name=\"" + fid + "\" src=\"" + fsrc + "\" flashVars=\"" + param + "\" quality=\"high\" bgcolor=\"" + color + "\" width=\"" + w + "\" height=\"" + h + "\" ";
	str += "allowScriptAccess=\"always\" allowFullScreen=\"" + fullscreen + "\" type=\"application/x-shockwave-flash\" pluginspage=\"http://www.macromedia.com/go/getflashplayer\">\n";
	str += "</object>\n";
	return str;
}

function getJsCodeFireFox(fid, fsrc, param, w, h, transp, color, fullscreen){
	var str = "<embed id=\"" + fid + "\" src=\"" + fsrc + "\" flashVars=\"" + param + "\" quality=\"high\" bgcolor=\"" + color + "\" width=\"" + w + "\" height=\"" + h + "\" "
	str += "allowScriptAccess=\"always\" allowFullScreen=\"" + fullscreen + "\" type=\"application/x-shockwave-flash\" pluginspage=\"http://www.macromedia.com/go/getflashplayer\">\n";
	return str;
}

function newLink(winSet, width, height, docu){		// link from swf
	if(winSet == 1){
		property = "toolbar=no,location=no,directories=no,status=no,menubar=no,resizable=no,scrollbars=no,copyhistory=no,";
		property += "width=" + width +", height=" + height + ", left=1, top=1";
		window.open(docu, '', property);
	}
	else{	
		property = "toolbar=no,location=no,directories=no,status=no,menubar=no,resizable=no,scrollbars=yes,copyhistory=no,";
		property += "width=" + width +", height=" + height + ", left=1, top=1";
		window.open(docu, '', property);
	}
}

function simpleLink(docu, kd){
	if(kd == 1){
		window.location = docu;
	}
	else if(kd == 2){
		parent.location = docu;
	}
	else if(kd == 3){
		window.open(docu, '');
	}
	else if(kd == 4){
		opener.location = docu;
	}
}

var divArray = new Array("","tm_general","tm_design","tm_link","tm_file","tm_addon","tm_admin");
var divLen = 7;
var currDiv = 0;

function showeMenu(n){
	if(currDiv == n) return;
	if(currDiv > 0) document.all[divArray[currDiv]].style.visibility = "hidden";
	if(n > 0) document.all[divArray[n]].style.visibility = "visible";

	currDiv = n;
}
function swap_image(obj, fname, kd){
   	obj.src = (kd == 0) ? "pix/menu" + fname + "-s.gif" : "pix/menu" + fname + ".gif";
}

function cswap(num, kd){
	if(kd == 0) document.all['trx'+num].style.backgroundColor = "D2F5FF";
	else document.all['trx'+num].style.backgroundColor = "FFFFFF";
}

function swap_style(obj, tdclass, alinkobj, alinkclass){
   	obj.className = tdclass;
   	document.all[alinkobj].className = alinkclass;
}

function trimVal(str){
	if(str == "") return "";

	var strsum = "";
	var len = str.length;
	for(var i = 0;i < len;i++){
		var Temp = str.charAt(i);
		if(Temp != ' ' && Temp != '\n' && Temp != '\r')
			strsum += Temp;
	}

	return strsum;
}

function isNotnum(str){
	var len = str.length;
	for(var i = 0;i < len;i++){
		var Jstr = str.charAt(i);
		if(Jstr < "0" || Jstr > "9") return false;
	}
	return true;
}

function newWindow(winSet,docu,width,height,left,top,winname){
	if(winSet == 1)
	    property = "toolbar=yes,location=no,directories=no,status=yes,menubar=no,resizable=no,scrollbars=yes,copyhistory=no,";
	else if(winSet == 2)
		property = "toolbar=no,location=no,directories=no,status=no,menubar=no,resizable=no,scrollbars=no,copyhistory=no,";
	else if(winSet == 3)
		property = "toolbar=no,location=no,directories=no,status=no,menubar=no,resizable=no,scrollbars=yes,copyhistory=no,";

	property += "width=" + width +",height=" + height + ",left=" + left + ",top=" + top;
	return window.open(docu,winname,property);
}
