<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.util.*" %>    
<%@ page import="kr.co.knoc.util.*"%>
<%@ page import = "kr.co.knoc.postbox.*"%>
<jsp:useBean id="PostBoxMa" scope="page" class="kr.co.knoc.postbox.PostBoxManager" />
<%
	String _CHANNEL_USER = "knoc";
	String _CHANNEL_PWD = "clean3020";

	String _CEO_USER = "";
	_CEO_USER = PostBoxMa.getAdminId();
	String _CEO_PWD = "";
	_CEO_PWD = PostBoxMa.getAdminPwd(_CEO_USER);
	
	String _EMAIL_RECEIVERS = "yjh6600@knoc.co.kr";
	String _EMAIL_RECEIVERS_NAME = "ADMIN";
	String _SMS_RECEIVERS = "01041872165";
	
	
	String session_id = "";
	
	String channel_user_id = (String)session.getAttribute("channel_user_id");
	if(channel_user_id != null && channel_user_id.equals(_CEO_USER))
		session_id = channel_user_id;
	
%>