package com.team.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Log {
	private int logNo;
	private String email;
	private Date writedate;
	private String state;
	private int taskNo;
	private int projectNo;
	
	private Member sender;
	private LogReceiver receiver;
	private Task task;
	
	public Log(String email, Date writedate, int taskNo, String state, int projectNo) {
		this.email = email;
		this.writedate = writedate;
		this.state = state;
		this.taskNo = taskNo;
		this.projectNo = projectNo;
	}
	public Log() {};
	
}
