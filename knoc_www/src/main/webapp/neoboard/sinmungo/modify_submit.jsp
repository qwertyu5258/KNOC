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
boolean isMaster = false;
boolean isUser = false;

if(session.getAttribute("SINMUNGO_STATUS_NO") != null){ 
	if(session.getAttribute("SINMUNGO_STATUS_NO").toString().trim().equals("1")){
		isMaster = true;
	}else if(session.getAttribute("SINMUNGO_STATUS_NO").toString().trim().equals("2")){
		isUser = true;
	} 
}
%>
  
 <% 
 if(!isMaster){
	 if( !isUser) {
	 %>
	 <script type="text/javascript">
		alert("접근 권한이 없습니다.");
		location.href = "/sinmungo/main.jsp";
		</script>
	 <%
	 	return;
	 }
 }%> 
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
	String encoding = "euc-kr";
	int maxUploadSize = 10 * 1024 *1024; 
	MultipartRequest mrequest = new MultipartRequest(request, realPath, maxUploadSize, encoding, new DefaultFileRenamePolicy());
	HashMap requestData = new HashMap();	
	ArrayList fileList = fileUpload.articleUpdateFile(mrequest, realPath, requestData,"filex1");
	ArrayList fileList2 = fileUpload.articleUpdateFile(mrequest, realPath, requestData,"filex2");

	int resultCnt = 0;
	String article_nid =requestData.get("article_nid").toString();
	String returnUrl = "/sinmungo/view.jsp?article_nid="+article_nid;
	String returnMsg = "";
	System.out.println(requestData.toString());
	resultCnt = articleManager.updateArticle(requestData, fileList, fileList2,userManger.getUserInfo(1));	 
	
	 
	if(resultCnt > -1){ 
		HashMap userMap = userManger.getMasterUserInfo();		
		NeoBoardManager.insertSmsWait(userMap.get("PHONE").toString(), "1", "신문고에 글이 등록되었습니다.");
		returnMsg = "수정 되었습니다.";
	}else{
		returnMsg = "수정 중 에러가 발생하였습니다.";
	}
%>

<script type="text/javascript">
<!--

	alert("<%=returnMsg %>");	
	location.href = "<%=returnUrl %>"; 
		
//-->
</script>


