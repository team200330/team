package com.team.service;

import java.util.List;

import com.team.mapper.ProjectMapper;
import com.team.vo.Project;
import com.team.vo.Template;

import lombok.Setter;

public class ProjectServiceImpl implements ProjectService {

	@Setter
	private ProjectMapper projectMapper;
	
	@Override
	public void writeProject (Project project) {
		projectMapper.insertProject(project);
	}

	@Override
	public List<Project> findProject() {
		
		return projectMapper.selectProject();
	}


	
	
	
}
