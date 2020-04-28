package com.team.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.team.vo.Project;
import com.team.vo.ProjectMember;

public interface ProjectMapper {
	
	List<Project> selectProjectByWorkspaceNo(int workspaceNo);
	
	List<ProjectMember> selectMemberByProjectNo(int projectNo);
	
	///////////////////////////////////////////
	
	void insertProject(Project project);

	List<Project> selectProject();
	
	List<Project> selectProject2();
	
	void updateProjectNo(Map<String, String> arrMaparrMap);
	
	List<Project> selectPageing(HashMap<String, Object> params);

	int selectProjectListCount(HashMap<String, Object> params);

	Project selectProjectByNo(int projectNo);

	Project selectDetail(int projectNo);
	





}
