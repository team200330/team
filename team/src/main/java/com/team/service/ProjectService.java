package com.team.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.team.vo.Member;
import com.team.vo.Project;
import com.team.vo.ProjectMember;

public interface ProjectService {

	public void writeProject(Project project, String[] email);

	public List<Project> findProject(HashMap<String, Object> params);
	public List<Project> findProject2(HashMap<String, Object> params);
	
	public void updateProjectNo(Map<String, String> arrMap);
	public void updateProjectDeleted(Map<String, Object> arrMap);

	public List<Project> findPageing(HashMap<String, Object> params);

	public int projectListCount(HashMap<String, Object> params);

	public Project searchProjectByNo(int projectNo);
	public Project selectDetail(int projectNo);
	
	public void updateProjectMember(ProjectMember projectMember);
	
	public void projectMemberDeleted(ProjectMember projectMember);

	public void updateProject(Project project);

	public List<Member> loginuserProjectMember(HashMap<String, Object> params);
	
	public List<Member> findWorkspaceMembers(int workspaceNo);

	///////////////////////////////////////////////////
	
	public List<Project> findProjectAndTasklist(int workspaceNo);

	public List<ProjectMember> findProjectMember(HashMap<String, Object> params);







}
