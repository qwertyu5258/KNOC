<%@page import="com.neoboard.NeoBoardManager"%>
<%@page import="kr.co.knoc.sinmungo.ArticleManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.knoc.util.FileUpload"%>
<%@page import="java.util.HashMap"%>
<%@page import="kr.co.knoc.sinmungo.SinmungoUserManager"%>
<%@ page import = "kr.co.knoc.util.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>   
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" /> 
<% request.setCharacterEncoding("euc-kr"); %>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","04");
	application.setAttribute("gNavMenuDepth2","05");
	application.setAttribute("gNavMenuDepth3","03");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	
	
	ArticleManager articleManager = new ArticleManager();
	SinmungoUserManager userManger = new SinmungoUserManager();
	
	
	
	
	
	HashMap requestData = new HashMap();	
	
	
	int resultCnt = 0;
	int file_nid = Integer.parseInt(request.getParameter("file_nid"));
	int article_nid = Integer.parseInt(request.getParameter("article_nid"));
	String returnUrl = "/ombudsman/modify.jsp?article_nid="+article_nid;
	String returnMsg = "";
	//System.out.println(requestData.toString());
	resultCnt = articleManager.deleteFileArticle(file_nid, article_nid);	 
	
	 
	if(resultCnt > -1){ 
		returnMsg = "삭제 되었습니다.";
	}else{
		returnMsg = "삭제 중 에러가 발생하였습니다.";
	}
%>

<script type="text/javascript">
<!--

	alert("<%=returnMsg %>");	
	location.href = "<%=etcutil.strBlockSpecialTags(returnUrl) %>"; 
		
//-->
</script>


