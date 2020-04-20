package com.team.mapper;

import java.util.List;

import com.team.vo.Project;

public interface ProjectMapper {

	void insertProject(Project project);

	List<Project> selectProject();

	List<Project> selectProjectByWorkspaceNo(int workspaceNo);

}
