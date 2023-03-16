package com.ezen.jhc.web.user.service.cstm;

import java.io.IOException;

import com.ezen.jhc.web.user.dto.cstm.MemberCstmDTO;

public interface CstmService {

	public void saveImage(String img, String fileName);
	
	public MemberCstmDTO insertCstm(MemberCstmDTO cstmDto);
}
