package com.team.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.team.vo.Project;

public interface ProjectMapper {

	void insertProject(Project project);

	List<Project> selectProject();
	
	List<Project> selectProject2();
	
	void updateProjectNo(Map<String, String> arrMaparrMap);
	
	List<Project> selectPageing(HashMap<String, Object> params);

	int selectProjectListCount(HashMap<String, Object> params);

	
	

	List<Project> selectProjectByWorkspaceNo(int workspaceNo);

	Project selectProjectByNo(int projectNo);


}
