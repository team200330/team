package com.team.vo;

import java.util.List;

import lombok.Data;

@Data
public class TaskList {
	private int listNo;
	private int projectNo;
	private String listName;
	private boolean deleted;
	
	private List<Task> tasks;
}
