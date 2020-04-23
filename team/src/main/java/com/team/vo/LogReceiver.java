package com.team.vo;

import lombok.Data;

@Data
public class LogReceiver {
	private int logNo;
	private String email;
	private boolean isRead;
	private boolean deleted;
}
