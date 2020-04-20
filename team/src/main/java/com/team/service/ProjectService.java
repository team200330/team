package com.team.service;

import java.util.List;

import com.team.vo.Project;
import com.team.vo.Template;

public interface ProjectService {

	void writeProject(Project project);

	List<Project> findProject();


}
