package com.team.service;

import com.team.vo.Email;

public interface EmailService {
	
	void SendEmail(Email email) throws Exception;
}
