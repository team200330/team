package com.team.vo;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class Project {
	private int projectNo;
	private int workspaceNo;
	private String projectName;
	private Date startdate; // 시작일
	private Date deadline;  // 마감일
	private Date enddate;   // 완료일
	private String content;
	private String managerEmail;
	private boolean deleted;
	private boolean proPublic;
	private int templateNo;
	private int proNo;
	
	private List<TaskList> taskLists;
	private List<ProjectMember> projectMembers;


	
}
