<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.content.*"%>
<%@ page import = "java.util.*"%>
<%@ page import="kr.co.knoc.mgr.*" %>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<jsp:useBean id="MenuMa" scope="page" class="kr.co.knoc.content.MenuManager" />
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
<script type="text/javascript">
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
</script>
        <div id="more01b" style="position:absolute;z-index:99;display:none;width:100%;height:493px;text-align:center;background:url('/images/main/bg_category_all.gif') repeat-x; margin:0 auto">
	<div id="all_menu">
		<h3 align="left"><img src="../images/common/img_all_menu_01.gif" alt="전체보기" /></h3>
		<div id="all_menu_1">
<% 
	ArrayList al01 = MenuMa.getMenuList("01","Y");	
%>		
			<div class="all_menu_01">
				<p class="a_p"><a href="../sub01/submain.jsp">공사소개</a></p>
				<ul class="pt05">
<%
	Iterator titer = al01.iterator();
	while(titer.hasNext()){		
		MenuBean mb = (MenuBean)titer.next();
		if (mb.getMCode() != null && mb.getMCode().substring(4,8).equals("0000")) {
%>						
					<li class="m_p pt03"><img src="../images/main/bullet.gif" alt="" /> <a href="<%=mb.getUrl() %>"><%=mb.getName() %></a></li>
<%				
		}
	}
%>											
				</ul>
			</div>
<% 
	ArrayList al02 = MenuMa.getMenuList("02","Y");	
%>				
			<div class="all_menu_01">
				<p class="a_p"><a href="../sub02/submain.jsp">열린경영</a></p>
				<ul class="pt05">
<%
	titer = al02.iterator();
	while(titer.hasNext()){		
		MenuBean mb = (MenuBean)titer.next();
		if (mb.getMCode() != null && mb.getMCode().substring(4,8).equals("0000")) {
%>						
					<li class="m_p pt03"><img src="../images/main/bullet.gif" alt="" /> <a href="<%=mb.getUrl() %>"><%=mb.getName() %></a></li>
<%				
		}
	}
%>														
				</ul>
			</div>
<% 
	ArrayList al03 = MenuMa.getMenuList("03","Y");	
%>			
			<div class="all_menu_01">
				<p class="a_p"><a href="../sub03/submain.jsp">사업소개</a></p>
				<ul class="pt05">
<%
	titer = al03.iterator();
	while(titer.hasNext()){		
		MenuBean mb = (MenuBean)titer.next();
		if (mb.getMCode() != null && mb.getMCode().substring(4,8).equals("0000")) {
%>						
					<li class="m_p pt03"><img src="../images/main/bullet.gif" alt="" /> <a href="<%=mb.getUrl() %>"><%=mb.getName() %></a></li>
<%				
		}
	}
%>	
				</ul>
			</div>
<% 
	ArrayList al04 = MenuMa.getMenuList("04","Y");	
%>					
			<div class="all_menu_01">
				<p class="a_p"><a href="../sub04/submain.jsp">고객참여</a></p>
				<ul class="pt05">
<%
	titer = al04.iterator();
	while(titer.hasNext()){		
		MenuBean mb = (MenuBean)titer.next();
		if (mb.getMCode() != null && mb.getMCode().substring(4,8).equals("0000")) {
%>						
					<li class="m_p pt03"><img src="../images/main/bullet.gif" alt="" /> <a href="<%=mb.getUrl() %>"><%=mb.getName() %></a></li>
<%				
		}
	}
%>	
				</ul>
			</div>
<% 
	ArrayList al05 = MenuMa.getMenuList("05","Y");	
%>			
			<div class="all_menu_02">
			<p class="a_p"><a href="../sub05/submain.jsp">정보마당</a></p>
				<ul class="pt05">
<%
	titer = al05.iterator();
	while(titer.hasNext()){		
		MenuBean mb = (MenuBean)titer.next();
		if (mb.getMCode() != null && mb.getMCode().substring(4,8).equals("0000")) {
%>						
					<li class="m_p pt03"><img src="../images/main/bullet.gif" alt="" /> <a href="<%=mb.getUrl() %>"><%=mb.getName() %></a></li>
<%				
		}
	}
%>					
				</ul>
			</div>
			<div style="clear:both"></div>
		</div>
<% 
	ArrayList al06 = MenuMa.getMenuList("06","Y");	
%>			
		<div id="all_menu_2">
			<div class="all_menu_03">
				<p class="a_p"><a href="../sub06/submain.jsp">석유개발연구</a></p>
				<ul class="pt05">
<%
	titer = al06.iterator();
	while(titer.hasNext()){		
		MenuBean mb = (MenuBean)titer.next();
		if (mb.getMCode() != null && mb.getMCode().substring(4,8).equals("0000")) {
%>						
					<li class="m_p pt03"><img src="../images/main/bullet.gif" alt="" /> <a href="<%=mb.getUrl() %>"><%=mb.getName() %></a></li>
<%				
		}
	}
%>				
				</ul>
			</div>
<% 
	ArrayList al07 = MenuMa.getMenuList("07","Y");	
%>				
			<div class="all_menu_03">
				<p class="a_p"><a href="../sub07/submain.jsp">어린이</a></p>
				<ul class="pt05">
<%
	titer = al07.iterator();
	while(titer.hasNext()){		
		MenuBean mb = (MenuBean)titer.next();
		if (mb.getMCode() != null && mb.getMCode().substring(4,8).equals("0000")) {
%>						
					<li class="m_p pt03"><img src="../images/main/bullet.gif" alt="" /> <a href="<%=mb.getUrl() %>"><%=mb.getName() %></a></li>
<%				
		}
	}
%>	
				</ul>
			</div>
<% 
	ArrayList al08 = MenuMa.getMenuList("08","Y");	
%>			
			<div class="all_menu_03">
				<p class="a_p"><a href="../sub08/submain.jsp">이사회</a></p>
				<ul class="pt05">
<%
	titer = al08.iterator();
	while(titer.hasNext()){		
		MenuBean mb = (MenuBean)titer.next();
		if (mb.getMCode() != null && mb.getMCode().substring(4,8).equals("0000")) {
%>						
					<li class="m_p pt03"><img src="../images/main/bullet.gif" alt="" /> <a href="<%=mb.getUrl() %>"><%=mb.getName() %></a></li>
<%				
		}
	}
%>						
				</ul>
			</div>
<% 
	ArrayList al09 = MenuMa.getMenuList("09","Y");	
%>			
			<div class="all_menu_03">
				<p class="a_p"><a href="#">기타서비스</a></p>
				<ul class="pt05">
<%
	titer = al09.iterator();
	while(titer.hasNext()){		
		MenuBean mb = (MenuBean)titer.next();
		if (mb.getMCode() != null && mb.getMCode().substring(4,8).equals("0000")) {
%>						
					<li class="m_p pt03"><img src="../images/main/bullet.gif" alt="" /> <a href="<%=mb.getUrl() %>"><%=mb.getName() %></a></li>
<%				
		}
	}
%>	
				</ul>
			</div>
			<div class="all_menu_04">&nbsp;</div>
			<div style="clear:both"></div>
		</div>
	</div>

	<div class="allClose"><a href="#" onclick="layer_toggle(document.getElementById('more01a')); layer_toggle(document.getElementById('more01b'));return false;"><img src="/images/main/category_all_1_02.gif" align="left" alt="닫기" class="pt05" /></a></div></div>
		<div id="toparea">
			<div id="accessibity">
				<a href="#contents" />컨텐츠 바로가기</a>
			</div>
			<div id="topnavi">
				<div class="allview"id=more01a style="display:block"><a href=# onclick="layer_toggle(document.getElementById('more01a')); layer_toggle(document.getElementById('more01b'));return false;"><img src="/images/common/t_allview.gif" alt="전체보기" /></a></div>
                <div class="tmenudv">
					<ul>
						<li><a href="/index.jsp"><img src="/images/common/t_home.gif" alt="홈" /></a></li>
						<li><a href="/member/login.jsp"><img src="/images/common/t_login.gif" alt="로그인" /></a></li>
						<li><a href="/member/pre_join.jsp"><img src="/images/common/t_join.gif" alt="회원가입" /></a></li>
						<li><a href="#"><img src="/images/common/t_sitemap.gif" alt="사이트맵" /></a></li>
						<li><a href="#" target="_blank" title="새창"><img src="/images/common/t_eng.gif" alt="ENGLISH" /></a></li>
						<li><a href="/sub08/submain.jsp"><img src="/images/common/t_council.gif" alt="이사회" /></a></li>
						<li><a href="http://ebid.knoc.co.kr/supplier/intro.jsp" target="_blank"><img src="/images/common/t_tender.gif" alt="입찰정보" /></a></li>
					</ul>
					<div class="tbtndv">
						<a href="#" onclick="contentPrint();"><img src="/images/common/tbtn_print.gif" alt="인쇄" /></a>
						<a href="#"><img src="/images/common/tbtn_speaker.gif" alt="음성" /></a>
					</div>
					<div class="fontdv">
						<a href="#"><img src="/images/common/tbtn_fplus.gif" alt="Plus" onclick="zoomInOut('','in');" onkeypress="zoomInOut('','in');" /></a>
						<a href="#"><img src="/images/common/tbtn_fdef.gif" alt="Default" onclick="zoomInOut('','def');" onkeypress="zoomInOut('','def');" /></a>
						<a href="#"><img src="/images/common/tbtn_fminus.gif" alt="Minus" onclick="zoomInOut('','out');" onkeypress="zoomInOut('','out');" /></a>
					</div>
<form name="tsearchForm" method="post" action="/search/list.jsp">					
					<div class="tschdv">
						<label for="tsearch" class="nlabel">검색</label>
						<input type="text" value="검색어를 입력하세요" id="search" name="search" onclick="this.value=''" class="input" /> 
						<a href="#" onclick="document.tsearchForm.submit();"><img src="/images/common/tbtn_sch.gif" alt="검색" /></a>
					</div>
</form>					
				</div>
				<div class="clrboth"></div>
				<div>
					<h1 class="hlogo"><a href="/"><img src="/images/common/h_logo.gif" alt="한국석유공사" /></a></h1>
					<div class="topmenu">
						<ul id="topul">
							<li id="gnb01">
								<div id="tm1"><a href="/sub01/submain.jsp"><img src="/images/common/t_menu1.gif" alt="공사소개" border="0" name="tmon1" id="tmon1" onmouseover="msover(1);" onmouseout="msout(1);" onfocus="msover(1);"  onblur="msout(1);" /></a></div>
								<ul class="sub" id="sub1">
									<li class="tsleft"></li>
<%
	String gNavMenuDepth1 = (String)application.getAttribute("gNavMenuDepth1");
	String gNavMenuDepth2 = (String)application.getAttribute("gNavMenuDepth2");
	String gNavMenuDepth3 = (String)application.getAttribute("gNavMenuDepth3");
	String gNavMenuDepth4 = (String)application.getAttribute("gNavMenuDepth4");

	ArrayList topmenu1 = MenuMa.getMenu1List("01");	
	int t = 1;
	Iterator itertm = topmenu1.iterator();
	while(itertm.hasNext()){		
		MenuBean tmb = (MenuBean)itertm.next();
%>		
									<li><a href="<%=tmb.getUrl()%>"><%=tmb.getName()%></a></li>
<%		if (t < topmenu1.size()) {	%>
									<li class="tsbar"></li>
<%		}	
		t++;
	}	%>																		
									<li class="tsright"></li>
								</ul>
							</li>
							<li id="gnb02">
								<div id="tm2"><a href="/sub02/submain.jsp"><img border="0" id="tmon2" onmouseover="msover(2);"  onfocus="msover(2);"onmouseout="msout(2);" onblur="msout(2);" src="/images/common/t_menu2.gif" alt="열린경영" /></a></div>
								<ul class="sub" id="sub2">
									<li class="tsleft"></li>
<%
	ArrayList topmenu2 = MenuMa.getMenu1List("02");	
	t = 1;
	itertm = topmenu2.iterator();
	while(itertm.hasNext()){		
		MenuBean tmb = (MenuBean)itertm.next();
%>									
									<li><a href="<%=tmb.getUrl()%>"><%=tmb.getName()%></a></li>
<%		if (t < topmenu2.size()) {	%>
									<li class="tsbar"></li>
<%		}	
		t++;
	}	%>									
									<li class="tsright"></li>
								</ul>
							</li>
							<li id="gnb03">
								<div id="tm3"><a href="/sub03/submain.jsp"><img id="tmon3" onmouseover="msover(3);" onfocus="msover(3);" onmouseout="msout(3);" border="0" onblur="msout(3);" src="/images/common/t_menu3.gif" alt="사업소개" /></a></div>
								<ul class="sub" id="sub3">
									<li class="tsleft"></li>
<%
	ArrayList topmenu3 = MenuMa.getMenu1List("03");	
	t = 1;
	itertm = topmenu3.iterator();
	while(itertm.hasNext()){		
		MenuBean tmb = (MenuBean)itertm.next();
%>									
									<li><a href="<%=tmb.getUrl()%>"><%=tmb.getName()%></a></li>
<%		if (t < topmenu3.size()) {	%>
									<li class="tsbar"></li>
<%		}	
		t++;
	}	%>									
									<li class="tsright"></li>
								</ul>
							</li>
							<li id="gnb04">
								<div id="tm4"><a href="/sub04/submain.jsp"><img id="tmon4" onmouseover="msover(4);"  onfocus="msover(4);" onblur="msout(4);" border="0" onmouseout="msout(4);" src="/images/common/t_menu4.gif" alt="고객참여" /></a></div>
								<ul class="sub" id="sub4">
									<li class="tsleft"></li>
<%
	ArrayList topmenu4 = MenuMa.getMenu1List("04");	
	t = 1;
	itertm = topmenu4.iterator();
	while(itertm.hasNext()){		
		MenuBean tmb = (MenuBean)itertm.next();
%>									
									<li><a href="<%=tmb.getUrl()%>"><%=tmb.getName()%></a></li>
<%		if (t < topmenu4.size()) {	%>
									<li class="tsbar"></li>
<%		}	
		t++;
	}	%>
									<li class="tsright"></li>
								</ul>
							</li>
							<li id="gnb05">
								<div id="tm5"><a href="/sub05/submain.jsp"><img id="tmon5" onmouseover="msover(5);" onfocus="msover(5);" onmouseout="msout(5);" border="0" onblur="msout(6);" src="/images/common/t_menu5.gif" alt="정보마당" /></a></div>
								<ul class="sub" id="sub5">
									<li class="tsleft"></li>
<%
	ArrayList topmenu5 = MenuMa.getMenu1List("05");	
	t = 1;
	itertm = topmenu5.iterator();
	while(itertm.hasNext()){		
		MenuBean tmb = (MenuBean)itertm.next();
%>									
									<li><a href="<%=tmb.getUrl()%>"><%=tmb.getName()%></a></li>
<%		if (t < topmenu5.size()) {	%>
									<li class="tsbar"></li>
<%		}	
		t++;
	}	%>
									<li class="tsright"></li>
								</ul>
							</li>
							<li id="gnb06">
								<div id="tm6"><a href="/sub06/submain.jsp"><img id="tmon6" onmouseover="msover(6);" onfocus="msover(6);" onmouseout="msout(6);" border="0" onblur="msout(7);" src="/images/common/t_menu6.gif" alt="석유기술연구" /></a></div>
								<ul class="sub" id="sub6">
									<li class="tsleft"></li>
<%
	ArrayList topmenu6 = MenuMa.getMenu1List("06");	
	t = 1;
	itertm = topmenu6.iterator();
	while(itertm.hasNext()){		
		MenuBean tmb = (MenuBean)itertm.next();
%>									
									<li><a href="<%=tmb.getUrl()%>"><%=tmb.getName()%></a></li>
<%		if (t < topmenu6.size()) {	%>
									<li class="tsbar"></li>
<%		}	
		t++;
	}	%>
									<li class="tsright"></li>
								</ul>
							</li>
							<li id="gnb07">
								<div id="tm7"><a href="/sub07/submain.jsp"><img id="tmon7" onmouseover="msover(7);" onfocus="msover(7);"onmouseout="msout(7);" border="0" onblur="msout(8);" src="/images/common/t_menu7.gif" alt="어린이" /></a></div>
								<ul class="sub" id="sub7">
									<li class="tsleft"></li>
<%
	ArrayList topmenu7 = MenuMa.getMenu1List("07");	
	t = 1;
	itertm = topmenu7.iterator();
	while(itertm.hasNext()){		
		MenuBean tmb = (MenuBean)itertm.next();
%>									
									<li><a href="<%=tmb.getUrl()%>"><%=tmb.getName()%></a></li>
<%		if (t < topmenu7.size()) {	%>
									<li class="tsbar"></li>
<%		}	
		t++;
	}	%>
									<li class="tsright"></li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
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
</script>
<% if (!gNavMenuDepth1.equals("00") && !gNavMenuDepth1.equals("08") && !gNavMenuDepth1.equals("09") && !gNavMenuDepth1.equals("10")) { %>
<script type="text/javascript"> msinit('<%=Integer.parseInt(gNavMenuDepth1)%>');</script>
<% } %>
<script type="text/javascript"> initNavigation(<%=Integer.parseInt(gNavMenuDepth1)%>);</script>
