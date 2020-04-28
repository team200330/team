package com.team.vo;

import lombok.Data;

@Data
public class LogReceiver {
	private int logNo;
	private String receiver;
	private boolean checked;
	private boolean deleted;
}
