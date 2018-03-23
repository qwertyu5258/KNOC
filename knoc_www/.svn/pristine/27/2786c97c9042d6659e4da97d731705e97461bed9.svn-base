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
	int sague_nid = Integer.parseInt(request.getParameter("sague_nid"));
	int comment_nid = Integer.parseInt(request.getParameter("comment_nid"));
	
	String returnUrl = "./board_04_view.jsp?sague_nid=" + sague_nid;
	String returnMsg = "";

	resultCnt = sagueManager.deleteCommentSague(sague_nid, comment_nid);	 
	
	 
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


