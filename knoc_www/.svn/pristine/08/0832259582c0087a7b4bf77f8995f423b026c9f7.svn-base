<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.content.*"%>
<%@ page import = "java.util.*"%>
<jsp:useBean id="MainMa" scope="page" class="kr.co.knoc.etc.MainCountManager" />
<jsp:useBean id="MenuMa" scope="page" class="kr.co.knoc.content.EngMenuManager" />    
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
				pTitle = "Business Performance";
			} else if (gNavMenuDepth1.equals("05")) {
				pTitle = "Service";
			} else if (gNavMenuDepth1.equals("06")) {
				pTitle = "E&P Technology Institute";
			}
			pTitle = pTitle + MenuMa.getMenuName(gNavMenuDepth1+gNavMenuDepth2+gNavMenuDepth3+gNavMenuDepth4);
		}
	}
	
	String mcode = gNavMenuDepth1+gNavMenuDepth2+gNavMenuDepth3+gNavMenuDepth4;
	String page_lang = "ENG";

	if(MainMa.getTodayMenuAccessCount(mcode, page_lang) > 0){
		MainMa.updateMenuAccessCount(mcode, page_lang);
	}else{
		MainMa.insertMenuAccessCount(mcode, page_lang);
	}
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko">
<head>
	<title>Korea National Oil Corporation</title>
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="pragma" content="no-cache" />
	
	<link rel="stylesheet" type="text/css" href="../css/common_2011.css" />
	<link rel="stylesheet" href="../css/maincss.css" type="text/css" />
	<link rel="stylesheet" href="../css/sub.css" type="text/css" title="PRDOM CSS" />
	<link rel="stylesheet" href="../css/sub01.css" type="text/css" title="PRDOM CSS" />
	<link rel="stylesheet" href="../css/sub02.css" type="text/css" title="PRDOM CSS" />
	<link rel="stylesheet" href="../css/sub04.css" type="text/css" title="PRDOM CSS" />
	<link rel="stylesheet" href="../css/sub05.css" type="text/css" title="PRDOM CSS" />
	<link rel="stylesheet" href="../css/sub06.css" type="text/css" title="PRDOM CSS" />
	<link rel="stylesheet" href="../css/sitemap.css" type="text/css" title="PRDOM CSS" />
	<link rel="stylesheet" href="../css/board.css" type="text/css" title="PRDOM CSS" />
	
	<link href="/ENG/share/css/import.css" rel="stylesheet" type="text/css" />
	
	<script type="text/javascript" src="/ENG/share/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="/ENG/share/js/jcarousellite-1.8.7.min.js"></script>
	<script type="text/javascript" src="/ENG/share/js/jquery.fadeVisual-0.2.min.js"></script>
	<script type="text/javascript" src="/ENG/share/js/jquery.smenu-0.1.1.min.js"></script>
	<script type="text/javascript" src="/ENG/share/js/comm.js"></script>

	<!-- <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  -->
	<script type="text/javascript" src="/include/js/java.js"></script>
	<script type="text/javascript" src="/include/js/common.js"></script>
	<script type="text/javascript" src="/share/js/common.js"></script>	
	<script type="text/javascript" src="/include/js/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="/include/js/jquery.ba-dotimeout.min.js"></script>
	<script type="text/javascript" src="/include/js/jquery.bxslider.js"></script>
	<script type="text/javascript" charset="euc-kr" src="/ENG/include/topmenu_2011.js"></script>
	<script type="text/javascript" charset="euc-kr" src="/include/js/viewall.js"></script>
	<script type="text/javascript" src="/include/js/topScrollNew.js"></script>

</head>

<body>
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

<div id="wrapper">
	<div id="content_area">
		<!-- header start -->
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
				
		
		<hr />
		<div style="clear:both ; height:50px ;"></div>

		<!-- 서브 퀵메뉴
		<div id="gotop">
			<script type="text/javascript">initializequick('gotop','1000','200','100');</script>
			<ul>
				<li><a href="#facebook" onclick="facebook();return;" ><img src="/images/2012/q_facebook.png" alt="facebook view"/></a></li>
				<li><a href="#twitter" onclick="twiter();return;"><img src="/images/2012/q_twitter.png" alt="twitter view" /></a></li>
				<li><a href="http://www.opinet.co.kr/"><img src="/ENG/images/2012/q_m2.gif" alt="opinet" /></a></li>
				<li><a href="http://www.petronet.co.kr/"><img src="/ENG/images/2012/q_m3.gif" alt="petronet" /></a></li>
				<li><a href="#top" class="blur" onclick="ScrollTop();"><img src="/images/2012/q_top.png" alt="top" /></a></li>
			</ul>
		</div>
		-->
		
	<div id="sns_tab01" style="width:355px ;display:none; height:370px ; position:absolute ; right:0 ; top:330px ;">
		<div class="sns_twitterlist">
			<script src='http://widgets.twimg.com/j/2/widget.js' charset="utf-8"></script>
			<script type="text/javascript">
				new TWTR.Widget({
			        version: 2,
			         type: 'profile',
			         search: 'profile',// 수정필요
			        interval: 2000,
			      //  title: 'slimQstyle',
			       // subject: '석유공사',
			        width: 350,
			        height: 280,
			        theme: {
			          shell: {
			            background: '#D9D9D9',
			            color: '#ffffff'
			          },
			          tweets: {
			            background: '#ffffff',
			            color: 'gray',
			            links: '#1985b5'
			          }
			        },
			        features: {
			          scrollbar: true,
			          loop: false,
			          live: true,
			          hashtags: true,
			          timestamp: true,
			          avatars: true,
			          toptweets: true,
			          behavior: 'default'
			        }
			      }).render().setUser('KNOC_PR').start(); // 계정요청
			</script>
		</div>  
	</div>
	<div id="sns_tab02" style="width:355px ;display:none; height:280px ; position:absolute ; right:0 ; top:250px ; background:#fff ;">
		<div id="fb-root"></div>
		<script type="text/javascript">
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id)) return;
			js = d.createElement(s); js.id = id;
			js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
		</script>
		
		<div class="fb-like-box sns_facebooklist" data-href="http://www.facebook.com/KNOC.PR" data-width="350" data-height="280" data-show-faces="true" data-stream="true" data-header="true"></div> 
	</div> 

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
</div>
</div>
<!-- top end-->