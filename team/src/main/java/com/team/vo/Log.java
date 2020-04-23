package com.team.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Log {
	private int logNo;
	private String email;
	private Date writedate;
	private String state;
	private int taskNo;
	private int projectNo;
	
	private LogReceiver receiver;
}
