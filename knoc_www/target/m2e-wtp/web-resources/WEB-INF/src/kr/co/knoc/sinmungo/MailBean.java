package kr.co.knoc.sinmungo;


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
    private String port="25";
    
   /**
    * 
    * @param toEmail
    * @param fromEmail
    * @param title
    * @param content
    * @param file_box
    * @param toName
    * @param fromName
    * @param mailServer
    * @throws Exception
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
    

    public String getPort() {
    	return port;
    }


    public void setPort(String port) {
    	this.port = port;
    }


	public void run()
    {
        try{
            Properties props = new Properties();
            props.put("mail.smtp.host", mailServer);
            props.put("mail.smtp.port", port); //(2011.05.31) 25
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