<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.util.*" %>    
<%@ page import="kr.co.knoc.util.*"%>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />    
<%@include file="_channel_inc.jsp"%>
<%
	String id = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("id")));
	String password = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("passwd")));
	if(id.equals(_CHANNEL_USER) && password.equals(_CHANNEL_PWD)){
		channel_user_id = id;
		session_id = "";
		session.setAttribute("channel_user_id",channel_user_id);
%> 
<script type="text/javascript">
	location.href="channel_guide.jsp";
</script>
<%		  
		return; 
	}
	else if(id.equals(_CEO_USER) && password.equals(_CEO_PWD)){
		channel_user_id = id;
		session_id = "";
		session.setAttribute("channel_user_id",channel_user_id);
%>
<script type="text/javascript">
	 
	location.href="channel_list.jsp"; 
</script>
<%		
		return;
	}
	else {
%>		
<script type="text/javascript">
	alert("아이디 또는 패스워드가 일치하지 않습니다.");
	location.href="channel_login.jsp";
</script>
<% 
	}
%>
   
  
