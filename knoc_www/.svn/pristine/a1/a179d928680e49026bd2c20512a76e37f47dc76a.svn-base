<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.neoboard.NeoBoardManager"%>
<%@page import="kr.co.knoc.sinmungo.ArticleManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.knoc.util.FileUpload"%>
<%@page import="java.util.HashMap"%>
<%@page import="kr.co.knoc.sinmungo.SinmungoUserManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>    
<% request.setCharacterEncoding("euc-kr"); %>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","04");
	application.setAttribute("gNavMenuDepth2","05");
	application.setAttribute("gNavMenuDepth3","02");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	
	FileUpload fileUpload = new FileUpload();
	ArticleManager articleManager = new ArticleManager();
	SinmungoUserManager userManger = new SinmungoUserManager();
	
	
	ServletContext context = request.getSession().getServletContext();
	String filePath = context.getRealPath("/upload/sinmungo/")+"/";//어플리케이션 경로 잡는거임.
	HashMap requestData = new HashMap();	
	ArrayList fileList = fileUpload.articleFile2(request, filePath, 10, requestData);
	
	int resultCnt = 0;
	String article_nid =requestData.get("article_nid").toString();
	String returnUrl = "/ENG/sinmungo/view.jsp?article_nid="+article_nid;
	String returnMsg = "";
	resultCnt = articleManager.updateArticle2(requestData, fileList, userManger.getUserInfo(1));	 
	 
	if(resultCnt > -1){ 
		//HashMap userMap = userManger.getMasterUserInfo();		
		//NeoBoardManager.insertSmsWait(userMap.get("PHONE").toString(), "1", "신문고에 글이 등록되었습니다.");
		returnMsg = "Has been corrected.";
	}else{
		returnMsg = "Modification of error has occurred.";
	}
%>

<script type="text/javascript">
<!--

	alert("<%=returnMsg %>");	
	location.href = "<%=returnUrl %>"; 
		
//-->
</script>


