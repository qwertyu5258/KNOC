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
	
		
		
		SinmungoUserManager userManager = new SinmungoUserManager();
		boolean isUserPasswordCheck = userManager.getIsUserPassword(etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("old_user_pwd"))));
		
		
		if(isUserPasswordCheck){
			resultCnt = userManager.updateUserPwd(1, etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("user_pwd"))), etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("phone").toString())),  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("email").toString())));
		} 
		
		 
		
		if(resultCnt > -1){ 
			returnMsg = "수정 되었습니다. \\n다시 로그인 해 주세요.";
			returnUrl = "/sinmungo/main.jsp";
		}else{
			returnMsg = "정보가 틀립니다. 다시 입력 해 주세요.";
			returnUrl = "/sinmungo/password.jsp";
		} 
	
	}
	
%>

<script type="text/javascript">
<!--
	if(!<%=isMaster %>){
		alert("접근 권한이 없습니다.");
		location.href = "/sinmungo/main.jsp";
	}
	alert("<%=returnMsg %>");	
	
	location.href = "<%=returnUrl %>"; 
		
//-->
</script>


