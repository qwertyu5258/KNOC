<%@page import="com.neoboard.util.EtcUtil"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");

	session.removeAttribute("USERSESSION");
	session.invalidate();	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
	<title>로그아웃 처리 페이지 입니다.</title>
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
	<meta http-equiv="cache-control" content="no-cache" /><meta http-equiv="pragma" content="no-cache" />
	<link rel="stylesheet" type="text/css" href="/include/css/board.css" />
	<link rel="stylesheet" type="text/css" href="/include/css/common.css" />
    <link rel="stylesheet" type="text/css" href="/include/css/sub.css" />
    <link rel="stylesheet" type="text/css" href="/include/css/subpage.css" />
</head>
<body>
<script type="text/javascript" language="javascript">
	function returnUrl(){
		location.href='<%=EtcUtil.DOMAIN_URL %>';
	}

	window.setTimeout(returnUrl,1000);
</script><noscript>로그아웃 되었습니다. 메인페이지로 가시려면 <a href="/index.jsp" title="메인 페이지로 이동합니다.">[GO]</a>를 선택하세요</noscript>
</body>
</html>