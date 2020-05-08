package com.team.vo;

import lombok.Data;

@Data
public class LogReceiver {
	private int logNo;
	private String receiver;
	private boolean checked;
	private boolean deleted;
	
	private Member member;
	
	public LogReceiver(int logNo, String receiver) {
		this.logNo = logNo;
		this.receiver = receiver;
	}
	public LogReceiver() {}
}
