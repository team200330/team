package com.team.vo;

import java.sql.Time;

import lombok.Data;

@Data
public class Log {
	private int logNo;
	private boolean isRead;
	private String email;
	private Time writeDate;
	private String content;
	private boolean deleted;
	private int taskNo;
}
