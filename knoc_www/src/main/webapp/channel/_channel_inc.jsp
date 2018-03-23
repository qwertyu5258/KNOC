<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.util.*" %>
<jsp:useBean id="ChannelMa_Inc" scope="page" class="kr.co.knoc.channel.ChannelManager" />
<%
	String _CHANNEL_USER = "knoc";
	String _CHANNEL_PWD = "greatknoc";

	String _CEO_USER = "";
	_CEO_USER = ChannelMa_Inc.getAdminId();
	String _CEO_PWD = "";
	_CEO_PWD = ChannelMa_Inc.getAdminPwd(_CEO_USER);


	System.out.println("_CEO_USER ==> "+_CEO_USER);
	System.out.println("_CEO_PWD ==> "+_CEO_PWD);

	// 2016. 02. 15 수정
	String _EMAIL_RECEIVERS = "moonkyu.suh@knoc.co.kr";
	String _EMAIL_RECEIVERS_NAME = "CEO";
	String _SMS_RECEIVERS = "01052832285";
	//변경 20130703 gs
	String _SMS_RECEIVERS_1 = "01098562340"; //손윤경  yunkyeong.son@knoc.co.kr


	String session_id = "";

	String channel_user_id = (String)session.getAttribute("channel_user_id");
	if(channel_user_id != null && channel_user_id.equals(_CEO_USER))
		session_id = channel_user_id;

%>