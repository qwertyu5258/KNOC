<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.co.knoc.util.EtcUtil" %>
<%@ page import="kr.co.knoc.mgr.*" %>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<jsp:useBean id="mgrHelper" class="kr.co.knoc.mgr.MgrHelper" scope="page" />
<% request.setCharacterEncoding("euc-kr"); %>
<%!
	String getSession(HttpSession session, String attrName)
	{
	    return session.getAttribute(attrName) != null ? (String)session.getAttribute(attrName) : "";
	}
%>
<%	
	String id = "guest";
	String name = getSession(session, "realName");
	String virtualno = getSession(session, "virtualNo");
	String return_url = "obmChoice.jsp";
	
	

	MgrDO mgr = new MgrDO();
	mgr.setId(id);
	mgr.setLevel("8");
	mgr.setName(name);
	mgr.setVirtualno(virtualno);
	MgrSession ses = new MgrSession(mgr);
	// 세션 설정
	session.setAttribute("USERSESSION",ses);
	session.setAttribute("virtualno",virtualno);
	session.setAttribute("name",name);
	session.setAttribute("SINMUNGO_STATUS_NO", "2");
	// G-PIN 세션 제거	
	session.setAttribute("dupInfo", null);
	session.setAttribute("virtualNo", null);
	session.setAttribute("realName", null);
	session.setAttribute("sex", null);
	session.setAttribute("age", null);
	session.setAttribute("birthDate", null);
	session.setAttribute("nationalInfo", null);
	session.setAttribute("authInfo", null);     
	session.setAttribute("GPIN_AQ_SERVICE_SITE_USER_CONFIRM", null);	
%>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<script type="text/javascript">
	alert("<%=name%>님 환영합니다.");
<%
	out.println("location.href='" + return_url +"'");
%>
</script>