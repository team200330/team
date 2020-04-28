package com.team.controller;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
 
import com.team.service.EmailService;
import com.team.vo.Email;
 
@Controller
public class EmailController {
    
    @Autowired
    private EmailService emailService;
    
    @RequestMapping("/mail")
    public void sendEmailAction() throws Exception{
        
        System.out.println("Email Controller");
        
        Email email = new Email();
        email.setReceiver("hyeminkim@korea.ac.kr");
        email.setContent("내용이 들어갑니다");
        email.setSubject("제목이 들어갑니다");
        
        emailService.SendEmail(email);
        
    }
    
}