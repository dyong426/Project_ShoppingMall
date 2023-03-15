package com.ezen.jhc.web.user.mapper.cstm;

import com.ezen.jhc.web.user.dto.cstm.MemberCstmDTO;

public interface CstmMapper {

	public MemberCstmDTO getCstmByNum(int mem_cstm_num);
	
	public int insertCstm(MemberCstmDTO cstmDto);
}
