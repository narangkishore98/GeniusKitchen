package inception;

import java.util.Date;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SimpleMailDemo 
{
    private static final String SMTP_HOST_NAME = "smtp.gmail.com";
    private static final int SMTP_HOST_PORT = 465;
    private static final String SMTP_AUTH_USER = "inception.tech.2015@gmail.com";
    private static final String SMTP_AUTH_PWD  = "inception2015";
    
    String subject, message, emailAddress;

    public SimpleMailDemo(String emailAddress, String subject, String message) 
    {
        this.subject = subject;
        this.message = message;
        this.emailAddress = emailAddress;
        sendemail();
    }

    public void sendemail() 
    {
      try 
      {
        Properties props = new Properties();
        props.put("mail.transport.protocol", "smtps");
        props.put("mail.smtps.host", SMTP_HOST_NAME);
        props.put("mail.smtps.auth", "true");
        // props.put("mail.smtps.quitwait", "false");

        Session mailSession = Session.getDefaultInstance(props);
        mailSession.setDebug(true);
        Transport transport = mailSession.getTransport();

        MimeMessage message = new MimeMessage(mailSession);
        message.setSubject(this.subject);
        message.setContent("Message :"+this.message, "text/plain");

        message.setSentDate(new Date());
          
        message.addRecipient(Message.RecipientType.TO,
             new InternetAddress(this.emailAddress));

        transport.connect
          (SMTP_HOST_NAME, SMTP_HOST_PORT, SMTP_AUTH_USER, SMTP_AUTH_PWD);

        transport.sendMessage(message,
            message.getRecipients(Message.RecipientType.TO));

        transport.close();

        } 
        catch (Exception ex) 
        {
            ex.printStackTrace();
        }
    }
    public static void main(String[] args) 
    {
        SimpleMailDemo obj = new SimpleMailDemo("vinay.kumar2389@gmail.com","hello","testing mail");
    }
}
