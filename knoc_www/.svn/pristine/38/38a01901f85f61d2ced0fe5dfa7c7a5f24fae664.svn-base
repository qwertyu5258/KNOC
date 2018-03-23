

<!-- 헤더[start] -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "java.util.*"%>
<%@ page import="kr.co.knoc.mgr.*" %>
<%@ page import="kr.co.knoc.content.MenuBean" %>
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
</head>
<body> <!-- 새로고침하면 랜덤으로 01~03까지 변경 -->
<!-- div class="hidden"><h2>바로가기</h2></div>
<div id="accessibility" class="hidden">
	<ul>
	<li><a href="#util">보조메뉴 바로가기</a></li>
	<li><a href="#topNavi">주메뉴 바로가기</a></li>
	<li><a href="#main_content">본문영역 바로가기</a></li>
	<li><a href="#footer_2011">하단영역 바로가기</a></li>
	</ul>
</div> 

<hr /-->
<div id="wrap">

	<!-- header -->
	<div id="header">
	<!-- top_area -->
   	<div class="top_area">
		<!-- top_util -->
       	<ul class="top_util">
           	<li><a href="#rightarea"><img src="/img/btn/btn_go_container.png" alt="본문바로가기" /></a></li>
               <li>
               	<div class="font_size">
                   	<span class="bline">글자크기</span>
                       <button class="zoom_in"><span class="bline">글자크기 크게</span></button>
                       <button class="zoom_out"><span class="bline">글자크기 작게</span></button>
                   </div>
               </li>
               <li><button class="btn_print"><span class="bline">인쇄</span></button></li>
           </ul>
           <!-- //top_util -->
		<!-- top_quick_menu -->
           <p class="top_quick_menu">
               <a href="/">홈</a>
               <span class="arrow">I</span>
               <%if(ses != null && ses.getId() != null && ses.getId().length() > 0){ %>
               <a href="/member/logout.jsp">로그아웃</a>
               <%}else{ %>
               <a href="/member/login.jsp">로그인</a>
               <%} %>
               
               <span class="arrow">I</span>
               <a href="/member/sitemap.jsp">사이트맵/기타서비스</a>
              
           </p>
           <!-- //top_quick_menu -->
		<!-- language -->
           <div class="language">
               <select id="langs" name="langs" class="langs" title="언어 선택">
                   <option value="">Language</option>
                   <option value="/ENG/main.jsp">English</option>
               </select>
               <a href="#this" onclick="javascript:goSite(1);" title="새창" class="btn_go_site"><img src="/img/btn/btn_select.png" alt="선택" /></a>
           </div>
		<!-- //language -->
       </div>
       <!-- //top_area -->
       
	<!-- core_area -->
       <div class="core_area">
       	<h1><a href="/"><img src="/img/common/logo.png" alt="한국석유공사" title="한국석유공사" /></a></h1>
		<!-- search_area -->
           <div class="search_area">
               <form  name="tsearchForm" id="tsearchForm" method="post" action="/search/list.jsp">
                   <div>
                       <fieldset>
                           <legend>통합검색</legend>
                           <input type="text" title="검색어 입력" id="nsearch" name="search" class="search_input" style="background: url(/img/bg/search_txt.png) 0% 50% no-repeat;" onfocus="this.style.backgroundImage=''" onblur="if (this.value=='') this.style.backgroundImage='url(/img/bg/search_txt.png)';" />
                           <input type="image" src="/img/btn/btn_search.png" alt="검색" class="btn_search" />
                       </fieldset>
                   </div>
               </form>
           </div>
		<!-- //search_area -->
           <p class="core_txt"><a href="http://www.gov30.go.kr" target="_blank"><img src="/img/common/top_banner.png" alt="행복한 대한민국을 여는 정부 3.0" title="행복한 대한민국을 여는 정부 3.0" /></a></p>
       </div>
	<!-- //core_area -->        

       <!-- gnb -->
       <div id="gnb">
           <span class="bg">
           	<span></span>
           </span>
           <button class="btn_gnb_close"><span class="bline">닫기</span></button>
           <ul>          
               <li>
                   <a href="/sub05/submain.jsp" class="gnb01"><span class="bline">정부3.0정보공개</span></a>
                   <ul class="gnb_depth">
				<%
					ArrayList al05 = MenuMa.getMenuList("05","Y");	
					Iterator titer = al05.iterator();
					while(titer.hasNext()){		
						MenuBean mb = (MenuBean)titer.next();
						if (mb.getMCode() != null && mb.getMCode().substring(4,8).equals("0000")) {
							
				%>						
							<li><a href="<%=mb.getUrl() %>" title="<%=mb.getName() %> 페이지로 이동"><%=mb.getName() %></a></li>
				<%				
						}
					}
				%>
                   </ul>    
               </li>		        

               <li>
                   <a href="/sub01/submain.jsp" class="gnb02"><span class="bline">공사소개</span></a>
                   <ul>
				<%
					ArrayList al01 = MenuMa.getMenuList("01","Y");	
					titer = al01.iterator();
					while(titer.hasNext()){		
						MenuBean mb = (MenuBean)titer.next();
						if (mb.getMCode() != null && mb.getMCode().substring(4,8).equals("0000")) { //0111 0112 mb.getMCode()
				%>						
							<li><a href="<%=mb.getUrl() %>" title="<%=mb.getName() %> 페이지로 이동"><%=("0111".equals(mb.getMCode().substring(0,4)) || "0112".equals(mb.getMCode().substring(0,4)))?mb.getName().substring(0,4)+"<br />"+mb.getName().substring(4,mb.getName().length()):mb.getName() %></a></li>
				<%				
						}
					}
				%>	
                   </ul>    
               </li>
               
               <li>
                   <a href="/sub03/submain.jsp" class="gnb03"><span class="bline">사업소개</span></a>
                   <ul>
				<%
					ArrayList al03 = MenuMa.getMenuList("03","Y");	
					titer = al03.iterator();
					while(titer.hasNext()){		 
						MenuBean mb = (MenuBean)titer.next();
						if (mb.getMCode() != null && mb.getMCode().substring(4,8).equals("0000")) {
				%>						
							<li><a href="<%=mb.getUrl() %>" title="<%=mb.getName() %> 페이지로 이동"><%=("0304".equals(mb.getMCode().substring(0,4)))?mb.getName().substring(0,6)+"<br />"+mb.getName().substring(6,mb.getName().length()):mb.getName() %></a></li>
				<%				
						}
					}
				%>
                   </ul>    
               </li>
               
               <li>
                   <a href="/sub02/submain.jsp" class="gnb04"><span class="bline">열린경영</span></a>
                   <ul>
				<%
					ArrayList al02 = MenuMa.getMenuList("02","Y");
					titer = al02.iterator();
					while(titer.hasNext()){		
						MenuBean mb = (MenuBean)titer.next();
						if (mb.getMCode() != null && mb.getMCode().substring(4,8).equals("0000")) {
				%>						
							<li><a href="<%=mb.getUrl() %>" title="<%=mb.getName() %> 페이지로 이동"><%=mb.getName() %></a></li>
				<%				
						}
					}
				%>
                   </ul>    
               </li>
               
               <li>
                   <a href="/sub11/submain.jsp" class="gnb05"><span class="bline">사이버홍보실</span></a>
                   <ul>
				<%
					ArrayList al11 = MenuMa.getMenuList("11","Y");
					titer = al11.iterator();
					while(titer.hasNext()){		
						MenuBean mb = (MenuBean)titer.next();
						if (mb.getMCode() != null && mb.getMCode().substring(4,8).equals("0000")) {
				%>						
							<li><a href="<%=mb.getUrl() %>" title="<%=mb.getName() %> 페이지로 이동"><%=mb.getName() %></a></li>
				<%				
						}
					}
				%>
                   </ul>    
               </li>
               
               <li>
                   <a href="/sub04/submain.jsp" class="gnb06"><span class="bline">고객참여</span></a>
                   <ul>
				<%
					ArrayList al04 = MenuMa.getMenuList("04","Y");
					titer = al04.iterator();
					while(titer.hasNext()){		
						MenuBean mb = (MenuBean)titer.next();
						if (mb.getMCode() != null && mb.getMCode().substring(4,8).equals("0000")) {
				%>						
							<li><a href="<%=mb.getUrl() %>" title="<%=mb.getName() %> 페이지로 이동"><%=mb.getName() %></a></li>
				<%				
						}
					}
				%>
                   </ul>    
               </li>                                                                

               <li>
                   <a href="/sub12/sub12_1_1.jsp" class="gnb07"><span class="bline">인재개발센터</span></a>
                   <ul>
				<%
					ArrayList al07 = MenuMa.getMenuList("12","Y");
					titer = al07.iterator();
					while(titer.hasNext()){		
						MenuBean mb = (MenuBean)titer.next();
						if (mb.getMCode() != null && mb.getMCode().substring(4,8).equals("0000")) {
				%>						
							<li><a href="<%=mb.getUrl() %>" title="<%=mb.getName() %> 페이지로 이동"><%=mb.getName() %></a></li>
				<%				
						}
					}
				%>
                   </ul>    
               </li>                	
           </ul>        	
       </div>
	<!-- //gnb -->
	</div>
	<!-- //header -->

		<hr />
		<div style="clear:both ; height:50px ;"></div>

		
<script type="text/javascript">

	//document.getElementById("snsTab").style.display="none";

	function facebook(){
	 	document.getElementById("sns_tab01").style.display="none";
	 	document.getElementById("sns_tab02").style.display="";
	}
	function twiter(){
	 	document.getElementById("sns_tab02").style.display="none";
	 	document.getElementById("sns_tab01").style.display="";
	}
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

</script>

