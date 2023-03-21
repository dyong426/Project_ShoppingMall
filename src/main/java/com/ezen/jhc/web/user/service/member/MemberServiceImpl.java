package com.ezen.jhc.web.user.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.jhc.web.user.dto.member.MemberDTO;
import com.ezen.jhc.web.user.mapper.member.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper memberMapper;
	
	@Override
	public void updateMemPoint(MemberDTO memberDto) {
		memberMapper.updateMemPoint(memberDto);
	}

}
