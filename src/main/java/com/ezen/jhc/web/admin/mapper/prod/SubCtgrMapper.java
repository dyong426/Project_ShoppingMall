package com.ezen.jhc.web.admin.mapper.prod;

import java.util.List;

import com.ezen.jhc.web.admin.dto.prod.SubCtgrDTO;

public interface SubCtgrMapper {
	
	public List<SubCtgrDTO> getSubCtgr(Integer m_ctgr_num);

}
