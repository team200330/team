package com.team.vo;

import java.util.List;

import lombok.Data;

@Data
public class Feedback {
	private int feedbackNo;
	private String content;
	private java.util.Date writedate;
	private String sender;
	private int workspaceNo;
	private int projectNo;
	private boolean isRead;
	private boolean isPublic;
	private boolean deleted;
	
	private List<Receiver> receivers;
	private List<Comments> comments;
}
