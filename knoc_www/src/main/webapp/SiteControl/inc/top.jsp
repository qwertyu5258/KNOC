<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="mgrHelper" class="kr.co.knoc.sitectrl.mgr.MgrHelper" scope="page" />
<%
	kr.co.knoc.sitectrl.mgr.MgrSession ses = (kr.co.knoc.sitectrl.mgr.MgrSession)session.getAttribute("ADMINSESSION");
	String userLevel = "";
	if (ses != null) {
		userLevel = ses.getUserLevel();
	}
%>
<html>
<head>
<title>한국석유공사 관리자사이트</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="/SiteControl/share/css/admin.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/share/js/jquery-ui-1.11.1.custom/jquery-ui.min.css" />
<script type="text/javascript" src="/share/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="/share/js/jquery-ui-1.11.1.custom/jquery-ui.min.js"></script>
<script type="text/javascript" src="/share/js/datepicker.js"></script>
<script language="javascript" src="/share/js/common.js"></script>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #ffffff;
}
.style12 {color: #FFFFFF;}
.style2 {color: #FF9900}
.style4 {color: #FF9900; font-weight: bold; }
.style6 {color: #FF6600}
.style7 {color: #FF6600; font-weight: bold; }
.style9 {color: #003399; font-weight: bold; }
.style10 {color: #999999}
.style11 {
	color: #5884B8;
	font-weight: bold;
}
.style1 {color: #ff8a00}
-->
</style>
<%
/** 세션 중복 검사 **/

/**
* 2016. 03. 21 / MYM
* 보안약점 조치
*/
String userSession = "";
String dbUserSession = "";
if(ses != null) {
	userSession = ses.getUserSession();
	kr.co.knoc.sitectrl.mgr.MgrDO dbMgr = mgrHelper.queryMgr(ses.getId());
	dbUserSession = dbMgr.getUserSession();
}

if(userSession != null && dbUserSession != null && !userSession.equals(dbUserSession)) {
	%>
<script type="text/javascript">
alert("동일한 아이디로 중복 로그인하였습니다.");
location.replace("/SiteControl/logout.jsp");
</script>
	<%
	return;
}
%>

<script type="text/javascript">
// https가 아닐경우 다시 https 으로 만듬
/*
	var str = document.location.href;
	var str1 = str.substring(0, str.indexOf(":"));
	var str2 = str.substring(str.indexOf(":"));

	if(str1 != "https"){
		str1 = "https" + str2;	
		document.location.href = str1;
	}
	*/
</script>

</head>

<body leftmargin=0 topmargin=0>
<table width="98%" height="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
<td height="80" valign="top">
	<table width="100%" height="80"  border="0" cellpadding="0" cellspacing="0">
	<tr>
	<td width="230" align="center"><a href="/SiteControl/index.jsp" onfocus="this.blur();"><img src="/SiteControl/images/admin_logo.gif" width="301" height="46"  border="0"></a></td>
	<td align="right">
		<table width="440" height="30" border="0" cellpadding="0" cellspacing="0">
		<tr>
		<td width="300">최근접속 : <%=ses.getLastLoginDateTime()%> (<%=ses.getIp()%>)</td>
		<td width="70"><img src="/SiteControl/images/admin_tophome.gif" width="9" height="10"><a href="/index.jsp" onfocus="this.blur();"><strong>HOME</strong></a></td>
		<td width="70"><img src="/SiteControl/images/admin_toplogout.gif" width="7" height="10"> <a href="/SiteControl/logout.jsp" onfocus="this.blur();"><span class="style4">로그아웃</span></a> </td>
		</tr>
		</table>
	</td>
	</tr>
	</table>
</td>
</tr>
<tr>
<td height="44" valign="top">
	<table width="100%" height="44"  border="0" cellpadding="0" cellspacing="0">
<% if (userLevel.equals("1")) { %>
	<tr>
	<!-- td width="8%" height="35" background="/SiteControl/images/admin_top_01.gif"></td-->
	<td width="14%" align="center" background="/SiteControl/images/admin_top_01.gif"><span class="style2"><!-- img src="/SiteControl/images/admin_left_04.gif" width="2" height="11"--> <a href="/SiteControl/manager/adminList.jsp" onfocus="this.blur();"><span class="style12"><b>관리자 관리</b></span></a>
	<!-- img src="/SiteControl/images/admin_left_04.gif" width="2" height="11"--> </span></td>
	<td width="14%" align="center" background="/SiteControl/images/admin_top_01.gif"><span class="style2"><!-- img src="/SiteControl/images/admin_left_04.gif" width="2" height="11"--> <a href="/SiteControl/member/memberList.jsp" onfocus="this.blur();"><span class="style12"><b>회원 관리</b></span></a>
	<!-- img src="/SiteControl/images/admin_left_04.gif" width="2" height="11"--> </span></td>
	<td width="14%" align="center" background="/SiteControl/images/admin_top_01.gif"><span class="style2"><!-- img src="/SiteControl/images/admin_left_04.gif" width="2" height="11"--> <a href="/SiteControl/content/menuList.jsp" onfocus="this.blur();"><span class="style12"><b>메뉴 관리</b></span></a>
	<!-- img src="/SiteControl/images/admin_left_04.gif" width="2" height="11"--> </span></td>
	<td width="14%" align="center" background="/SiteControl/images/admin_top_01.gif"><span class="style2"><!-- img src="/SiteControl/images/admin_left_04.gif" width="2" height="11"--> <a href="/SiteControl/neoboard/board_02.jsp" onfocus="this.blur();"><span class="style12"><b>게시판 관리</b></span></a>
	<!-- img src="/SiteControl/images/admin_left_04.gif" width="2" height="11"--> </span></td>
	<td width="14%" align="center" background="/SiteControl/images/admin_top_01.gif"><span class="style2"><!-- img src="/SiteControl/images/admin_left_04.gif" width="2" height="11"--> <a href="/SiteControl/etc/surveyList.jsp" onfocus="this.blur();"><span class="style12"><b>기타 관리</b></span></a>
	<!-- img src="/SiteControl/images/admin_left_04.gif" width="2" height="11"--> </span></td>
	<td width="16%" align="center" background="/SiteControl/images/admin_top_01.gif"><span class="style2"><!-- img src="/SiteControl/images/admin_left_04.gif" width="2" height="11"--> <a href="/awstats/awstats.pl" onfocus="this.blur();"><span class="style12"><b>로그/트래픽 관리</b></span></a>
	<!-- img src="/SiteControl/images/admin_left_04.gif" width="2" height="11"--> </span></td>
	<td width="14%" align="center" background="/SiteControl/images/admin_top_01.gif"><span class="style2"><!-- img src="/SiteControl/images/admin_left_04.gif" width="2" height="11"--> <a href="/SiteControl/mobile/event_manager.jsp" onfocus="this.blur();"><span class="style12"><b>모바일관리</b></span></a>
	<!-- img src="/SiteControl/images/admin_left_04.gif" width="2" height="11"--> </span></td>
	</tr>
<% } else if (userLevel.equals("5")) { %>
	<tr>
	<!-- td width="8%" height="35" background="/SiteControl/images/admin_top_01.gif"></td-->
	<td width="50%" align="center" background="/SiteControl/images/admin_top_01.gif"><span class="style2"><!-- img src="/SiteControl/images/admin_left_04.gif" width="2" height="11"--> <a href="/SiteControl/neoboard/board_02.jsp" onfocus="this.blur();"><span class="style12"><b>게시판 관리</b></span></a>
	<!-- img src="/SiteControl/images/admin_left_04.gif" width="2" height="11"--> </span></td>
	<td width="50%" align="center" background="/SiteControl/images/admin_top_01.gif"><span class="style2"><!-- img src="/SiteControl/images/admin_left_04.gif" width="2" height="11"--> <a href="/SiteControl/etc/surveyList.jsp" onfocus="this.blur();"><span class="style12"><b>기타 관리</b></span></a>
	<!-- img src="/SiteControl/images/admin_left_04.gif" width="2" height="11"--> </span></td>
	</tr>
<% } %>
	<tr>
	<td height="8"></td>
	<td></td>
	</tr>
	</table>
</td>
</tr>
<tr>
<td valign="top" >