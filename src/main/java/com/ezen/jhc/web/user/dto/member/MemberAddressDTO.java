package com.ezen.jhc.web.user.dto.member;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class MemberAddressDTO {
	
	// 테이블 : member_addresses
	Integer mem_zipcode;
	String mem_addr1;
	String mem_addr2;
	Character addr_save;
}
