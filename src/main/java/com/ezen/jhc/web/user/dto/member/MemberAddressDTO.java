package com.ezen.jhc.web.user.dto.member;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MemberAddressDTO {
	
	// 테이블 : member_addresses
	Integer mem_num;
	String mem_zipcode;
	String mem_addr1;
	String mem_addr2;
	Integer addr_save;
}
