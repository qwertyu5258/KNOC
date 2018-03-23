<%@page import="com.neoboard.NeoBoardManager"%>
<%@page import="kr.co.knoc.sinmungo.ArticleManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.knoc.util.FileUpload"%>
<%@page import="java.util.HashMap"%>
<%@page import="kr.co.knoc.sinmungo.SinmungoUserManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>    
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","04");
	application.setAttribute("gNavMenuDepth2","05");
	application.setAttribute("gNavMenuDepth3","02");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	
	boolean isMaster = false;
	boolean isUser = false;

	if(session.getAttribute("SINMUNGO_STATUS_NO") != null){
		if(session.getAttribute("SINMUNGO_STATUS_NO").toString().trim().equals("1")){
			isMaster = true;
		}else if(session.getAttribute("SINMUNGO_STATUS_NO").toString().trim().equals("2")){
			isUser = true;
		} 
	}
	
	String returnUrl = "";
	String returnMsg = "";
	int resultCnt = -1;
	
	if(isMaster){
		
		/**
		 * 2016.3.21 JSM
		 * 보안약점 조치
		 */	
		String sinmungo_id = etcutil.checkNull((String)session.getAttribute("SINMUNGO_ID"));
		
		SinmungoUserManager userManager = new SinmungoUserManager();
		boolean isUserPasswordCheck = userManager.getIsUserPassword(session.getAttribute("SINMUNGO_ID").toString().trim(),etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("old_user_pwd"))));
		
		
		if(isUserPasswordCheck){
			resultCnt = userManager.updateUserPwd(sinmungo_id.trim(), etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("user_pwd"))));
		} 
		
		 
		
		if(resultCnt > -1){ 
			returnMsg = "Password has been fixed. Password is "+request.getParameter("user_pwd")+".";
			//returnUrl = "/sinmungo/main.jsp";
		}else{
			returnMsg = "Information is incorrect. Please re-enter the information.";
			//returnUrl = "/sinmungo/password.jsp";
		} 
	
	}
	
%>

<script type="text/javascript">
<!--
	if(!<%=isMaster %>){
		alert("You do not have permission to access.");
		window.close();
	}
	alert("<%=returnMsg %>");	
	
	window.close();
//-->
</script>


