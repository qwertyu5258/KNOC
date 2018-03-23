<%@page import="kr.co.knoc.sague.SagueCommentBean"%>
<%@page import="kr.co.knoc.sague.SagueManager"%>
<%@page import="com.neoboard.NeoBoardManager"%>
<%@page import="kr.co.knoc.sinmungo.ArticleManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.knoc.util.FileUpload"%>
<%@page import="java.util.HashMap"%>
<%@page import="kr.co.knoc.sinmungo.SinmungoUserManager"%>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>    
<% request.setCharacterEncoding("euc-kr"); %>
<% 
	
	SagueManager sagueManager = new SagueManager();
	SagueCommentBean commentBean = new SagueCommentBean();	

	boolean result = false;
	int sague_nid = Integer.parseInt(request.getParameter("sague_nid"));
	String tel_no = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("tel_01"))) + "-" +
					etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("tel_02"))) + "-" +
					etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("tel_03")));
	
	commentBean.setSague_nid(sague_nid);
	commentBean.setUser_name(etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("user_name")))); 
	commentBean.setVertual_no(etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("vertuar_no"))));
	commentBean.setTel_no(tel_no);
	commentBean.setUser_opinion(etcutil.checkNull(request.getParameter("user_opinion")));
	String returnUrl = "./sub02_2_1_8_view.jsp?sague_nid=" + sague_nid;
	String returnMsg = "";
	
	result = sagueManager.insertCommentSague(commentBean);	 
	
	 
	if(result == true){ 
		returnMsg = "등록 되었습니다.";
	}else{
		returnMsg = "등록 중 에러가 발생하였습니다.";
	}
%>

<script type="text/javascript">
<!--

	alert("<%=returnMsg %>");	
	location.href = "<%=returnUrl %>"; 
		
//-->
</script>


