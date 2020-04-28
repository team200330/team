package com.team.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class Feedback {
	private int feedbackNo;
	private String content;
	private Date writedate;
	private String sender;
	private int workspaceNo;
	private int projectNo;
	private boolean opened;
	
	private List<FeedbackReceiver> receivers;
	private List<Comments> comments;
}
