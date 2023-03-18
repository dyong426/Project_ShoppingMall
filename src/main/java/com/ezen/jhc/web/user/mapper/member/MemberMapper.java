package com.ezen.jhc.web.user.mapper.member;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.ezen.jhc.web.user.dto.member.MemberDTO;

@Repository
public interface MemberMapper {

	// 이메일 주소 중복 확인
	@Select("select count(*) from members where mem_email = #{mem_email}")
	public Integer checkMem(String mem_email);
	
	// 회원정보
	@Select("select * from members where mem_email = #{mem_email}")
	public MemberDTO getMember(String mem_email);
	
	// 가입
	@Insert("INSERT INTO members VALUES(mem_num_seq.nextval, #{mem_email}, #{mem_pw}, #{mem_birth}, #{mem_name}, #{mem_phone}, #{mem_note}, TO_DATE(sysdate , 'yyyy/mm/dd hh24:mi:ss'), 1000)")
	public void join(MemberDTO dto);
	
	// 로그인
	@Select("select count(*) from members where mem_email = #{mem_email} and mem_pw = #{mem_pw}")
	public Integer checkEmailPw(@Param("mem_email") String mem_email, @Param("mem_pw") String mem_pw);
	
	// 비밀번호 변경
	@Update("update members set mem_pw = #{mem_pw} where mem_email = #{mem_email}")
	public void changePassword(@Param("mem_pw")String mem_pw, @Param("mem_email") String mem_email);

	//회원 탈퇴
	@Delete("Delete from members where mem_num = #{mem_num}")
	public void deleteAccount(int mem_num);
	
	// 회원정보 입력 & 변경
	@Update("update members set mem_birth = #{mem_birth}, mem_phone = #{mem_phone} where mem_num = #{mem_num}")
	public void updateMyInfo(@Param("mem_num")int mem_num, @Param("mem_birth")String mem_birth, @Param("mem_phone")String mem_phone);
	
	
}
