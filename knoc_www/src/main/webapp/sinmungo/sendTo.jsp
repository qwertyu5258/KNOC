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
    
    String id="webmaster@knoc.co.kr";
    String pwd="1111";
    String smtpHost="localhost";
    String to="viaduct@knoc.co.kr";
    String from="webmaster@knoc.co.kr"; //보내는 주소는 서버 이름과 같아야함.
   // public void sendMail(){
    Properties properties = System.getProperties();
    properties.put("mail.store.protocol", "smtp");
    properties.put("mail.smtp.host", smtpHost);
    properties.put("mail.smtp.port", "25");
    properties.put("mail.smtp.auth", "true");
    properties.put("mail.debug", "true");
    
      Session sessions = Session.getInstance(properties,null);

      MimeMessage message = new MimeMessage(sessions);

      String content ="내용입니다.";

      try{    	   
       message.setFrom(new InternetAddress(from,"d","EUC-KR"));
       message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
       message.setSubject("JavaMail example");

       message.setContent(content,"text/html;charset=EUC-KR");
       Transport transport = sessions.getTransport("smtp");
       transport.sendMessage(message, message.getAllRecipients());
	transport.connect(smtpHost,id,pwd);
       transport.close();
      }catch(Exception e){
       e.printStackTrace();
       	out.println(e.getMessage());
       	out.println(e);        
       
      }
  // }
    %>
    
 
