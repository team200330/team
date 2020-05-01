package com.team.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.team.vo.Member;
import com.team.vo.Project;
import com.team.vo.ProjectMember;

public interface ProjectMapper {
	
	List<Project> selectProjectByWorkspaceNo(int workspaceNo);
	
	List<ProjectMember> selectMemberByProjectNo(int projectNo);
	
	///////////////////////////////////////////
	
	void insertProject(Project project);
	
	List<ProjectMember> insertProjectMember(List<ProjectMember> projectMember);
	
	List<Project> selectProject(HashMap<String, Object> params);
	
	List<Project> selectProject2(HashMap<String, Object> params);
	
	void updateProjectNo(Map<String, String> arrMaparrMap);
	
	List<Project> selectPageing(HashMap<String, Object> params);

	int selectProjectListCount(HashMap<String, Object> params);

	Project selectProjectByNo(int projectNo);

	Project selectDetail(int projectNo);

	void updateProject(Project project);

	List<Member> selectLoginuserProjectMember(HashMap<String, Object> params);




	
	
	





}
