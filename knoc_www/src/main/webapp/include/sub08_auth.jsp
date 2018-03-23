<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.co.knoc.mgr.*" %>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>    
<%
	MgrSession isa_ses = (MgrSession)session.getAttribute("USERSESSION");
	if (isa_ses == null) {
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
	<title>비밀번호 확인</title>
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
	<meta http-equiv="cache-control" content="no-cache" /><meta http-equiv="pragma" content="no-cache" />
<link rel="stylesheet" type="text/css" href="/include/css/sub.css" />
<link rel="stylesheet" type="text/css" href="/include/css/board.css" />
<link rel="stylesheet" type="text/css" href="/include/css/common.css" />
<link rel="stylesheet" type="text/css" href="/include/css/sub.css" />
<link rel="stylesheet" type="text/css" href="/include/css/subpage.css" />
</head>
<body>
<stl:msgBack msg="이사회 회원 로그인을 하셔야만 이용 가능하십니다."/>
</body>
</head>
<%		
	} else {
		if (!isa_ses.getUserLevel().equals("7")) {
			%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
	<title>비밀번호 확인</title>
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
	<meta http-equiv="cache-control" content="no-cache" /><meta http-equiv="pragma" content="no-cache" />
<link rel="stylesheet" type="text/css" href="/include/css/sub.css" />
<link rel="stylesheet" type="text/css" href="/include/css/board.css" />
<link rel="stylesheet" type="text/css" href="/include/css/common.css" />
<link rel="stylesheet" type="text/css" href="/include/css/sub.css" />
<link rel="stylesheet" type="text/css" href="/include/css/subpage.css" />
</head>
<body>			
			<stl:msgBack msg="이사회 회원만 이용 가능하십니다."/>
</body>
</head>
			<%					
		}
	}
%>