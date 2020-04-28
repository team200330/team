package com.team.service;
 
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.team.vo.Email;

@Service("EmailService")
public class EmailServiceImpl implements EmailService {
    
    @Autowired
    protected JavaMailSender emailService;
    public void SendEmail(Email email) throws Exception{
        
        MimeMessage msg = emailService.createMimeMessage();
        try{
            
            msg.setSubject(email.getSubject());
            msg.setText(email.getContent());
            msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(email.getReceiver()));
            
        }catch(MessagingException e){
            System.out.println("MessagingException");
            e.printStackTrace();
        }
        
        try{
        	emailService.send(msg);
        }catch(MailException e){
            System.out.println("MailException 발생");
            e.printStackTrace();
        }
        
    }
 
}