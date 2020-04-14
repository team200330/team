package com.team.service;

import com.team.common.Util;
import com.team.mapper.MemberMapper;
import com.team.vo.Member;

import lombok.Setter;

public class MemberServiceImpl implements MemberService {
	
	@Setter
	private MemberMapper memberMapper;

	@Override
	public void registerMember(Member member) {

		String plainPassword = member.getPassword();
		String hashedPassword = Util.getHashedString(plainPassword, "SHA-256");
		member.setPassword(hashedPassword);
		
		memberMapper.insertMember(member);
		
		
	}

	@Override
	public Member findMemberByEmailAndPassword(Member member) {
		
		member.setPassword(Util.getHashedString(member.getPassword(), "SHA-256"));
		
		Member member2 = memberMapper.selectMemberByEmailAndPassword(member);
		
		return member2;
	}
	
	

}
