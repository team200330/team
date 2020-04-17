package com.team.service;

import com.team.mapper.ProjectMapper;
import com.team.vo.Project;

import lombok.Setter;

public class ProjectServiceImpl implements ProjectService {

	@Setter
	private ProjectMapper projectMapper;
	
	@Override
	public int writeProject (Project project) {
		projectMapper.insertProject(project);
		return project.getProjectNo();
	}
	
	
	
}
