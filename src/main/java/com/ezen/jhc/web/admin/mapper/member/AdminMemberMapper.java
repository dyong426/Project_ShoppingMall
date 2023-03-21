package com.ezen.jhc.web.admin.mapper.member;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezen.jhc.web.admin.dto.member.MemberDTO;

public interface AdminMemberMapper {
	
	List<MemberDTO> getMembers();
	
	List<MemberDTO> memberName(@Param("mem_name")String mem_name);
	
	MemberDTO getMember(Integer mem_num);
	
	Integer deleteMember(Integer mem_num);
	
}
