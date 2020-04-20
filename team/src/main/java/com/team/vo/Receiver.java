package com.team.vo;

import lombok.Data;

@Data
public class Receiver {
	private int feedbackNo;
	private String email;
	
	public Receiver() {};
	public Receiver(int feedbackNo, String email) { 
		this.feedbackNo = feedbackNo; 
		this.email = email; 
	};
}
