package com.team.vo;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class Project {
	private int projectNo;
	private int workspaceNo;
	private String projectName;
	private Date regdate;
	private String content;
	private String managerEmail;
	private boolean deleted;
	private boolean isPublic;
	private int templateNo;
	private int proNo;
	
	private List<TaskList> taskLists;
	private List<ProjectMember> projectMembers;
	
}
