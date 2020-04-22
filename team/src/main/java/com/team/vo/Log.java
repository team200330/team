package com.team.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Log {
	private int logNo;
	private boolean isRead;
	private String email;
	private Date writeDate;
	private String state;
	private boolean deleted;
	private int taskNo;
}
