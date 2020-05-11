package com.team.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.team.vo.Member;
import com.team.vo.Project;
import com.team.vo.ProjectMember;

public interface ProjectMapper {
	
	public List<Project> selectProjectByWorkspaceNo(int workspaceNo);
	
	public List<ProjectMember> selectMemberByProjectNo(int projectNo);
	
	///////////////////////////////////////////
	
	public void insertProject(Project project);
	public void insertProjectMember(ProjectMember projectMember);
	
	public List<Project> selectProject(HashMap<String, Object> params);
	public List<Project> selectProject2(HashMap<String, Object> params);
	
	public void updateProjectNo(Map<String, String> arrMaparrMap);
	
	public List<Project> selectPageing(HashMap<String, Object> params);

	public int selectProjectListCount(HashMap<String, Object> params);

	public Project selectProjectByNo(int projectNo);

	public Project selectDetail(int projectNo);
	
	public void updateProjectMember(ProjectMember projectMember);
	
	public void projectMemberDeleted(ProjectMember projectMember);

	public void updateProject(Project project);

	public List<Member> selectLoginuserProjectMember(HashMap<String, Object> params);

	public ProjectMember selectDetail2(int projectNo);

	public void updateProjectDeleted(Map<String, Object> arrMap);

	public List<ProjectMember> selectProjectMember(HashMap<String, Object> params);

	public void updateProjectDate(HashMap<String, Object> params);



}
