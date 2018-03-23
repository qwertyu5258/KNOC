<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.content.*"%>
<jsp:useBean id="MainMa" scope="page" class="kr.co.knoc.etc.MainCountManager" />
<jsp:useBean id="MenuMa" scope="page" class="kr.co.knoc.content.MenuManager" />    
<%
	String gNavMenuDepth1 = (String)application.getAttribute("gNavMenuDepth1");
	String gNavMenuDepth2 = (String)application.getAttribute("gNavMenuDepth2");
	String gNavMenuDepth3 = (String)application.getAttribute("gNavMenuDepth3");
	String gNavMenuDepth4 = (String)application.getAttribute("gNavMenuDepth4");
	String pTitle = "";	
	String pTitle01 = "";
	if (gNavMenuDepth1 != null) {
		if (gNavMenuDepth1.equals("00")) {
			pTitle = " 석유공사 홈페이지에 오신것을 환영합니다. ";	
		} else {
			if (gNavMenuDepth1.equals("01")) {
				pTitle01 = "공사소개";
			} else if (gNavMenuDepth1.equals("02")) {
				pTitle01 = "열린경영";
			} else if (gNavMenuDepth1.equals("03")) {
				pTitle01 = "사업소개";
			} else if (gNavMenuDepth1.equals("04")) {
				pTitle01 = "고객참여";
			} else if (gNavMenuDepth1.equals("05")) {
				pTitle01 = "정보마당";
			} else if (gNavMenuDepth1.equals("06")) {
				pTitle01 = "석유기술연구";
			} else if (gNavMenuDepth1.equals("07")) {
				pTitle01 = "어린이";
			} else if (gNavMenuDepth1.equals("08")) {
				pTitle01 = "이사회";
			} else if (gNavMenuDepth1.equals("09")) {
				pTitle01 = "기타서비스";
			} else if (gNavMenuDepth1.equals("10")) {
				pTitle01 = "사이트검색";
			} else if (gNavMenuDepth1.equals("12")) {
				pTitle01 = "인재개발센터";
			}
			pTitle = MenuMa.getMenuName2(gNavMenuDepth1+gNavMenuDepth2+gNavMenuDepth3+gNavMenuDepth4);
			if (!pTitle.equals("")) {
				pTitle += " < ";
			}
			pTitle += pTitle01;
		}
	}

	String mcode = gNavMenuDepth1+gNavMenuDepth2+gNavMenuDepth3+gNavMenuDepth4;	
	String page_lang = "KOR";
	
	if(!"000000".equals(mcode.substring(2,8))){
		if(MainMa.getTodayMenuAccessCount(mcode, page_lang) > 0){
			MainMa.updateMenuAccessCount(mcode, page_lang);
		}else{
			MainMa.insertMenuAccessCount(mcode, page_lang);
		}
	}

%>        
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
	<meta http-equiv="cache-control" content="no-cache" /><meta http-equiv="pragma" content="no-cache" />	
	<title>한국석유공사 - <%=pTitle.replaceAll("<"," &lt;") %></title>
		
	<link rel="stylesheet" type="text/css" href="/include/css/board.css" />
	<link rel="stylesheet" type="text/css" href="/include/css/common.css" />
    <link rel="stylesheet" type="text/css" href="/include/css/sub.css" />
    <link rel="stylesheet" type="text/css" href="/include/css/subpage.css" />
    
    <link href="/share/css/import.css" rel="stylesheet" type="text/css" />

	<script type="text/javascript" src="/share/js/jquery-1.8.3.min.js"></script>
	<script type='text/javascript' src="/share/js/jcarousellite-1.8.7.min.js"></script>
	<script type="text/javascript" src="/share/js/jquery.fadeVisual-0.3.min.js"></script>
	<script type="text/javascript" src="/share/js/jquery.smenu-0.1.1.min.js"></script>
	<script type="text/javascript" src="/include/js/java.js"></script>
	
	<script type="text/javascript" src="/share/js/comm.js"></script>
	
	<script type="text/javascript" src="/include/js/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="/include/js/jquery.ba-dotimeout.min.js"></script>
	<script type="text/javascript" src="/include/js/jquery.bxslider.js"></script>
	
	<!--[if lte IE 7]><link rel="stylesheet" type="text/css" href="/include/css/ie7.css" /><![endif]-->
	<!--[if IE 6]><link rel="stylesheet" type="text/css" href="/include/css/ie6.css" /><![endif]-->
	
	<script type="text/javascript" src="/include/js/common.js"></script>
	<script type="text/javascript" src="/share/js/common.js"></script>

	<script type="text/javascript" src="/include/js/tab.js"></script>
	<script type="text/javascript" src="/include/js/urlEncodingDecoding.js"></script>
	<!--script type="text/javascript" src="/include/js/prototype.js"></script-->
	<!-- <script type="text/javascript" src="/voicemonds/voicemonDS.js"></script> -->
		
	<script type="text/javascript" charset="euc-kr" src="/include/js/topmenu_2011.js"></script>  	 	 	
	<script type="text/javascript" charset="euc-kr" src="/include/js/viewall.js"></script>
	<script type="text/javascript" src="/include/js/topScrollNew.js"></script>

