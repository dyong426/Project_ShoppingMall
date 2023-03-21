package com.ezen.jhc.web.user.service.cstm;

import com.ezen.jhc.web.user.dto.cstm.MemberCstmDTO;

public interface CstmService {

	public void saveImage(String img, String fileName);
	
	public int insertCstm(MemberCstmDTO cstmDto);
}
