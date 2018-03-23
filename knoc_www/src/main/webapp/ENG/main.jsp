<%@ page language="java" contentType="text/html; charset=EUC-KR"    pageEncoding="EUC-KR"%>
<%
/**
* 2015.12.24
* 작성자 : 마용민
* 내  용 : 영문 메인 개편 및 캐시 해지를 위해서 상단에 주석을 작성하였습니다.
*/
%>
<%@page import="kr.co.knoc.banner.BannerBean"%>
<%@page import="kr.co.knoc.prroom.PrRoomBean"%>
<%@page import="java.util.Calendar"%>
<%@ page import="kr.co.knoc.domestic.xml.OilDateXmlParser"%>
<%@ page import="kr.co.knoc.mgr.MgrSession"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="kr.co.knoc.term.WebzineBean"%>
<%@ page import = "kr.co.knoc.util.*"%>
<%@ page import = "kr.co.knoc.etc.*"%>
<%@ page import = "kr.co.knoc.popup.*"%>
<%@ page import = "kr.co.knoc.content.*"%>
<%@ page import = "kr.co.knoc.jdbc.DBUtil"%>
<%@ page import = "kr.co.knoc.petronet.*"%>
<jsp:useBean id="PopNewMa" scope="page" class="kr.co.knoc.popup.PopupNewManager" />
<jsp:useBean id="PopMa" scope="page" class="kr.co.knoc.popup.PopupManager" />
<jsp:useBean id="BoardMa" scope="page" class="kr.co.knoc.etc.BoardLimit" />
<jsp:useBean id="MainMa" scope="page" class="kr.co.knoc.etc.MainCountManager" />
<jsp:useBean id="PetronetMa" scope="page" class="kr.co.knoc.petronet.PetronetManager" />
<jsp:useBean id="PetronetMa2" scope="page" class="kr.co.knoc.petronet.PetronetManager2" />
<jsp:useBean id="TermMa" scope="page" class="kr.co.knoc.term.WebzineManager" />
<jsp:useBean id="pp" class="kr.co.knoc.tags.pager.PageProperty" scope="request"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="MenuMa" scope="page" class="kr.co.knoc.content.EngMenuManager" />
<jsp:useBean id="prm" scope="page" class="kr.co.knoc.prroom.PrRoomManager" />
<%@ page import = "kr.co.knoc.koroil.*"%>
<jsp:useBean id="KoilMa" scope="page" class="kr.co.knoc.koroil.KoilManager" />
<jsp:useBean id="BannerMa" scope="page" class="kr.co.knoc.banner.BannerManager" />
<%
String gNavMenuDepth1 = (String)application.getAttribute("gNavMenuDepth1");
String gNavMenuDepth2 = (String)application.getAttribute("gNavMenuDepth2");
String gNavMenuDepth3 = (String)application.getAttribute("gNavMenuDepth3");
String gNavMenuDepth4 = (String)application.getAttribute("gNavMenuDepth4");
String pTitle = "";	
if (gNavMenuDepth1 != null) {
	if (gNavMenuDepth1.equals("00")) {
		pTitle = "Welcome to Korea National Oil Corporation";	
	} else {
		if (gNavMenuDepth1.equals("01")) {
			pTitle = "Who we are";
		} else if (gNavMenuDepth1.equals("02")) {
			pTitle = "Corporate Responsibility";
		} else if (gNavMenuDepth1.equals("03")) {
			pTitle = "Operations";
		} else if (gNavMenuDepth1.equals("04")) {
			pTitle = "Investor Relations";
		} else if (gNavMenuDepth1.equals("05")) {
			pTitle = "Service";
		} else if (gNavMenuDepth1.equals("06")) {
			pTitle = "E&P Technology Institute";
		}
		pTitle = pTitle + MenuMa.getMenuName(gNavMenuDepth1+gNavMenuDepth2+gNavMenuDepth3+gNavMenuDepth4);
	}
}
%> 
<%
String nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page")),"8859_1");
pp.setPage(nowpage);
pp.setPageSize("10");
pp.setPageUrl("");

///////////////국내,외 유가 ////////////////////////////////

//오늘날짜
Calendar oCalendar = Calendar.getInstance();  
int year = oCalendar.get(Calendar.YEAR);
int month = oCalendar.get(Calendar.MONTH) + 1;
int day = oCalendar.get(Calendar.DAY_OF_MONTH);
int hour = oCalendar.get(Calendar.HOUR_OF_DAY);

Calendar petrobCalendar = Calendar.getInstance();  
petrobCalendar.add(Calendar.DAY_OF_MONTH,-1);// 이전날짜로 먼저 셋팅한 후에 날짜 구함 
int petrobyear = petrobCalendar.get(Calendar.YEAR);
int petrobday =petrobCalendar.get(Calendar.DAY_OF_MONTH);
int petrobmonth = petrobCalendar.get(Calendar.MONTH) + 1;
int petrobhour = petrobCalendar.get(Calendar.HOUR_OF_DAY);

String currentDate = Integer.toString(year) + String.format("%02d", month) + String.format("%02d", day);

String petrobcurrentDate = Integer.toString(petrobyear) + String.format("%02d", petrobmonth) + String.format("%02d", petrobday); 
String[] weekDay={"SUN","MON","TUE","WED","THU","FRI","SAT"};
//국내 유가
KoilManager koil = new KoilManager();
HashMap hash = koil.getKoroilView();
KoroilBean korb = null;
 
if(hash.containsKey("korBean")){
	 korb = (KoroilBean)hash.get("korBean");	
}

if(!currentDate.equals(korb.getAccess_date())){
	KorInsert.updateKor(); //access_date 갱신(국내유가 DB를 가져오지 못하더라도 더이상 호출되지 않도록 하기 위함)
	KoroilBean kb = KoilMa.getKoroil();   //국내유가 DB에 등록 
	hash = koil.getKoroilView();
	korb = (KoroilBean)hash.get("korBean");
}

//국제 유가 
PetronetManager2 petronet = new PetronetManager2();
PetronetBean pb = null;
HashMap hash2 = petronet.getPetroView();
if(hash2.containsKey("petroBean")){
	pb = (PetronetBean)hash2.get("petroBean");	
} 
String toWeekDay=weekDay[petrobCalendar.get(Calendar.DAY_OF_WEEK)-1];
//if("TUE".equals(toWeekDay) || "WED".equals(toWeekDay) || "THU".equals(toWeekDay) ||"FRI".equals(toWeekDay)
//		|| "SAT".equals(toWeekDay)){ // 매주 화~토 오전 9시 기점으로 1회만 
	if(!currentDate.equals(pb.getAccess_date())){
			PetronetInsert.updatePetronet(); //access_date 갱신(국제유가 DB를 가져오지 못하더라도 더이상 호출되지 않도록 하기 위함)
		  	pb = PetronetMa2.getPetronet();  //국제유가 DB에 등록
			hash2 = petronet.getPetroView();
			pb = (PetronetBean)hash2.get("petroBean");
	}
//}

ArrayList al = TermMa.getTermList(pp.getNPage(), pp.getNPageSize());	
WebzineBean pb3 = new WebzineBean();

Iterator iter2 = al.iterator();
String path = "";
String url = "";
while(iter2.hasNext()){
	pb3 = (WebzineBean)iter2.next();
	url = pb3.getLink_url() ;
	path = pb3.getImg_path(); 																				
}
%>
<%@ page import = "java.sql.Connection"%>
<%@ page import = "java.sql.PreparedStatement"%>
<%@ page import = "java.sql.ResultSet"%>
<%@ page import = "java.sql.Statement"%>
<% request.setCharacterEncoding("euc-kr"); %>    
<% 
/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Page Navigator section
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
application.setAttribute("gNavMenuDepth1","00");
application.setAttribute("gNavMenuDepth2","00");
application.setAttribute("gNavMenuDepth3","00");
application.setAttribute("gNavMenuDepth4","00");
/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/

if(MainMa.getTodayAccessCount("/index.jsp") > 0){
	MainMa.updateAccessCount("/index.jsp");
}else{
	MainMa.insertAccessCount("/index.jsp");
}

String gets = "";
if(request.getQueryString() != null){
		gets = "?"+request.getQueryString();
}
String currentPage = request.getRequestURL()+gets; 
if (currentPage == null || currentPage.equals("")) {
	currentPage = "/";
}

/*	포스트방식 파라메터
StringBuffer sb = new StringBuffer();
for (Enumeration en = request.getParameterNames(); en.hasMoreElements();) {
	String key = (String)en.nextElement();
	sb.append(key+"="+request.getParameter(key)+"&");
}
String paramStr = sb.toString();
paramStr = paramStr.substring(0, paramStr.length()-1);
*/

MgrSession ses = (MgrSession)session.getAttribute("USERSESSION");
String uid = "";
String userlevel = "9";
if (ses != null) {
	uid = ses.getUserID();
	userlevel = ses.getUserLevel();
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<meta http-equiv="X-UA-Compatible" content="IE=10,chrome=1" />
<title>Korea National Oil Corporation</title>
<link href="/ENG/share/css/import.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/ENG/share/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="/ENG/share/js/jcarousellite-1.8.7.min.js"></script>
<script type="text/javascript" src="/ENG/share/js/jquery.fadeVisual-0.2.min.js"></script>
<script type="text/javascript" src="/ENG/share/js/jquery.smenu-0.1.1.min.js"></script>
<script type="text/javascript" src="/ENG/share/js/comm.js"></script>
<script type="text/javascript">
//<![CDATA[
$(function() {
	
});

/* cookie */
function getCookie(name) {
	var nameOfCookie = name + "=";
	var x = 0;
	while(x <= document.cookie.length) {
		var y = (x+nameOfCookie.length);
		if(document.cookie.substring(x, y) == nameOfCookie) {
			if((endOfCookie=document.cookie.indexOf(";", y)) == -1) {
				endOfCookie = document.cookie.length;
			}
			return unescape(document.cookie.substring(y, endOfCookie));
		}
		x = document.cookie.indexOf(" ", x) + 1;
		if(x == 0) {
			break;
		}
	}
	return "";
} 

function setCookie(name, value, expiredays) {
	var todayDate = new Date();
	todayDate.setDate(todayDate.getDate() + expiredays);
	document.cookie = name + "=" + escape( value ) + "; path=/; domain=knoc.co.kr; expires=" + todayDate.toGMTString() +";"
}

/* mobile */
var mobileKeyWords = new Array('iPhone', 'iPod', 'BlackBerry', 'Android', 'Windows CE', 'LG', 'MOT', 'SAMSUNG', 'SonyEricsson', 'Symbian', 'Opera');
for(var word in mobileKeyWords) {
	if(navigator.userAgent.match(mobileKeyWords[word]) != null) {
		location.href = "http://m.knoc.co.kr";
		break;
    }
}
//]]>
</script>
</head>
<body class="font_size1 main">
<!-- wrap -->
<div id="wrap" class="main">
	<!-- header -->
	<div id="header">
		<!-- top_area -->
    	<div class="top_area">

			<!-- top_util -->
        	<ul class="top_util">
			<li><a href="#container"><img src="/ENG/img/btn/btn_go_container.png" alt="View Contents" /></a></li>
			<li>
				<div class="font_size">
					<span class="hidden">Text size</span>
					<button type="button" onclick="zoomInPage()" class="zoom_in"><span class="hidden">Text size large</span></button>
					<button type="button" onclick="zoomOutPage()" class="zoom_out"><span class="hidden">Text size smaller</span></button>
				</div>
			</li>
			<li><button type="button" onclick="printPage()" class="btn_print"><span class="hidden">Print</span></button></li>
            </ul>
            <!-- //top_util -->

			<!-- top_quick_menu -->
            <p class="top_quick_menu">
                <a href="/ENG/main.jsp">Home</a>
                <span class="arrow">I</span>
                <a href="/ENG/sub05/sub05_4.jsp">Contact Us</a>
                <span class="arrow">I</span>
                <a href="/ENG/sitemap/sitemap.jsp">Sitemap</a>
            </p>
            <!-- //top_quick_menu -->

			<!-- language -->
            <div class="language">
				<form name="language_form" method="post" action="http://www.knoc.co.kr/" target="_blank" onclick="return submitLanguageForm(this)" title="새창">
				<select id="langs" name="langs" class="langs" title="Select Language">
				<option value="">Language</option>
				<option value="http://www.knoc.co.kr/">Korean</option>
                </select>
				<button type="submit"><img src="/ENG/img/btn/btn_select.png" alt="Go" /></button>
				</form>
            </div>
			<!-- //language -->

        </div>
        <!-- //top_area -->

		<!-- core_area -->
        <div class="core_area">
        	<h1><a href="/ENG/main.jsp"><img src="/ENG/img/common/logo.png" alt="Korea National Oil Corporation" title="Korea National Oil Corporation" /></a></h1>
			<!-- search_area -->
            <div class="search_area">
                <form name="search_form" method="post" action="/ENG/search/list.jsp"> 
				<div>
					<fieldset>
					<legend>Search</legend>
					<input type="text" name="search" title="Enter search term"  class="search_input" />
					<input type="image" src="/ENG/img/btn/btn_search.png" alt="Search" class="btn_search" />
					</fieldset>
				</div>
                </form>
            </div>
			<!-- //search_area -->
        </div>
		<!-- //core_area -->

        <!-- gnb -->
        <div id="gnb">
            <span class="bg">
            	<span></span>
            </span>
            <button type="button" onclick="closeGnb()" class="btn_gnb_close"><span class="hidden">닫기</span></button>
            <ul>          
			<li class="gnb01">
				<a href="/ENG/sub01/sub01_1_1.jsp"><span class="hidden">About us</span></a>
				<ul>
				<% 
				ArrayList al01_to = MenuMa.getMenuList("01","Y");	
				Iterator titer_to = al01_to.iterator();
				int i_to = 1;
				while(titer_to.hasNext()) {		
					EngMenuBean mb = (EngMenuBean)titer_to.next();
					ArrayList al01s = MenuMa.getMenu1List(mb.getMCode().substring(0,2));
					if (mb.getMCode() != null && mb.getMCode().substring(4,8).equals("0000")) { %>											
				<li><a href="<%=mb.getUrl() %>" title="<%=mb.getName() %>"><%=mb.getName() %></a></li> 
				<%			
						i_to = i_to + 1;
					}	
				} 
				%>
				</ul>    
			</li>
			<li class="gnb02">
				<a href="/ENG/sub03/sub03_1_1_6.jsp"><span class="hidden">Operations</span></a>
				<ul>
				<% 
				ArrayList al03_to = MenuMa.getMenuList("03","Y");	
				titer_to = al03_to.iterator();
				i_to = 1;
				while(titer_to.hasNext()) {		
					EngMenuBean mb = (EngMenuBean)titer_to.next();
					ArrayList al03s = MenuMa.getMenu1List(mb.getMCode().substring(0,2));
					if (mb.getMCode() != null && mb.getMCode().substring(4,8).equals("0000")) {	%>										
				<li><a href="<%=mb.getUrl() %>" title="<%=mb.getName() %>"><%=mb.getName() %></a></li> 
				<%
						i_to = i_to + 1;
					}	
				}
				%>
				</ul>    
			</li>
			<li class="gnb03">
				<a href="/ENG/sub04/sub04_1_1.jsp"><span class="hidden"> Investor Relations</span></a>
				<ul>
				<% 
				ArrayList al04_to = MenuMa.getMenuList("04","Y");	
				titer_to = al04_to.iterator();
				i_to = 1;
				while(titer_to.hasNext()) {		
					EngMenuBean mb = (EngMenuBean)titer_to.next();
					ArrayList al04s = MenuMa.getMenu1List(mb.getMCode().substring(0,2));
					if (mb.getMCode() != null && mb.getMCode().substring(4,8).equals("0000")) {	%>						
				<li><a href="<%=mb.getUrl() %>" title="<%=mb.getName() %>"><%=mb.getName() %></a></li>
				<%
						i_to = i_to + 1;
					}	
				}
				%>	
				</ul>    
			</li>
			<li class="gnb04">
				<a href="/ENG/sub02/sub02_1_1_1.jsp"><span class="hidden">Corporate Responsibility </span></a>
				<ul>
				<% 
				ArrayList al02_to = MenuMa.getMenuList("02","Y");	
				titer_to = al02_to.iterator();
				i_to = 1;
				while(titer_to.hasNext()) {		
					EngMenuBean mb = (EngMenuBean)titer_to.next();
					ArrayList al02s = MenuMa.getMenu1List(mb.getMCode().substring(0,2));
					if (mb.getMCode() != null && mb.getMCode().substring(4,8).equals("0000")) {	
				%>							
				<li><a href="<%=mb.getUrl() %>" title="<%=mb.getName() %>"><%=mb.getName() %></a></li>
				<%			
						i_to = i_to + 1;
					}	
				}
				%>			
				</ul>    
			</li>
			<li class="gnb05">
				<a href="/ENG/sub05/sub05_2.jsp"><span class="hidden">Service</span></a>
				<ul>
				<% 
				ArrayList al05_to = MenuMa.getMenuList("05","Y");	
				titer_to = al05_to.iterator();
				i_to = 1;
				while(titer_to.hasNext()) {		
					EngMenuBean mb = (EngMenuBean)titer_to.next();
					ArrayList al05s = MenuMa.getMenu1List(mb.getMCode().substring(0,2));
					if (mb.getMCode() != null && mb.getMCode().substring(4,8).equals("0000")) {	
				%>
				<li><a href="<%=mb.getUrl() %>" title="<%=mb.getName() %>"><%=mb.getName() %></a></li>
				<%			
						i_to = i_to + 1;
					}		
				}
				%>	
				</ul>    
			</li>
			<!-- li class="gnb06">
				<a href="/ENG/sub06/sub06_1_1.jsp"><span class="hidden">E&amp;P Technology Institute </span></a>
				<ul>
				<% 
				ArrayList al06_to = MenuMa.getMenuList("06","Y");	
				titer_to = al06_to.iterator();
				i_to = 1;
				while(titer_to.hasNext()){
					EngMenuBean mb = (EngMenuBean)titer_to.next();
					ArrayList al06s = MenuMa.getMenu1List(mb.getMCode().substring(0,2));
					if (mb.getMCode() != null && mb.getMCode().substring(4,8).equals("0000")) {		
				%>				
				<li><a href="<%=mb.getUrl() %>" title="<%=mb.getName() %>"><%=mb.getName() %></a></li>				
				<%			
						i_to = i_to + 1;
					}		
				}
				%>	
				</ul>
			</li-->
            </ul>        	
        </div>
		<!-- //gnb -->
    </div>
    <!-- //header -->

    <div id="container">
    	<h2 class="hidden">본문영역</h2>

    	<!-- main_contents -->
    	<div class="main_contents">
        	<!-- News room -->
            <div class="main_board tab">
            	<ul>
				<li>
					<p>News Room</p>
					<%@include file="/ENG/include/petronet_news.jsp" %>
					<a href="http://www.petronet.co.kr/KNOC/list.jsp" target="_blank" class="btn_more" title="새창">
					<span class="hidden">more</span></a>
				</li>
                </ul>
            </div>
            <!-- //News room -->

            <!-- Domestic/World -->
            <div id="oil_tab" class="main_oil tab01">
            	<ul>
				<li class="on">
					<a href="#domestic_oil">Domestic</a>
					<div id="domestic_oil">
						<ul class="depth2">
						<li class="on">
							<a href="#domestic_retail_price">Retail Price</a>
							<div id="domestic_retail_price">
								<p><%=korb.getRecentdt().substring(0,4)+"."+korb.getRecentdt().substring(4,6)+"."+korb.getRecentdt().substring(6,8) %> (￦/L)</p>
								<table border="0" cellspacing="0" cellpadding="0" class="tbl_domestic" summary="Domestic Retail Price">
								<caption>Domestic Retail Price</caption>
								<colgroup>
								<col width="50%" />
								<col width="25%" />
								<col width="25%" />
								</colgroup>										  
								<tbody>
									<tr>
										<th scope="row"><a href="http://www.opinet.co.kr/" target="_blank" title="새창">Gasoline</a></th>
										<td><%=korb.getGas_num() %></td>
										<td>
											<% if(korb.getGas_rate().indexOf("+")!=-1) { %>
											<img src="/images/main/ico_up.png" class="png24" alt="상승" />
											<%=korb.getGas_rate()!=null && (korb.getGas_rate()).length() > 1 ? (korb.getGas_rate()).substring(1,(korb.getGas_rate()).length()):"" %>
											<% } else { %>
											<img src="/images/main/ico_down.png" class="png24" alt="하락" />
											<%=korb.getGas_rate()!=null && (korb.getGas_rate()).length() > 1 ? (korb.getGas_rate()).substring(1,(korb.getGas_rate()).length()):"" %>
											<% } %> 
										</td>												 
									</tr>
									<tr>
										<th scope="row"><a href="http://www.opinet.co.kr/" target="_blank" title="새창">Diesel</a></th>
										<td><%=korb.getVia_num() %></td>
										<td>
											<% if(korb.getVia_rate().indexOf("+")!=-1) { %>
											<img src="/images/main/ico_up.png" class="png24" alt="상승" />
											<%=korb.getVia_rate()!=null && (korb.getVia_rate()).length() > 1 ? (korb.getVia_rate()).substring(1,(korb.getVia_rate()).length()):"" %>
											<% } else { %>
											<img src="/images/main/ico_down.png" class="png24" alt="하락" />
											<%=korb.getVia_rate()!=null && (korb.getVia_rate()).length() > 1 ? (korb.getVia_rate()).substring(1,(korb.getVia_rate()).length()):"" %>
											<% } %> 
										</td>
									</tr>
									<tr>
										<th scope="row"><a href="http://www.opinet.co.kr/" target="_blank" title="새창">Auto LPG</a></th>
										<td><%=korb.getButain_num() %></td>
										<td>
											<% if(korb.getButain_rate().indexOf("+")!=-1) { %>
											<img src="/images/main/ico_up.png" class="png24" alt="상승" />
											<%=korb.getButain_rate()!=null && (korb.getButain_rate()).length() > 1 ? (korb.getButain_rate()).substring(1,(korb.getButain_rate()).length()):"" %>
											<% } else { %>
											<img src="/images/main/ico_down.png" class="png24" alt="하락" />
											<%=korb.getButain_rate()!=null && (korb.getButain_rate()).length() > 1 ? (korb.getButain_rate()).substring(1,(korb.getButain_rate()).length()):"" %>
											<% } %> 
										</td>
									</tr>	
								</tbody>
								</table>
							</div>
						</li>						
						</ul>
					</div>
					<a href="http://www.petronet.co.kr/v3/index.jsp" target="_blank" title="새창" class="btn_more"><span class="bline">더보기</span></a>
				</li>
				<li>
					<a href="#world_oil">World</a>
					<div id="world_oil">
						<ul class="depth2">
						<li class="on">
							<a href="#world_futures">Futures</a>
							<div id="world_futures">
								<p><% if (pb.getRecentDt() != null && !pb.getRecentDt().equals("")) { %><%=pb.getRecentDt().substring(0,4) %>.<%=pb.getRecentDt().substring(4,6) %>.<%=pb.getRecentDt().substring(6,8) %><% } %> ($/bbl)</p>
								<table border="0" cellspacing="0" cellpadding="0" class="tbl_domestic" summary="World Futures">
								<caption>World Futures</caption>
								<colgroup>
								<col width="50%" />
								<col width="25%" />
								<col width="25%" />
								</colgroup>										  
								<tbody>
								<tr>
									<th scope="row" class="left"><a href="http://www.petronet.co.kr/" target="_blank" title="새창"><%=pb.getOils1Name()%></a></th>
									<td><%=pb.getOils1Num() %></td>
									<td><%=pb.getOils1Img() %></td>
								</tr>
								<tr>
									<th scope="row" class="left"><a href="http://www.petronet.co.kr/" target="_blank" title="새창"><%=pb.getOils2Name()%></a></th>
									<td><%=pb.getOils2Num() %></td>
									<td><%=pb.getOils2Img() %></td>
								</tr>																		 
								</tbody>
								</table>
							</div>
						</li>						
						</ul>
					</div>
					<a href="http://www.petronet.co.kr/v3/index.jsp" target="_blank" title="새창" class="btn_more"><span class="bline">더보기</span></a>
				</li>
                </ul>
            </div>
            <!-- //Domestic/World -->
            
            <!-- main_visual -->
            <div class="main_visual">
            	<div class="fade-visual">
                    <ul>
					<li><img src="/ENG/img/main/main_visual01.png" alt="main visual -  Begin a New Journey, Embrace Valuable Challenges 다시 출발! 가치있는 도전!" /></li>
                    </ul>
                </div>
            </div>
            <!-- //main_visual -->
            
             <!-- E&P Worldwide -->
            <div class="main_mining">
            	<h3>E&amp;P Worldwide</h3>
                <div>
                	<form name="mining_form" action="" method="post" onsubmit="return submitMiningForm(this)">
					<select class="main_minings" id="main_minings" name="main_minings" title="Select Countries">
					<option value="">Select Countries</option>
					<option value="N13">America</option>
					<option value="N1">Asia and Oceania</option>
					<option value="N14">Africa</option>
					<option value="N7">Europe</option>
					<option value="N12">Middle East</option>
					</select>
					
					<select class="main_minings02" id="main_minings02" name="main_minings02" title="Select Mine Lot">
					<option value="">Select Mine Lot</option>
					</select>
					<button type="submit"><img src="/ENG/img/btn/btn_golink.png" alt="Go" /></button>
					</form>
                </div>
            </div>
            <!-- //E&P Worldwide -->
                     
            <!-- main_banner01 -->
            <div class="main_banner01">
            	<ul>

<% 
  // 영문 메인관리
  String str = "";

  ArrayList arr_prm = prm.getPrRoomList();
  Iterator it_prm = arr_prm.iterator();
  while(it_prm.hasNext()) {
	  PrRoomBean pr = (PrRoomBean)it_prm.next();
	  str += pr.getUrl() + ":";	 
  }
  String[] engMainUrl  =  str.split(":");
  
%>            	
				<li class="bg01"><a href="<%=engMainUrl[0] %>" class="btn_open_popup size_405x350" target="_blank" title="새창">Video</a></li>
				<li class="bg02"><a href="<%=engMainUrl[1] %>" target="_blank" title="새창">Brochure</a></li>
				<li class="bg03"><a href="<%=engMainUrl[2] %>" target="_blank" title="새창">News letter</a></li>
				<li class="bg04"><a href="<%=engMainUrl[3] %>" target="_blank" title="새창">Co. magazine</a></li>
                </ul>
            </div>
            <!-- //main_banner01 -->
            
			<!-- main_banner02 -->
            <div class="main_banner02">
            	<ul>
				<li class="bg01"><a href="/ENG/sub01/sub01_1_1.jsp">About us</a></li>
				<li class="bg02"><a href="/ENG/sub03/sub03_1_1_6.jsp">Operations</a></li>
				<li class="bg03"><a href="/ENG/sub04/sub04_1_1.jsp">Investor Relations</a></li>
				<li class="bg04"><a href="/ENG/sub05/sub05_2.jsp">Service</a></li>
                </ul>
            </div>
            <!-- //main_banner02 -->            
            
            <!-- main_banner03 -->
            <div id="main_banner03" class="main_banner03">
            	<ul>
				<li class="img01 on">
					<a href="/ENG/sub03/sub03_1_1_6.jsp">
						<span class="img_area"></span>
						E&amp;P worldwide
					</a>
				</li>
				<li class="img02">
					<a href="/ENG/sub03/sub03_3_1_1.jsp">
						<span class="img_area"></span>
						Oil Stockpiling Projects &amp; <br /> Improvement of Petroleum <br />Distribution Structure
					</a>
				</li>
				<li class="img03">
					<a href="/ENG/sub03/sub03_5_1.jsp">
						<span class="img_area"></span>
						Rig Business Projects
					</a>
				</li>
				<li class="img04">
					<a href="/ENG/sub03/sub03_2_1.jsp">
						<span class="img_area"></span>
						Construction Projects
					</a>
				</li>
				<li class="img05">
					<a href="/ENG/sub03/sub03_6_1.jsp">
						<span class="img_area"></span>
						Oil Information
					</a>
				</li>
                </ul>
            </div>
            <!-- //main_banner03 -->           
        </div>
        <!-- //main_contents -->
    </div>

	<!-- footer -->
    <div id="footer">
		<!-- footer_banner -->
    	
		<!-- //footer_banner -->
        <!-- footer_wrap -->
        <div class="footer_wrap">
        	<div class="qr"><img src="/ENG/img/common/qr.png" alt="qr코드" /></div>
            <p class="addr">
            	305,JONGGA-RO, JUNG-GU, ULSAN, Republic of Korea(44538)<span class="arrow">I</span><span class="tel">TEL +82)52-216-2114</span><span class="arrow">I</span>FAX +82)52-216-5900
            </p>
            <p class="copy">
            	COPYRIGHT (C) BY KOREA NATIONAL OIL CORPORATION. ALL RIGHTS RESERVED.
            </p>
            
            <div class="footer_banner">
	        	<div class="footer_banner_area">
	                <ul>
	                <%
					ArrayList bannerList = BannerMa.getBanner("ENG");
					Iterator bannerIt = bannerList.iterator();
					while(bannerIt.hasNext()) {
						BannerBean bb = (BannerBean)bannerIt.next();
						%>
					<li><a href="<%=bb.getLinkUrl()%>" target="<%=bb.getLinkType()%>" title="<%=bb.getAlttext()%>"><img src="/upload/BANNER/<%=bb.getNewFilename()%>" width="112" height="30" alt="<%=bb.getAlttext()%>" /></a></li>
						<%
					} %>
	                </ul>
	            </div>
	            <div class="roll_control">
	            <%	if(bannerList.size() > 1 ){ 	%>	            
	                <button type="button" class="footer_banner_prev"><span class="hidden">이전</span></button>
	                <button type="button" class="footer_banner_next"><span class="hidden">다음</span></button>
            	<% 	} 	%>
	            </div>

       	 	</div>
       	    
        </div>
		<!-- //footer_wrap -->
    </div>
	<!-- //footer -->
</div>
<!-- //wrap -->
</body>
</html>
