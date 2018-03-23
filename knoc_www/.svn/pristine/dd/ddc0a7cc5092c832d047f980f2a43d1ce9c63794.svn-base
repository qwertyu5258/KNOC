//Element ID 불러쓰기
function dEI(elementID){
	return document.getElementById(elementID);
}





/* 메뉴 및 탭게시판 스크립트 */
function onNavi(viewNum,gubun,catagoryNum){

	 if (gubun=="tabBoard")
	{
		var strLiClass="T0";
	}else if (gubun=="top_navi")
	{
		var strLiClass="E0";
	}else if (gubun=="oil_price")
	{
		var strLiClass="P0";
	}else if (gubun=="domestic_price")
	{
		var strLiClass="D0";
	}else if (gubun=="inter_price")
	{
		var strLiClass="I0";
	}


	for(var i =1;i<catagoryNum+1; i++){
		var onList=dEI(strLiClass+i);
		var onImg=onList.getElementsByTagName("img").item(0);
		
		if(onImg){

			if(i==viewNum){
				onList.className="on";
				var ImgCheck = onImg.src.substring(onImg.src.length-8,onImg.src.length);
				if (ImgCheck!="over.gif") {
					onImg.src = onImg.src.replace(".gif", "over.gif");
				}
			}else{
				onList.className="off";
					if (ImgCheck="over.gif") {
					onImg.src = onImg.src.replace("over.gif", ".gif");
				}
			}

		}
	}
}

function onNavi2(viewNum,gubun,catagoryNum){

	 if (gubun=="tabBoard")
	{
		var strLiClass="T0";
	}else if (gubun=="top_navi")
	{
		var strLiClass="E0";
	}else if (gubun=="oil_price")
	{
		var strLiClass="P0";
	}else if (gubun=="domestic_price")
	{
		var strLiClass="D0";
	}else if (gubun=="inter_price")
	{
		var strLiClass="I0";
	}

	for(var i =1;i<catagoryNum+1; i++){
		var onList=dEI(strLiClass+i);

		if(i==viewNum){
			onList.className="on";
		}else{
			onList.className="off";
		}
	}
}

function outNavi (outNum) {
	var strLiClass="E0";
	var outImg=dEI(strLiClass+outNum);
	var onList=dEI(strLiClass+outNum);
	var onImg=onList.getElementsByTagName("img").item(0);

	outImg.className="off";
	onImg.src = onImg.src.replace("over.gif", ".gif");
}




// 왼쪽메뉴 이미지 롤오버
function imgRollover(imgBoxID){


	var MenuCounts = dEI(imgBoxID).getElementsByTagName("img");
	for (i=0;i<MenuCounts.length;i++) {

		var numImg=MenuCounts.item(i);
		var ImgCheck = numImg.src.substring(numImg.src.length-6,numImg.src.length);

		if (ImgCheck!="on.gif") {
				numImg.onmouseover = function () {
					this.src = this.src.replace(".gif", "over.gif");
				}
				numImg.onfocus = function () {
					this.src = this.src.replace(".gif", "over.gif");
				}

				numImg.onmouseout = function () {
					this.src = this.src.replace("over.gif", ".gif");
				}
				numImg.onblur = function () {
					this.src = this.src.replace("over.gif", ".gif");
				}
			}
	}
}




//팝업존

var bannerTime;
//var banner_var = 1;
var overMouse = true;
var n_pre_process = true;
//var bottomBanner = true;
var loop = 1;


function overImage(){
	overMouse=false;
}

function outImage(){
	overMouse=true;
}

//다시 시작
function pop_start(){
	n_pre_process = true;
}

//정지
function pop_stop(){
	n_pre_process = false;
}

function scrolling(){
	if(overMouse && n_pre_process){
		var objName = "pop" + loop;
		var viewObjName = "pop_no0" + loop;

		var obj = document.getElementById(objName);
		var viewObj = document.getElementById(viewObjName);
		if(viewObj != null ){
			viewObj.style.display = 'block';
			obj.src = "/images/2013/pop_no0"+loop+"_on.gif";

			for(var i = 1; i <= LoopCnt; i++){
				if(i == loop) continue;

				var tmpobjName = "pop" + i;
				var tmpviewObjName = "pop_no0" + i;

				var tmpobj = document.getElementById(tmpobjName);
				var tmpviewObj = document.getElementById(tmpviewObjName);

				tmpviewObj.style.display = 'none';
				tmpobj.src = "/images/2013/pop_no0"+i+"_off.gif";
			}

			loop++;
			if(loop > LoopCnt) loop = 1;
		}
	}
}

function showalimpandiv(seq){
	loop = seq;
	var objName = "pop" + loop;
	var viewObjName = "pop_no0" + loop;

	var obj = document.getElementById(objName);
	var viewObj = document.getElementById(viewObjName);

	viewObj.style.display = 'block';
	obj.src = "/images/2013/pop_no0"+loop+"_on.gif";

	for(var i = 1; i <= LoopCnt; i++){
		if(i == loop) continue;

		var tmpobjName = "pop" + i;
		var tmpviewObjName = "pop_no0" + i;

		var tmpobj = document.getElementById(tmpobjName);
		var tmpviewObj = document.getElementById(tmpviewObjName);

		tmpviewObj.style.display = 'none';
		tmpobj.src = "/images/2013/pop_no0"+i+"_off.gif";
	}

	if(LoopCnt < seq)
		loop=1;
	else
		loop=seq;
}


// png 적용
function setPng24(obj) {
	 obj.width=obj.height=1;
	 obj.className=obj.className.replace(/\bpng24\b/i,'');
	 obj.style.filter =
	 "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+ obj.src +"',sizingMethod='image');"
	 obj.src=''; 
	 return '';
}

//패밀리배너보기
function viewall_main(opt) {
	if (opt=="on"){   		
		document.getElementById("banner_list").style.display = "block";
	}else{
		document.getElementById("banner_list").style.display = "none";
	}
}
