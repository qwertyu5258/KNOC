<%@page import="com.neoboard.mailing.MailBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<%@page import="kr.co.knoc.util.DateUtil"%>
<%@page import="javax.mail.internet.MimeMultipart"%>
<%@page import="javax.mail.MessagingException"%>
<%@page import="java.util.Properties"%> 
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="java.util.Date"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.internet.InternetAddress"%>
 

<%
try{
	
	String mailTo = "blackcloud99@naver.com";			
	String mailFrom = "webmaster@knoc.co.kr";
	String title = "인사청탁알선신문고에 의견이 등록되었습니다. ["+DateUtil.getFormattedDate(new Date(), "yyyy-MM-dd HH:mm:ss")+"]";
	String body = "제목 : " + "sdfsf" + " <br /><br /> " + "ddddddddddd"; 
	String mailServer = "localhost";
	String toName = "관리자";
	String fromName = "webmaster";
	
	MailBean Mailb = new MailBean(mailTo, mailFrom, title, body, "", toName, fromName, mailServer);
	Mailb.start();
}
catch(MessagingException messagingexception)
{
        String s5 = messagingexception.toString();
        messagingexception.printStackTrace();
}catch(Exception e){
	System.out.println("error occur : " + e.toString());    
}
  // }
    %>
    
 