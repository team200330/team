package com.team.mapper;

import com.team.vo.Member;

public interface MemberMapper {

	void insertMember(Member member);

	Member selectMemberByEmailAndPassword(Member member);
	
	Member selectMemberByEmail(String email);

	void updatePassword(Member member);
	
	void updateImg(Member member);

}
