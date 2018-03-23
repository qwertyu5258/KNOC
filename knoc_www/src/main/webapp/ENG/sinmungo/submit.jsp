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
	String realPath = context.getRealPath("/upload/sinmungo/")+"/";//어플리케이션 경로 잡는거임.
	
	HashMap requestData = new HashMap();	
	ArrayList fileList = fileUpload.articleFile(request, realPath, 10, requestData);

	int resultCnt = 0;
	String returnUrl = "/ENG/sinmungo/notice.jsp";
	String returnMsg = "";
	resultCnt = articleManager.insertArticleEn(requestData, fileList, userManger.getUserInfo(1));	 
	
	 
	if(resultCnt > -1){ 
		//HashMap userMap = userManger.getMasterUserInfo();		
		//NeoBoardManager.insertSmsWait(userMap.get("PHONE").toString(), "1", "신문고에 글이 등록되었습니다.");
		returnMsg = "Has been registered.";
	}else{
		returnMsg = "Error occurred during registration.";
	}
%>

<script type="text/javascript">
<!--

	alert("<%=returnMsg %>");	
	location.href = "<%=returnUrl %>"; 
		
//-->
</script>


