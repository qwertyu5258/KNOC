package kr.co.knoc.etc;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;
import java.lang.Thread; 
import com.oreilly.servlet.MultipartRequest;

public class MailBean extends Thread {
	private String toEmail;
    private String fromEmail;
    private String title;
    private String content;
    private String file_box;
    private String toName;
    private String fromName;
    private String mailServer;

    /**
     * @param toEmail 받는사람이멜, fromEmail 보내는 사람 이멜, title 제목, content 내용
     * MailBean의 초기 세팅
     * Thread를 상속하고 .start()로 실행하면 run()에서 처리한다.
     */ 
    public MailBean(String toEmail, String fromEmail, String title, String content, String file_box, String toName, String fromName, String mailServer) throws Exception
    {
        this.toEmail = toEmail;
        this.fromEmail = fromEmail;
        this.title = title;
        this.content = content;
        this.file_box = file_box;
        this.toName = toName;
        this.fromName = fromName;
        this.mailServer = mailServer;
    }
    

    public void run()
    {
        try{
            Properties props = new Properties();
            props.put("mail.smtp.host", mailServer);
            //mail.kangnam.seoul.kr
            
            String charType = "euc-kr";

            Session sess = Session.getDefaultInstance(props, null);
            Message msg = new MimeMessage(sess);

            InternetAddress fadd = new InternetAddress(fromEmail,fromEmail,charType);
            msg.setFrom(fadd);

            InternetAddress address = new InternetAddress(toEmail,toEmail,charType);
            msg.setRecipient(Message.RecipientType.TO, address);

            msg.setSubject(title);
            msg.setContent(content, "text/html; charset=euc-kr");
            
            if (file_box != null && !file_box.equals("")) {
	            //Multi Part 
	            Multipart multipart = new MimeMultipart();
	                 
	            // BodyPart Mutil Part  
	            BodyPart messageBodyPart = new MimeBodyPart(); 
	            messageBodyPart.setText(content);     
	            messageBodyPart.setContent(content, "text/html; charset=euc-kr");
	            multipart.addBodyPart(messageBodyPart); 
	         
	            // BodyPart Multi Part  
	            BodyPart fileBodyPart = new MimeBodyPart(); 
	            DataSource source = new FileDataSource(file_box);
	            fileBodyPart.setDataHandler(new DataHandler(source));
	            fileBodyPart.setFileName(MimeUtility.encodeText(source.getName()));
	            multipart.addBodyPart(fileBodyPart);
	            
	            // Multi Part content 
	            msg.setContent(multipart); 
        	}    	           
	            
	        Transport.send(msg);	
        }
        catch(MessagingException messagingexception)
	    {
	            String s5 = messagingexception.toString();
	            messagingexception.printStackTrace();
        }catch(Exception e){
        	System.out.println("error occur : " + e.toString());    
        }
    }
}