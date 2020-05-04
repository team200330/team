package com.team.vo;

import lombok.Data;

@Data
public class FeedbackReceiver {
	private int feedbackNo;
	private String email;
	private boolean deleted;
	private boolean checked;
	
	private Member member;
	
	public FeedbackReceiver() {};
	public FeedbackReceiver(int feedbackNo, String email) { 
		this.feedbackNo = feedbackNo; 
		this.email = email; 
	};
}
