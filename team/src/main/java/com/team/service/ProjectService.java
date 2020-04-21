package com.team.service;

import java.util.List;
import java.util.Map;

import com.team.vo.Project;
import com.team.vo.Template;

public interface ProjectService {

	void writeProject(Project project);

	List<Project> findProject();

	void updateProjectNo(Map<String, String> arrMap);


}
