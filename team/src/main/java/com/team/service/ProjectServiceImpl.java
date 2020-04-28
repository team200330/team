package com.team.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.team.mapper.ProjectMapper;
import com.team.vo.Project;

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

	@Override
	public List<Project> findProject2() {
		// TODO Auto-generated method stub
		return projectMapper.selectProject2();
	}
	
	@Override
	public void updateProjectNo(Map<String, String> arrMap) {

		projectMapper.updateProjectNo(arrMap);
		
	}

	@Override
	public List<Project> findPageing(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return projectMapper.selectPageing(params);
	}

	@Override
	public int projectListCount(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return projectMapper.selectProjectListCount(params);
	}

	@Override
	public Project searchProjectByNo(int projectNo) {
		// TODO Auto-generated method stub
		return projectMapper.selectProjectByNo(projectNo);
	}





	
	
	
}
