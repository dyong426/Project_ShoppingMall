package com.ezen.jhc.web.admin.mapper.home;

import java.util.List;

import com.ezen.jhc.web.admin.dto.home.CsCtgrDTO;
import com.ezen.jhc.web.admin.dto.home.NewMemberCountDTO;

public interface AdminHomeMapper {
	
	List<CsCtgrDTO> getNewCsCount();
	
	NewMemberCountDTO getNewMemberCount();
}
