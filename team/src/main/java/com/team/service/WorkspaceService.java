package com.team.service;

import java.util.HashMap;
import java.util.List;

import com.team.vo.Member;
import com.team.vo.Project;
import com.team.vo.Workspace;
import com.team.vo.WorkspaceMember;

public interface WorkspaceService {

	void insertWorkspace(Workspace workspace);

	List<Member> selectMembersByWorkspaceNo(WorkspaceMember workspaceMember);
	
	List<Project> selectProjectByWorkspaceNo(int workspaceNo);

	void updateWorkspaceName(Workspace workspace);

	void deleteWorkspace(Workspace workspace);

	Member selectMemberTypeNo1ByWorkspaceNo(WorkspaceMember workspaceMember);

	List<Member> WorkspaceMemberNameAndDepartmentSearch(Member member);

	void insertWorkspaceMember(WorkspaceMember workspaceMember);

	void updateWorkspace(Workspace workspace);

	WorkspaceMember selectWorkspaceByEmail(String email);
	
	Workspace selectWorkspaceByWorkspaceNo(int workspaceNo);
	
	List<Workspace> selectWorkspacesByWorkspaceNo(int workspaceNo);

	List<Workspace> selectWorkspaceNameByEmail(String email);
	
	List<Workspace> selectWorkspacesByEmail(String email);

	void changeWorkspaceMemberType(WorkspaceMember workspaceMember);

	WorkspaceMember selectWorkspaceMemberTypeByWorkspaceMember(WorkspaceMember workspaceMember);

	void changeLoginuserType(WorkspaceMember workspaceMember);

	void deleteWorkspaceMemberType(WorkspaceMember workspaceMember);

	int selectCountMemberByWorkspaceMember(int workspaceNo);

	List<Member> selectMemberAsc1ByWorkspaceNo(int workspaceNo);

	List<Member> selectMemberAsc2ByWorkspaceNo(int workspaceNo);
	
	List<Workspace> selectWorkspaceByManagerEmail(String email);
	
	void updateWorkspaceManager(HashMap<String, Object> params);

	Workspace selectAscWorkspaceByEmail(String email);

}
