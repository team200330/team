package com.team.vo;

import java.sql.Date;
import java.sql.Time;
import java.util.List;

import lombok.Data;

@Data
public class Task {
	private int taskNo;
	private int listNo;
	private String title;
	private String content;
	private Date startDate;
	private Date endDate;
	private boolean completed; // 완료 여부
	private boolean deleted;
	private String writer;
	private String completedP; // 완료한 사람
	
	private List<TaskMember> taskMembers;
	private List<File> files;
}
