

<!-- 헤더[start] -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "java.util.*"%>
<%@ page import="kr.co.knoc.mgr.*" %>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<%
	String gets = "";
	if(request.getQueryString() != null){
 		gets = "?"+request.getQueryString();
	}
	String currentPage = request.getRequestURL()+gets; 
	if (currentPage == null || currentPage.equals("")) {
		currentPage = "/";
	}
	/**	포스트방식 파라메터
	StringBuffer sb = new StringBuffer();
	for (Enumeration en = request.getParameterNames(); en.hasMoreElements();) {
		String key = (String)en.nextElement();
		sb.append(key+"="+request.getParameter(key)+"&");
	}
	String paramStr = sb.toString();
	paramStr = paramStr.substring(0, paramStr.length()-1);
	**/

	MgrSession ses = (MgrSession)session.getAttribute("USERSESSION");
	String uid = "";
	String userlevel = "9";
	if (ses != null) {
		uid = ses.getUserID();
		userlevel = ses.getUserLevel();
	}
%>
<!--<script type="text/javascript">
function layer_toggle(obj) {
    if (obj.style.display == 'none') { 
        obj.style.display = 'block';
        document.all.addr.style.visibility = "hidden";
        document.all.select_link1.style.visibility = "hidden";
        document.all.select_link2.style.visibility = "hidden";
        document.all.select_link3.style.visibility = "hidden";
        document.all.select_link4.style.visibility = "hidden";
    } else if (obj.style.display == 'block') {
        obj.style.display = 'none';
        document.all.addr.style.visibility = "visible";
        document.all.select_link1.style.visibility = "visible";
        document.all.select_link2.style.visibility = "visible";
        document.all.select_link3.style.visibility = "visible";
        document.all.select_link4.style.visibility = "visible";
    }
}
</script>-->
<script type="text/javascript">
	<!--
	function openAll() {
		document.getElementById("more01b").style.display = "block";
		document.getElementById("more01a").style.display = "none";
		document.getElementById("smainvisual").style.display = "none";		
		document.getElementById("smainvisual2").style.display = "block";
		return false;
	}
	function closeAll() {
		document.getElementById("more01b").style.display = "none";
		document.getElementById("more01a").style.display = "block";
		document.getElementById("smainvisual").style.display = "block";		
		document.getElementById("smainvisual2").style.display = "none";
		return false;
	}
	//-->
	
	img = new Array(3);
	img[0] = '<div id="wrapper" class="main_visual01">'; 
	img[1] = '<div id="wrapper" class="main_visual02">'; 
	img[2] = '<div id="wrapper" class="main_visual03">'; 
	index = Math.floor(Math.random() * img.length);
	document.write("<style type='text/css'><!--");
	document.write("body {background:url(" + img[index] + ") no-repeat fixed right bottom}");
	document.write("--></style>");
	
	
	function show_board(index)
	{
		var div_news = document.all["NEWS"];
		var div_info = document.all["INFO"];
		var div_tech = document.all["TECH"];
		
		if (index == 1) {
			div_news.style.display = "block";
			div_info.style.display = "none";
			div_tech.style.display = "none";
		} else if (index == 2) {
			div_news.style.display = "none";
			div_info.style.display = "block";
			div_tech.style.display = "none";
		} else if (index == 3) {
			div_news.style.display = "none";
			div_info.style.display = "none";
			div_tech.style.display = "block";
		} 
	}	
	
	<%
		ArrayList popN_al = PopNewMa.getPopupNew();
		String cookie_date = "";
		String scroll = "";
		Iterator popNiter = popN_al.iterator();
		while(popNiter.hasNext()){
			PopupNewBean pnb = (PopupNewBean)popNiter.next();
			cookie_date = pnb.getRegDateString("yyyyMMddhhmmss");
		if (pnb.getScroll().equals("Y")) {
			scroll = "yes";
		} else {
			scroll = "no";
		}
	%>
	if (getCookie("<%=cookie_date%>") != "close<%=cookie_date%>")
	{
		var popup = window.open("/Popup/popup.jsp?no=<%=pnb.getNo()%>","<%=cookie_date%>","toolbar=no,status=no,top=0,left=0,width=<%=pnb.getWidth()%>,height=<%=pnb.getHeight()%>,scrollbars=<%=scroll%>");		
	}
	<%
	}
	%>	

</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<head>
	<title>한국석유공사 -  석유공사 홈페이지에 오신것을 환영합니다. </title>
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="pragma" content="no-cache" />
	<link rel="stylesheet" type="text/css" href="/include/css/common_2011.css" />
	<script type="text/javascript" charset="euc-kr" src="/include/js/topmenu_2011.js"></script>
	<link rel="stylesheet" type="text/css" href="/include/css/board.css" />
	<link rel="stylesheet" type="text/css" href="/include/css/common.css" />
    <link rel="stylesheet" type="text/css" href="/include/css/sub.css" />
    <link rel="stylesheet" type="text/css" href="/include/css/subpage.css" />
 
	<!--[if lte IE 7]><link rel="stylesheet" type="text/css" href="/include/css/ie7.css" /><![endif]-->
	<!--[if IE 6]><link rel="stylesheet" type="text/css" href="/include/css/ie6.css" /><![endif]-->
	<script type="text/javascript" src="/include/js/java.js"></script>
	<script type="text/javascript" src="/include/js/common.js"></script>
	<script type="text/javascript" src="/share/js/common.js"></script>
	<script type="text/javascript" src="/include/js/roll_common.js"></script>

</head>
<%int i = 3;%>
<%int num = (int)Math.round(Math.random()*(i-2)) + 2; %>

<body class="main_body0<%=num%>"> <!-- 새로고침하면 랜덤으로 01~03까지 변경 -->
<div class="hidden_tit"><h2>바로가기</h2></div>
<div id="accessibility">
	<ul>
	<li><a href="#util">보조메뉴 바로가기</a></li>
	<li><a href="#topNavi">주메뉴 바로가기</a></li>
	<li><a href="#main_content">본문영역 바로가기</a></li>
	<li><a href="#footer_2011">하단영역 바로가기</a></li>
	</ul>
</div> 

<hr />
<div id="wrapper" class="main_visual0<%=num%>"> <!-- 새로고침하면 랜덤으로 01~03까지 변경 -->
	<div id="content_area">
		<div class="skip_nav"><a href="#main_content">본문 바로가기▶</a></div>
		<%@include file="/include/sns_service.jsp"%>
		
		<!-- header start -->
		<div class="header">
			
			<h1><a href="/"><img src="/images/2012/logo.gif" alt="한국석유공사 Korea National Oil Corporation : 메인페이지로 이동" /></a></h1>

			<div class="hidden_tit"><h2>보조메뉴</h2></div>
			<ul class="util2" id="util">
			<li><a href="/include/forPrint.jsp" title="새창" target="_blank" onclick="contentPrint_main(); return false;" ><img src="/images/2011/util_print.gif" alt="인쇄" /></a></li>
			<!-- <li><a href="http://voice.knoc.co.kr/voicemon/mainGen.odc?method=generate&amp;d_idx=1" target="_blank" title="새창"><img src="/images/2011/util_voice.gif" alt="텍스트형 음성안내 홈페이지로 이동" /></a></li> -->
			<li class="text_zoom"><img src="/images/2011/util_text.gif" alt="글자크기" /><a href="#fontdv" onclick="zoomInOut('','in'); return false;" ><img src="/images/2011/util_text1.gif" alt="확대" /></a><a href="#fontdv" onclick="zoomInOut('','def'); return false;" ><img src="/images/2011/util_text2.gif" alt="기본" /></a><a href="#fontdv" onclick="zoomInOut('','out'); return false;" ><img src="/images/2011/util_text3.gif" alt="축소" /></a><span></span></li>
			</ul>

			<ul class="util1">
			<li><a href="/"><img src="/images/2011/util_home.gif" alt="홈" /></a></li>
<% 	if (ses != null && !ses.getId().equals("guest")){%>
			<li><a href="/member/logout.jsp"><img src="/images/2011/util_logout.gif" alt="로그아웃" /></a></li>
			<li><a href="/member/pre_join.jsp"><img src="/images/2011/util_myinfo.gif" alt="정보수정" /></a></li>
<%	}else{ %>			
			<li><a href="/member/login.jsp"><img src="/images/2011/util_login.gif" alt="로그인" /></a></li>
			<!--  li><a href="/member/pre_join.jsp"><img src="/images/2011/util_join.gif" alt="회원가입" /></a></li -->
			

<%	} %>
			<li><a href="/member/sitemap.jsp"><img src="/images/2011/util_sitemap.gif" alt="사이트맵" /></a></li>
			<li><a href="/ENG/main.jsp"><img src="/images/2011/util_english.gif" alt="ENGLISH" /></a></li>
			<li class="last"><a href="/sub08/submain.jsp"><img src="/images/2011/util_m1.gif" alt="이사회" /></a></li>
			
			</ul>
			
			<div class="hidden_tit"><h2>주메뉴</h2></div>
						<div id="topNavi">
<!-- 공사소개[start] -->						
							<ul class="navi" id="mainNavi">
<% 
	ArrayList al01 = MenuMa.getMenuList("01","Y");	
%>	
								<li id="E01"><a href="/sub01/submain.jsp" onmouseover="onNavi(1,'top_navi',6)" onfocus="onNavi(1,'top_navi',6)" onmouseout="outNavi(1,'top_navi',6)" onblur=""><img src="/images/2011/menu_01.gif" alt="공사소개" /></a>
									<div class="topnavi_s01" onmouseover="onNavi(1,'top_navi',6)" onfocus="onNavi(1,'top_navi',6)" onmouseout="outNavi(1,'top_navi',6)" onblur="outNavi(1,'top_navi',6)">
									<div class="sub_arrow"></div>
										<ul class="topnavi_01">
<%
	Iterator titer = al01.iterator();
	while(titer.hasNext()){		
		MenuBean mb = (MenuBean)titer.next();
		if (mb.getMCode() != null && mb.getMCode().substring(4,8).equals("0000")) {
%>						
					<li <%if(!titer.hasNext()){ %>class="bg_none"<%} %>><a href="<%=mb.getUrl() %>" title="<%=mb.getName() %> 페이지로 이동"><%=mb.getName() %></a></li>
<%				
		}
	}
%>	

										</ul>
									</div>
								</li>
<!-- 공사소개[end] -->								
								
<!-- 사업소개[start] -->								
<% 
	ArrayList al03 = MenuMa.getMenuList("03","Y");	
%>								
								<li id="E02"><a href="/sub03/submain.jsp" onmouseover="onNavi(2,'top_navi',6)" onfocus="onNavi(2,'top_navi',6)" onmouseout="outNavi(2,'top_navi',6)" onblur=""><img src="/images/2011/menu_02.gif" alt="사업소개" /></a>
									<div class="topnavi_s02" onmouseover="onNavi(2,'top_navi',6)" onfocus="onNavi(2,'top_navi',6)" onmouseout="outNavi(2,'top_navi',6)" onblur="outNavi(2,'top_navi',6)"> 
									<div class="sub_arrow"></div>
										<ul class="topnavi_02">
<%
	titer = al03.iterator();
	while(titer.hasNext()){		 
		MenuBean mb = (MenuBean)titer.next();
		if (mb.getMCode() != null && mb.getMCode().substring(4,8).equals("0000")) {
%>						
										<li <%if(mb.getMCode().equals("03070000")){ %>class="bg_none"<%} %>><a href="<%=mb.getUrl() %>" title="<%=mb.getName() %> 페이지로 이동"><%=mb.getName() %></a></li>
<%				
		}
	}
%>											
										
										</ul>
									</div>
								</li>
<!-- 사업소개[end] -->

<!-- 열린경영[start] -->
<% 
	ArrayList al02 = MenuMa.getMenuList("02","Y");	
%>
								<li id="E03"><a href="/sub02/submain.jsp" onmouseover="onNavi(3,'top_navi',6)" onfocus="onNavi(3,'top_navi',6)" onmouseout="outNavi(3,'top_navi',6)" onblur=""><img src="/images/2011/menu_03.gif" alt="열린경영" /></a>
									<div class="topnavi_s03" onmouseover="onNavi(3,'top_navi',6)" onfocus="onNavi(3,'top_navi',6)" onmouseout="outNavi(3,'top_navi',6)" onblur="outNavi(3,'top_navi',6)"> 
									<div class="sub_arrow"></div>
										<ul class="topnavi_03">
<%
	titer = al02.iterator();
	while(titer.hasNext()){		
		MenuBean mb = (MenuBean)titer.next();
		if (mb.getMCode() != null && mb.getMCode().substring(4,8).equals("0000")) {
			
%>						
											<li <%if(mb.getMCode().equals("02070000")){ %>class="bg_none"<%} %>><a href="<%=mb.getUrl() %>" title="<%=mb.getName() %> 페이지로 이동"><%=mb.getName() %></a></li>
<%				
		}
	}
%>											
										</ul>
									</div>
								</li>
<!-- 열린경영[end] -->

<!-- 고객참여[start] -->
<% 
	ArrayList al04 = MenuMa.getMenuList("04","Y");	
%>
								<li id="E04"><a href="/sub04/submain.jsp" onmouseover="onNavi(4,'top_navi',6)" onfocus="onNavi(4,'top_navi',6)" onmouseout="outNavi(4,'top_navi',6)" onblur=""><img src="/images/2011/menu_04.gif" alt="고객참여" /></a>
									<div class="topnavi_s04" onmouseover="onNavi(4,'top_navi',6)" onfocus="onNavi(4,'top_navi',6)" onmouseout="outNavi(4,'top_navi',6)" onblur="outNavi(4,'top_navi',6)"> 
									<div class="sub_arrow"></div>
										<ul class="topnavi_04">
<%
	titer = al04.iterator();
	while(titer.hasNext()){		
		MenuBean mb = (MenuBean)titer.next();
		if (mb.getMCode() != null && mb.getMCode().substring(4,8).equals("0000")) {
%>						
											<li <%if(!titer.hasNext()){ %>class="bg_none"<%} %>><a href="<%=mb.getUrl() %>" title="<%=mb.getName() %> 페이지로 이동"><%=mb.getName() %></a></li>
<%				
		}
	}
%>
										</ul>
									</div>
								</li>
<!-- 고객참여[end] -->

<!-- 정보마당[start] -->
<% 
	ArrayList al05 = MenuMa.getMenuList("05","Y");	
	
%>
								<li id="E05"><a href="/sub05/submain.jsp" onmouseover="onNavi(5,'top_navi',6)" onfocus="onNavi(5,'top_navi',6)" onmouseout="outNavi(5,'top_navi',6)" onblur=""><img src="/images/2011/menu_05.gif" alt="정보마당" /></a>
									<div class="topnavi_s05" onmouseover="onNavi(5,'top_navi',6)" onfocus="onNavi(5,'top_navi',6)" onmouseout="outNavi(5,'top_navi',6)" onblur="outNavi(5,'top_navi',6)"> 
									<div class="sub_arrow"></div>
										<ul class="topnavi_05">
<%
	titer = al05.iterator();
	while(titer.hasNext()){		
		MenuBean mb = (MenuBean)titer.next();
		if (mb.getMCode() != null && mb.getMCode().substring(4,8).equals("0000")) {
			
%>						
											<li <%if(mb.getMCode().equals("05070000")){ %>class="bg_none"<%} %>><a href="<%=mb.getUrl() %>" title="<%=mb.getName() %> 페이지로 이동"><%=mb.getName() %></a></li>
<%				
		}
	}
%>		
										</ul>
									</div>								
								</li>
<!-- 정보마당[end] -->
<!-- 석유개발연구원[start] -->
<% 
	ArrayList al06 = MenuMa.getMenuList("06","Y");	
%>	
								<li id="E06"><a href="/sub06/submain.jsp" onmouseover="onNavi(6,'top_navi',6)" onfocus="onNavi(6,'top_navi',6)" onmouseout="outNavi(6,'top_navi',6)" onblur=""><img src="/images/2011/menu_06.gif" alt="석유개발연구원" /></a>
								
									<div class="topnavi_s06" onmouseover="onNavi(6,'top_navi',6)" onfocus="onNavi(6,'top_navi',6)" onmouseout="outNavi(6,'top_navi',6)" onblur="outNavi(6,'top_navi',6)"> 
									<div class="sub_arrow"></div>
										<ul class="topnavi_06">
<%
	titer = al06.iterator();
	while(titer.hasNext()){		
		MenuBean mb = (MenuBean)titer.next();
		if (mb.getMCode() != null && mb.getMCode().substring(4,8).equals("0000")) {
%>						
											<li <%if(!titer.hasNext()){ %>class="bg_none"<%} %>><a href="<%=mb.getUrl() %>" title="<%=mb.getName() %> 페이지로 이동"><%=mb.getName() %></a></li>
<%				
		}
	}
%>			
										</ul>
									</div>
								
								
								</li>
<!-- 석유개발연구원[end] -->								
									
							</ul>

						</div>
						<form name="tsearchForm" id="tsearchForm" method="post" action="/search/list.jsp">
						<div class="search_2011">
							<fieldset><legend>검색</legend>
							<input type="text" title="검색어 입력" id="nsearch" name="search" onclick="this.value=''" class="search_input" itemname="검색" style="background:url(/images/2011/search_txt.gif) no-repeat;" onfocus="this.style.backgroundImage=''" onblur="if (this.value=='') this.style.backgroundImage='url(/images/2011/search_txt.gif)';" />
							<a href="javascript:document.getElementById('tsearchForm').submit();"><img src="/images/2011/search_btn.gif" alt="검색" /></a>
							</fieldset>
						</div>
						</form>

		</div>
		<hr />
		
		