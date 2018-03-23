<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>한국석유공사 관리자사이트</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" type="text/css" href="/include/css/board.css" />
<link rel="stylesheet" type="text/css" href="/include/css/common.css" />
</head>
<body leftmargin=0 topmargin=0>
<%System.out.println(request.getServletPath()); %>

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

<neo:neoboardFacade parentUri="<%=request.getServletPath()%>" mode="list" bid="base" adminURL="/SiteControl" sessionName="ADMINSESSION"/>
</body>
</html>