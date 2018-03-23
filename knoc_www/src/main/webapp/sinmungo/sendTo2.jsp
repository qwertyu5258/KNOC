<%@page import="javax.mail.internet.MimeMultipart"%>
<%@page import="javax.mail.MessagingException"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<%@page import="java.util.Properties"%> 
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="java.util.Date"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.internet.InternetAddress"%>
 

<%
try{
	String fromEmail="root@www.knoc.co.kr";
	String toEmail="viaduct@knoc.co.kr";
	String content="내용입니다.";
    Properties props = new Properties();
    props.put("mail.smtp.host", "localhost");
    //mail.kangnam.seoul.kr
    
    String charType = "euc-kr";

    Session sess = Session.getDefaultInstance(props, null);
    Message msg = new MimeMessage(sess);

    InternetAddress fadd = new InternetAddress(fromEmail,fromEmail,charType);
    msg.setFrom(fadd);

    InternetAddress address = new InternetAddress(toEmail,toEmail,charType);
    msg.setRecipient(Message.RecipientType.TO, address);

    msg.setSubject("dkdk");
    msg.setContent(content, "text/html; charset=euc-kr");
    
       	           
        
    Transport.send(msg);	
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
    
 
