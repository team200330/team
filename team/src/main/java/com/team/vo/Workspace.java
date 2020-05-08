package com.team.vo;

import java.util.List;

import lombok.Data;

@Data
public class Workspace {
	private int workspaceNo;
	private String workspaceName;
	private boolean deleted;
	private String code;
	
	private List<Project> projects;
	private List<WorkspaceMember> workspaceMembers;
}
