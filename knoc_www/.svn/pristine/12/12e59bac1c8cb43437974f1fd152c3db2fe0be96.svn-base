<%@page import="kr.co.knoc.secure.SecureDBUtil"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.co.knoc.util.EtcUtil" %>
<%@ page import="kr.co.knoc.mgr.*" %>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<jsp:useBean id="mgrHelper" class="kr.co.knoc.mgr.MgrHelper" scope="page" />
<%
	request.setCharacterEncoding("euc-kr");
	
	String id = EtcUtil.strBlockSpecialTags(request.getParameter("id"),"8859_1");
	String passwd = EtcUtil.strBlockSpecialTags(request.getParameter("passwd"),"8859_1");
	String return_url = EtcUtil.strBlockSpecialTags(request.getParameter("return_url"),"8859_1");

	MgrDO mgr = mgrHelper.queryMgr(id);
	//out.println(mgr.getPasswd());
	//if(mgr==null || !mgr.getPasswd().equals(mgrHelper.getMd5Passwd(passwd))) {
	
	/*
	if(mgr==null || !mgr.getPasswd().equals( SecureDBUtil.crypto.encrypt("knoc", "member", "password", passwd) )) {
		
		%><stl:msgBack msg="아이디 또는 비밀번호가 일치하지 않습니다."/><%
		return;
	}
	*/
	
	/* 마지막 로그인 날짜 업데이트 */
	mgrHelper.updateLastLogin(id);
	
	MgrSession ses = new MgrSession(mgr);
	// 세션 설정
	session.setAttribute("USERSESSION",ses);
	// gpin 유저아이디를 guest로 생성 레벨 8세션생성
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
	<title>로그인 처리 페이지 입니다.</title>
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
	<meta http-equiv="cache-control" content="no-cache" /><meta http-equiv="pragma" content="no-cache" />
	<link rel="stylesheet" type="text/css" href="/include/css/board.css" />
	<link rel="stylesheet" type="text/css" href="/include/css/common.css" />
    <link rel="stylesheet" type="text/css" href="/include/css/sub.css" />
    <link rel="stylesheet" type="text/css" href="/include/css/subpage.css" />
</head>
<body>
<script type="text/javascript">
	alert("<%=ses.getUserID()%>님 환영합니다.");

<%
	out.println("location.href='/sub08/submain.jsp'");
%>
</script><noscript><%=ses.getUserID()%>님 환영합니다. <a href="/sub08/submain.jsp" title="메인 페이지로 이동합니다.">[Go]</a>를 선택하시면 메인 페이지로 이동합니다.</noscript>
</body>
</html>



