<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.co.knoc.sitectrl.mgr.*" %>    
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<sctrl:auth loginPage="login.jsp" sessionName="ADMINSESSION"/>    
<%
	MgrSession ses = (MgrSession)session.getAttribute("ADMINSESSION");
	String userLevel = ""; 
	if (ses != null) {
		userLevel = ses.getUserLevel();		
	}
%>
<script type="text/javascript">
<% if (userLevel.equals("1")) { %>
	location.href = "/SiteControl/manager/adminList.jsp";
<% } else if (userLevel.equals("5")) { %>
	location.href = "/SiteControl/neoboard/board_02.jsp";
<% } %>
</script>