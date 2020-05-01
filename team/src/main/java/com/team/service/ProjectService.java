package com.team.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.team.vo.Member;
import com.team.vo.Project;
import com.team.vo.ProjectMember;

public interface ProjectService {

	void writeProject(Project project, String[] email);
	void insertProjectMember(ProjectMember projectMember);
	
	List<Project> findProject(HashMap<String, Object> params);
	
	List<Project> findProject2(HashMap<String, Object> params);
	
	void updateProjectNo(Map<String, String> arrMap);

	List<Project> findPageing(HashMap<String, Object> params);

	int projectListCount(HashMap<String, Object> params);

	Project searchProjectByNo(int projectNo);

	Project selectDetail(int projectNo);

	void updateProject(Project project);

	List<Member> loginuserProjectMember(HashMap<String, Object> params);

	List<Member> findWorkspaceMembers(int workspaceNo);










}
