// IE6 PNG IMAGE SET
function setPng24(obj) {
    obj.width=obj.height=1;
    obj.className=obj.className.replace(/\bpng24\b/i,'');
    obj.style.filter ="progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+ obj.src +"',sizingMethod='image');"
    obj.src='';
    return '';
}

//<!-- 플래쉬 -->
function flash(c,d,e,f) {
	var flash_tag = "";
	flash_tag = '<embed src="'+e+'" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" ';
	flash_tag +='type="application/x-shockwave-flash" wmode="transparent" title="'+f+'" width="'+c+'" height="'+d+'"></embed>'

	document.write(flash_tag);

}

/**= img over set2:start =**/
function setOverImg(id,idx) {
	if (!document.getElementById(id)) {
		return false;
	}

	var obj = document.getElementById(id);
	var objChild = obj.getElementsByTagName("div");
	var objChildCount = objChild.length;

	for ( i = 0; i < objChildCount; i++ ) {
		var aTag = objChild[i].getElementsByTagName("a");

				aTag[idx].onmouseover = function () {
					var imgTag = this.getElementsByTagName("img");
					var oldImg = imgTag[0].getAttribute("src");
					imgTag[0].src = oldImg.replace("_off.gif", "_on.gif");

					return false;
				}

				aTag[idx].onmouseout = function () {
					var imgTag = this.getElementsByTagName("img");
					var oldImg = imgTag[0].getAttribute("src");
					imgTag[0].src = oldImg.replace("_on.gif", "_off.gif");

					return false;
				}
	}
}

//-- 탭 over, out :start
function tabOver(tname,_objnum){
	document.getElementById(tname+"s"+_objnum).src="/images/main/"+tname+"0"+_objnum+"_on.gif";
}
function tabOut(tname, _objnum){
	document.getElementById(tname+"s"+_objnum).src="/images/main/"+tname+"0"+_objnum+".gif";
}

function initNavigation(seq) {
	 nav = document.getElementById("topul");
	 nav.menu = new Array(); 
	 nav.current = null;
	 nav.menuseq = 0;
	 navLen = nav.childNodes.length;	
	
	 allA = nav.getElementsByTagName("a") // 1Depth 메뉴 담기
	 //alert(allI);
	 for(k = 0; k < allA.length; k++) {  // allA(1Depth갯수)
 
				allA.item(k).onmouseover = allA.item(k).onfocus = function () { //1Depth에 포커스가 왔을때 해당 1Depth에 onmouseover 준다
					nav.isOver = true;  //isOver = 마우스의 위치를 감지하는 필드 > 마우스 포인터가 어느 위치 위에 놓였을 때 true 값 발생							
				}
				allA.item(k).onmouseout = allA.item(k).onblur = function () { //1Depth에서 마우스가 벗어났을 때 1Depth에 onmouseout 준다
					nav.isOver = false; //마우스 포인터가 해당 위치 위가 아니기 때문에 false	
					setTimeout(function () {

						if (nav.isOver == false) {
							if (nav.menu[seq])
								nav.menu[seq].onmouseover();
							else if(nav.current) {						
								if (nav.current.submenu)
									nav.current.submenu.style.display = "none";
								nav.current = null;
							}
						}
					}, 500);
				} // allA.item(k)
					
	} //for

	for (i = 0; i < navLen; i++) { 
		navItem = nav.childNodes.item(i);
		
		if (navItem.tagName != "LI") continue;
		navAnchor = navItem.getElementsByTagName("a").item(0);  
		navAnchor.submenu = navItem.getElementsByTagName("ul").item(0);  				
   
		navAnchor.onmouseover = navAnchor.onfocus = function () { 
			if (nav.current) {
				if (nav.current.submenu)	nav.current.submenu.style.display = "none";
				nav.current = null;
			}
			if (nav.current != this) {
				if (this.submenu)	this.submenu.style.display = "block";
				nav.current = this;
			}
			nav.isOver = true;
		}
		nav.menuseq++;
		nav.menu[nav.menuseq] = navAnchor;
	}
	if (nav.menu[seq])	
		nav.menu[seq].onmouseover(); 
		
	if (seq != '0' && seq != '8' && seq != '9' && seq != '10'){
		document.getElementById("tmon"+seq).src="/images/common/t_menu"+seq+"_on.gif"; 
		document.getElementById("tm"+seq).className = "tmon";
	}
} 


var Mona="";
function msinit(Mnum){
	document.getElementById("tmon"+Mnum).src="/images/common/t_menu"+Mnum+"_on.gif";
	Mona=Mnum;
}
function msover(num){
if(num!=Mona){
	document.getElementById("tmon"+num).src="/images/common/t_menu"+num+"_on.gif";
	}
}
function msout(num){
if(num!=Mona){
	document.getElementById("tmon"+num).src="/images/common/t_menu"+num+".gif";
	}
}


function popData(src,target,alt,imgpath){
 	this.src = src;
  	this.target = target;
  	this.alt = alt;
  	this.imgpath = imgpath;
}

var popAniCnt = 0 ;
var iv = null;
var popAniInterval = 10000;  // ·
var imgData = new Array();
function showPopImages(num) {

  var popLink = document.getElementById("popLink");
  var popImages = document.getElementById("popImg");
  popLink.href=imgData[num].src;
  popLink.target=imgData[num].target;
  popImages.src= "/upload/POPUP/"+imgData[num].imgpath;
  popImages.alt=imgData[num].alt
  for(i=0;i<imgData.length;i++) {
  var btn = document.getElementById("popNum" + (i+1));
    if(i == num) {
      btn.src="images/main/btn_zone"+(i+1)+"_on.gif";
    }
    else {
      btn.src="images/main/btn_zone"+(i+1)+"_off.gif";
    }

  }
}

function animatePopup(){
  popAniCnt = 0;
  if(iv) window.clearInterval(iv);
  iv = window.setInterval("showAnimate()",popAniInterval);
}
function showAnimate() {
  showPopImages((popAniCnt++)%imgData.length);
}
function stopAnimatePopup(){
  if(iv) window.clearInterval(iv);
}