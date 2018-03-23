<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.co.knoc.util.*"%>
<%@ page import="kr.co.knoc.mgr.*"%>    
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="MgrMa" scope="page" class="kr.co.knoc.mgr.MgrHelper" />		
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
	<title>회원탈퇴 처리 페이지 입니다.</title>
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
	<meta http-equiv="cache-control" content="no-cache" /><meta http-equiv="pragma" content="no-cache" />
	<link rel="stylesheet" type="text/css" href="/include/css/board.css" />
	<link rel="stylesheet" type="text/css" href="/include/css/common.css" />
    <link rel="stylesheet" type="text/css" href="/include/css/sub.css" />
    <link rel="stylesheet" type="text/css" href="/include/css/subpage.css" />
</head>
<body>
<%   
	MgrSession mem_ses = (MgrSession)session.getAttribute("USERSESSION");
	String userid = "";
	if (mem_ses == null) {
%>
<script type="text/javascript">
	alert("로그인 하신 후 이용 가능하십니다.");
	history.back();
</script><noscript>로그인 하신 후 이용 가능하십니다. <a href="login.jsp" title="로그인 페이지로 이동합니다.">[GO]</a>를 선택하시면 로그인 페이지로 이동합니다.</noscript>
<%		
		return;		
	} else {
		userid = mem_ses.getUserID();
	}
   	
   	if (userid == null || userid.equals("")) {
%>
<script type="text/javascript">
		alert("잘못된 호출입니다.");
		history.back();
</script><noscript>잘못된 호출입니다. <a href="secession.jsp" title="회원탈퇴 페이지로 이동합니다.">[GO]</a>를 선택하시면 회원탈퇴 페이지로 이동합니다.</noscript>	
<%   	
		return;
   	}   	
	
	boolean result = MgrMa.deleteMgr(userid);   		
	
	if (!result) {
%>
<script type="text/javascript">
	alert("회원탈퇴가 실패하였습니다.");
	history.back();
</script><noscript>회원탈퇴가 실패하였습니다.<a href="secession.jsp" title="회원탈퇴 페이지로 이동합니다.">[GO]</a>를 선택하시면 회원탈퇴 페이지로 이동합니다.</noscript>
<%
		return;
	} else {
		session.removeAttribute("USERSESSION");
		session.invalidate();	
%>
<script type="text/javascript">
	alert("회원탈퇴가 완료되었습니다.");
    location.href = "/index.jsp";
</script><noscript>회원탈퇴가 완료되었습니다.<a href="/index.jsp" title="메인 페이지로 이동합니다.">[GO]</a>를 선택하시면 메인 페이지로 이동합니다.</noscript>
<% 	
  	}
%>
</body>
</html>
