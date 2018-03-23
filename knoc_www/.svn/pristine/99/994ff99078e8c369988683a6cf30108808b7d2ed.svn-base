<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.neoboard.data.*,com.neoboard.*,com.neoboard.session.*" %>
<%@taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>

<% 
	NeoBoardMsgRedirect msg = (NeoBoardMsgRedirect)request.getAttribute("WRITEDETAIL");
	if(msg == null) {
	%><script language=javascript>history.back();</script><%
	}
	else {
	%><neo:msgRedirect msg="<%=msg.getMsg()%>" url="<%=msg.getUrl() %>" /><% 
	}
%>
