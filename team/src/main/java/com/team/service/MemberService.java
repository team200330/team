package com.team.service;

import com.team.vo.Member;

public interface MemberService {

	void registerMember(Member member);

	Member findMemberByEmailAndPassword(Member member);

	Member findMemberByEmail(String email);

	void updatePassword(Member member);
	
	void updateImg(Member member);

	void updateMember(Member member);
	
	void deleteMember(String email);
}
