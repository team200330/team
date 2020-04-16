package com.team.vo;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class Feedback {
	private int feedbackNo;
	private String content;
	private Date writeDate;
	private String sender;
	private int workspaceNo;
	private int projectNo;
	private boolean isRead;
	private boolean isPublic;
	
	private List<Receiver> receivers;
	private List<Comments> comments;
}
