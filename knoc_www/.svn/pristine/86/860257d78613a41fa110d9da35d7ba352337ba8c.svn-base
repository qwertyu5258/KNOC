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
	application.setAttribute("gNavMenuDepth3","03");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	
	FileUpload fileUpload = new FileUpload();
	ArticleManager articleManager = new ArticleManager();
	SinmungoUserManager userManger = new SinmungoUserManager();
	
	
	ServletContext context = request.getSession().getServletContext();
	String realPath = context.getRealPath("/upload/ombudsman/")+"/";//어플리케이션 경로 잡는거임.
	String encoding = "euc-kr";
	int maxUploadSize = 10 * 1024 *1024; 
	MultipartRequest mrequest = new MultipartRequest(request, realPath, maxUploadSize, encoding, new DefaultFileRenamePolicy());
	HashMap requestData = new HashMap();	
	ArrayList fileList = fileUpload.articleUpdateFile(mrequest, realPath, requestData,"filex1");
	ArrayList fileList2 = fileUpload.articleUpdateFile(mrequest, realPath, requestData,"filex2");

	int resultCnt = 0;
	String article_nid =requestData.get("article_nid").toString();
	String returnUrl = "/ombudsman/view.jsp?article_nid="+article_nid;
	String returnMsg = "";
	System.out.println(requestData.toString());
	resultCnt = articleManager.updateArticle(requestData, fileList, fileList2,userManger.getUserInfo(3 , requestData));	 
	
	 
	if(resultCnt > -1){ 
		HashMap userMap = userManger.getMasterUserInfo();
		if(!"obm3".equals(userMap.get("USER_ID").toString())){ //sms발송은 obm3를 제외 2013 09 16요청
			NeoBoardManager.insertSmsWait(userMap.get("PHONE").toString(), "1", "신문고에 글이 등록되었습니다.");
		}
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


