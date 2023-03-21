package com.ezen.jhc.web.admin.mapper.home;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezen.jhc.web.admin.dto.home.AdminDTO;
import com.ezen.jhc.web.admin.dto.home.CsCtgrDTO;
import com.ezen.jhc.web.admin.dto.home.NewMemberCountDTO;

public interface AdminHomeMapper {
	
	List<CsCtgrDTO> getNewCsCount();
	
	NewMemberCountDTO getNewMemberCount();
	
	String loginPW(@Param("admin_email") String admin_email);
	
	Integer join(AdminDTO admin);
}
