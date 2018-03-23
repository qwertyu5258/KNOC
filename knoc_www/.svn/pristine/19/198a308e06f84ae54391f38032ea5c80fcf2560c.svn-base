<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.util.*"%>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />    
<% 


String gourl = ""; 

if(request.getParameter("gourl_select")!=null){ 
gourl = etcutil.strBlockSpecialTags(request.getParameter("gourl_select")); 

}else if(request.getParameter("gourl_select_1")!=null){ 
gourl = etcutil.strBlockSpecialTags(request.getParameter("gourl_select_1")); 

}else if(request.getParameter("gourl_select_2")!=null){ 
gourl = etcutil.strBlockSpecialTags(request.getParameter("gourl_select_2")); 

}else if(request.getParameter("gourl_select_3")!=null){ 
gourl = etcutil.strBlockSpecialTags(request.getParameter("gourl_select_3")); 

}else if(request.getParameter("gourl_select_4")!=null){ 
gourl = etcutil.strBlockSpecialTags(request.getParameter("gourl_select_4")); 
} 
	 
int chkXSS = gourl.indexOf("<script");
if(chkXSS > -1) { gourl = "www.knoc.co.kr"; }

if(gourl.length() < 14 || !gourl.substring(0, 14).equals("www.knoc.co.kr")) {
	gourl = "www.knoc.co.kr";		
} 
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> 
<html> 
<head> 
<title>한국석유공사</title> 
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr"> 
</head> 
<body> 
<script type="text/javascript" > 
location.href = "http://<%=gourl%>";
</script><noscript> 
<a href="http://<%=gourl%>" target="_blank" title="해당 홈페이지를 새창으로 이동합니다.">[GO]</a> 를 선택하시면 해당 홈페이지를 새창으로 이동합니다.<br />
<a href="/index.jsp" title="메인페이지로 이동 합니다.">[석유공사]</a>를 선택하시면 석유공사 메인페이지로 이동합니다.
</noscript> 
</body> 
</html>