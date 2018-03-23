<%@page import="com.neoboard.mailing.MailBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
try{
String body = "&lt;새글 등록되었습니다. 홈페이지 <a href='http://www.knoc.co.kr/channel/channel_login.jsp' target='_blank' >주소</a>를 통해 확인해주세요&gt; " ;
String mailServer = "localhost";
MailBean Mailb = new MailBean("sklee@knoc.co.kr", "webmaster@www.knoc.co.kr", "제목입니다.", body,"", "이정환", "root", mailServer);
Mailb.start();//start()에서 run()으로 수정 2011-08-02
out.println("dddd");
}catch(Exception e){
	out.println(e.getMessage());
	out.println("Exception");
}
%>
</body>
</html>