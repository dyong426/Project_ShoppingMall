package com.ezen.jhc.web.user.mapper;

import java.util.List;

import com.ezen.jhc.web.user.dto.member.MemberDTO;

public interface MemberMapper {
	
	public List<MemberDTO> getAll();
	
	public MemberDTO get(Integer mem_num);
	
	public Integer join(MemberDTO memberDTO);

}
