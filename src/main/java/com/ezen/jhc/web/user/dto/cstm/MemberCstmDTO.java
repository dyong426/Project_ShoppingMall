package com.ezen.jhc.web.user.dto.cstm;


import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@NoArgsConstructor
@RequiredArgsConstructor
@Data
public class MemberCstmDTO {
	
	Integer	mem_cstm_num;
	@NonNull
	Integer	mem_num;
	@NonNull
	String	mem_cstm_path;
}
