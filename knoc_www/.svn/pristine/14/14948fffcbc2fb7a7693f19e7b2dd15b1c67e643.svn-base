/******** 체크 박스 관련 자바스크립트 **********/

//  체크 박스 전체 선택 또는 전체 취소
//  formName : 폼 (ex : document.form1)
//  chkName : 체크박스 이름
var chkAllState = "";
function selectChkAll(formName, chkName) {

    var ff = formName;

    for (var i=0; i<ff.elements.length; i++) {
        if (ff.elements[i].type=="checkbox" && ff.elements[i].name== chkName) {
            if (chkAllState==1) ff.elements[i].checked = false;
            else ff.elements[i].checked = true;
        }
    }
    if (chkAllState==1) {
        chkAllState = 0;
        //document.all("lblSelectID").innerHTML = "선택";     
    } else  {
        chkAllState = 1;
        //document.all("lblSelectID").innerHTML = "취소";     
    }
}	

//  체크박스에 선택한 것이 있는지 없는지의 여부
//  삭제시에 사용
function isSelect(formName, chkName) {

    var ff = formName;
    for (var i=0; i<ff.elements.length; i++) {
        if (ff.elements[i].type=="checkbox" && ff.elements[i].name== chkName) {
            if (ff.elements[i].checked) return true;
        }
    }
    return false;
}	

//  체크박스에 선택한 것이 몇개인지 리턴
//  삭제시에 사용
function intSelect(formName, chkName) {

    var ff = formName;
    var result = 0;
    for (var i=0; i<ff.elements.length; i++) {
        if (ff.elements[i].type=="checkbox" && ff.elements[i].name== chkName) {
            if (ff.elements[i].checked) result++;
        }
    }
    return result;
}	

function getCookie( name )
{
	var nameOfCookie = name + "=";
	var x = 0;
	while ( x <= document.cookie.length )
	{
		var y = (x+nameOfCookie.length);
		if ( document.cookie.substring( x, y ) == nameOfCookie )
		{
			if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 )
				endOfCookie = document.cookie.length;
			return unescape( document.cookie.substring( y, endOfCookie ) );
		}
		x = document.cookie.indexOf( " ", x ) + 1;
		if ( x == 0 )
			break;
	}
	return "";
}
 

function setCookie( name, value, expiredays )
{
	var todayDate = new Date();

	todayDate.setDate( todayDate.getDate() + expiredays );

	document.cookie = name + "=" + escape( value ) + "; path=/; domain=knoc.co.kr; expires=" + todayDate.toGMTString() +";" 

}


// JScript 파일
var zoomRate = 20;
var maxRate = 200;
var minRate = 100;
var curRate = 100;
function zoomInOut(contentid, how)
{
	var bIE = false;
  if (bIE && (
  			((how == "in")&&(curRate >= maxRate)) ||
  			((how == "out") && (curRate <= minRate))
  	) ) {
    return;   /* 범위 초과시 리턴한다 */
  }
  if (how == "in") {
  	if(bIE) {
    	curRate = curRate + zoomRate;
    	document.body.style.zoom = curRate + '%';	/* 화면 확대 */
    }
    else {
    	scaleFont(+1);
    }
  }
  else if (how == "def"){
  	if(bIE) {
  		document.body.style.zoom = 1;
  		curRate = 100;
  	}
  	else {
  		scaleFont(0);
	  }	
	}
	else{
		if(bIE) {
    	curRate = curRate + (-1)*zoomRate;
    	document.body.style.zoom = curRate + '%';	/* 화면 축소 */
    }
    else {
			scaleFont(-1);
    }
  }
}


var fSize = 11;
function scaleFont( n )
{
		if(n == 0) fSize = 12;
		else fSize = fSize + n;
		if(fSize > 20) { fSize = 20; return; }
		if(fSize < 11) { fSize = 11; return; }
    var objTd = document.getElementsByTagName( "td" );// <td>, <TD>의 내용을 모두 읽어옴
		var objSpan = document.getElementsByTagName( "span" );
		var objA = document.getElementsByTagName( "a" );
		var objP = document.getElementsByTagName( "p" );
		//var objFont = document.getElementsByTagName( "font" );
    for( i=0; i < objTd.length; i++ )
    {
          objTd[i].style.fontSize = fSize + "px";
          if(fSize > 15) 
						objTd[i].style.lineHeight = "1.5";
    }
    for( i=0; i < objSpan.length; i++ )
    {
          objSpan[i].style.fontSize = fSize + "px";
          if(fSize > 15) 
						objSpan[i].style.lineHeight = "1.5";
    }
    for( i=0; i < objA.length; i++ )
    {
          objA[i].style.fontSize = fSize + "px";
          if(fSize > 15) 
						objA[i].style.lineHeight = "1.5";
    }
		for( i=0; i < objP.length; i++ )
    {
          objP[i].style.fontSize = fSize + "px";
          if(fSize > 15) 
						objP[i].style.lineHeight = "1.5";
    }
    /*for( i=0; i < objFont.length; i++ )
    {
          objFont[i].style.fontSize = fSize + "px";
          if(fSize > 15) 
						objFont[i].style.lineHeight = "1.5";
    }*/
}


// 프린트
function contentPrint() {
    var windowLeft = (screen.width-640)/2;
    var windowTop = (screen.height-480)/2;

    var printURL = "/include/forPrint.jsp";

    window.open(printURL,"print",'width=825, height=600, menubar=yes, scrollbars=yes,status=no,resizable=yes,top=' + windowTop + ',left=' + windowLeft + '');
}