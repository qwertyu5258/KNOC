<%@page import="kr.co.knoc.sague.SagueManager"%>
<%@page import="com.neoboard.NeoBoardManager"%>
<%@page import="kr.co.knoc.sinmungo.ArticleManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.knoc.util.FileUpload"%>
<%@page import="java.util.HashMap"%>
<%@page import="kr.co.knoc.sinmungo.SinmungoUserManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>    
<% request.setCharacterEncoding("euc-kr"); %>
<% 
	
	SagueManager sagueManager = new SagueManager();
	
	int resultCnt = 0;
	int file_nid = Integer.parseInt(request.getParameter("file_nid"));
	int sague_nid = Integer.parseInt(request.getParameter("sague_nid"));
	String returnUrl = "./board_04_edit.jsp?sague_nid=" + sague_nid;
	String returnMsg = "";

	resultCnt = sagueManager.deleteFileSague(file_nid, sague_nid);	 
	
	 
	if(resultCnt > -1){ 
		returnMsg = "삭제 되었습니다.";
	}else{
		returnMsg = "삭제 중 에러가 발생하였습니다.";
	}
%>

<script type="text/javascript">
<!--

	alert("<%=returnMsg %>");	
	location.href = "<%=returnUrl %>"; 
		
//-->
</script>


