<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.neoboard.data.*,com.neoboard.*,com.neoboard.session.*" %>
<%@taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>

<% 
	NeoBoardError err = (NeoBoardError)request.getAttribute("ERRORDETAIL");
	if(err == null) {
	%><script language=javascript>history.back();</script><%
	}
	else {
	%><neo:msgBack msg="<%=err.getErrorMsg()%>" /><% 
	}
%>
