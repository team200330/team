package com.team.vo;

import lombok.Data;

@Data
public class ProjectMember {
	private int projectNo;
	private String email;
	
	public ProjectMember() {};
	public ProjectMember(int projectNo, String email) { 
		this.projectNo = projectNo; 
		this.email = email; 
	};
}
