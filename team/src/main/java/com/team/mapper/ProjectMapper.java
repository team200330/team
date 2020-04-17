package com.team.mapper;

import java.util.List;

import com.team.vo.Project;
import com.team.vo.Template;

public interface ProjectMapper {

	void insertProject(Project project);

	List<Project> selectProject();
	

}
