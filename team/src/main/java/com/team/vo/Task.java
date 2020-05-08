package com.team.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class Task {
	private int taskNo;
	private int listNo;
	private String content;
	private Date startDate;
	private Date endDate;
	private Date completedDate;
	private boolean completed; // 완료 여부
	private boolean deleted;
	private String writer;
	private String completedP; // 완료한 사람
	
	private List<TaskMember> taskMembers;
	private List<File> files;
	
	////////////////////////////
	// string date
	private String s_startDate;
	private String s_endDate;
	private String s_completedDate;
}
