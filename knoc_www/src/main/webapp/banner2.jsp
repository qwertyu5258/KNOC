<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.util.*"%>    
<%@ page import = "kr.co.knoc.util.*"%>
<%@ page import = "kr.co.knoc.banner.*"%>
<jsp:useBean id="BannerMa" scope="page" class="kr.co.knoc.banner.BannerManager" />
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<% request.setCharacterEncoding("euc-kr"); %>     
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> 
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<title>석유공사 홈페이지에 오신것을 환영합니다.</title>
<link href="/share/css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/share/js/common.js"></script>
<body leftmargin="0" marginwidth="0" topmargin="0" marginheight="0">
<script language="JavaScript1.2">
var goleftimage='' //메뉴왼쪽 이미지
var gorightimage=''//메뉴 오른쪽 이미지

// 스크롤러의 가로크기
var sliderwidth=890
// 스크롤러의 높이 (이미지의 높이와 맞추어 주세요)
var sliderheight= 25
// 스크롤 속도 (클수록 빠릅니다 1-10)
var slidespeed=1
// 배경색상
slidebgcolor=""
// 이미지들을 설정 하세요
var leftrightslide=new Array()
var finalslide=''
<%
ArrayList al = BannerMa.getBanner();
int i = 0;
Iterator iter = al.iterator();
while(iter.hasNext()){
	BannerBean bb = (BannerBean)iter.next();
%>
leftrightslide[<%=i%>]='<a href="<%=bb.getLinkUrl()%>" target="<%=bb.getLinkType()%>" title="<%=bb.getAlttext()%>"><img src="/upload/BANNER/<%=bb.getNewFilename()%>" alt="<%=bb.getAlttext()%>" border=0 align="absmiddle" /></a>&nbsp;'
<%
	i++;
}
%>
var copyspeed=slidespeed
leftrightslide='<nobr>'+leftrightslide.join(" ")+'</nobr>'
var iedom=document.all||document.getElementById
if (iedom)
document.write('<span id="temp" style="visibility:hidden;position:absolute;top:-100;left:-1000">'+leftrightslide+'</span>')
var actualwidth=''
var cross_slide, ns_slide

function fillup(){
if (iedom){
cross_slide=document.getElementById? document.getElementById("test2") : document.all.test2
cross_slide2=document.getElementById? document.getElementById("test3") : document.all.test3
cross_slide.innerHTML=cross_slide2.innerHTML=leftrightslide
actualwidth=document.all? cross_slide.offsetWidth : document.getElementById("temp").offsetWidth
cross_slide2.style.left=actualwidth+5
}
else if (document.layers){
ns_slide=document.ns_slidemenu.document.ns_slidemenu2
ns_slide2=document.ns_slidemenu.document.ns_slidemenu3
ns_slide.document.write(leftrightslide)
ns_slide.document.close()
actualwidth=ns_slide.document.width
ns_slide2.left=actualwidth+5
ns_slide2.document.write(leftrightslide)
ns_slide2.document.close()
}
lefttime=setInterval("slideleft()",30)
}
window.onload=fillup

function slideleft(){
if (iedom){
if (parseInt(cross_slide.style.left)>(actualwidth*(-1)+8))
cross_slide.style.left=parseInt(cross_slide.style.left)-copyspeed
else
cross_slide.style.left=parseInt(cross_slide2.style.left)+actualwidth+5
if (parseInt(cross_slide2.style.left)>(actualwidth*(-1)+8))
cross_slide2.style.left=parseInt(cross_slide2.style.left)-copyspeed
else
cross_slide2.style.left=parseInt(cross_slide.style.left)+actualwidth+5
}
else if (document.layers){
if (ns_slide.left>(actualwidth*(-1)+8))
ns_slide.left-=copyspeed
else
ns_slide.left=ns_slide2.left+actualwidth+5
if (ns_slide2.left>(actualwidth*(-1)+8))
ns_slide2.left-=copyspeed
else
ns_slide2.left=ns_slide.left+actualwidth+5
}
}

function slideright(){
copyspeed=0
copyspeed=-1
if (iedom){
if (parseInt(cross_slide.style.left)<(actualwidth*(-1)+8))
cross_slide.style.left=parseInt(cross_slide.style.left)+copyspeed
else
cross_slide.style.left=parseInt(cross_slide2.style.left)-(actualwidth+5)
if (parseInt(cross_slide2.style.left)<(actualwidth*(-1)+8))
cross_slide2.style.left=parseInt(cross_slide2.style.left)+copyspeed
else
cross_slide2.style.left=parseInt(cross_slide.style.left)-(actualwidth+5)
}
else if (document.layers){
if (ns_slide.left<(actualwidth*(-1)+8))
ns_slide.left+=copyspeed
else
ns_slide.left=ns_slide2.left-(actualwidth+5)
if (ns_slide2.left<(actualwidth*(-1)+8))
ns_slide2.left+=copyspeed
else
ns_slide2.left=ns_slide.left-(actualwidth+5)
}
}

if (iedom||document.layers){
	with (document){
	document.write('<div style="width:890px; padding:10px 0 0 90px; margin:0; position:relative;">')
	write('<div style="width:890px; margin:0x 0 0 0;>')
	if (iedom){
	write('<div style="position:relative;width:'+sliderwidth+';height:'+sliderheight+';overflow:hidden">')
	write('<div style="position:absolute;width:'+sliderwidth+';height:'+sliderheight+';background-color:'+slidebgcolor+'" onmouseover="copyspeed=0" onmouseout="copyspeed=slidespeed" onfocus="copyspeed=0" onblur="copyspeed=slidespeed">')
	write('<div id="test2" style="position:absolute;left:0;top:-2"></div>')
	write('<div id="test3" style="position:absolute;left:-1000;top:-2"></div>')
	write('</div></div>')
	}
	else if (document.layers){
	write('<ilayer width='+sliderwidth+' height='+sliderheight+' name="ns_slidemenu" bgColor='+slidebgcolor+'>')
	write('<layer name="ns_slidemenu2" left=0 top=-2 onmouseover="copyspeed=0" onmouseout="copyspeed=slidespeed" onfocus="copyspeed=0" onblur="copyspeed=slidespeed">||</layer>')
	write('<layer name="ns_slidemenu3" left=0 top=-2 onmouseover="copyspeed=0" onmouseout="copyspeed=slidespeed"  onfocus="copyspeed=0" onblur="copyspeed=slidespeed"></layer>')
	write('</ilayer>')
	}
	write('</div>')
	write('<div style="width:90px; height:35px; position:absolute; left:0; top:0; padding:13px 0 0 10px; background:#FFFFFF;"><img src="/images/main/bnt_tle.gif" alt="배너존" />&nbsp; <a href="#" onclick="copyspeed=slidespeed" title="배너 흐름 재생"><img src="/images/main/bnr_play.gif" alt="배너 흐름 재생" border="0" /></a>&nbsp; <a href="#" onclick="copyspeed=0" title="배너 흐름 정지"><img src="/images/main/bnr_stop.gif" alt="배너 흐름 정지" border="0" /></a></div>')
	write('</div>')
	}
	}
</script>	

</body>
</html>