package com.ezen.jhc.web.user.dto.cstm;

import com.ezen.jhc.web.user.dto.member.MemberDTO;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class MemberCstmDTO {
	
	Integer mem_cstm_num;
	MemberDTO memberDTO;
	String mem_cstm_path;
}