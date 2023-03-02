package com.ezen.jhc.web.user.mapper.member;

import java.sql.Date;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.ezen.jhc.web.user.dto.member.MemberDTO;

public interface MemberMapper {

	// 이메일 주소로 중복 확인
	@Select("select count(*) from members where mem_email = #{mem_email}")
	public Integer checkMem(String mem_email);
	
	// 가입
	@Insert("INSERT INTO members VALUES(mem_num_seq.nextval, #{mem_email},#{mem_pw}, #{mem_nick}, #{mem_birth}, #{mem_name}, #{mem_phone} , #{mem_note}, sysdate")
	public void join(String mem_email, String mem_pw, String mem_nick, String mem_birth, String mem_name, String mem_phone, String mem_note, Date mem_regdate);
	
	// 로그인
	@Select("SELECT COUNT(*) from members where mem_email = #{mem_email} and mem_pw = #{mem_pw}")
	public MemberDTO login(MemberDTO dto);
	
}
