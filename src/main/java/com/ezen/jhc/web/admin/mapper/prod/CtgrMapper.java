package com.ezen.jhc.web.admin.mapper.prod;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezen.jhc.web.admin.dto.prod.MainCtgrDTO;
import com.ezen.jhc.web.admin.dto.prod.SubCtgrDTO;

public interface CtgrMapper {

	public List<MainCtgrDTO> getMainCtgr();
	
	public List<SubCtgrDTO> getSubCtgr(@Param("m_ctgr_num") Integer m_ctgr_num);
	
	public List<SubCtgrDTO> getSubCtgrs();
}
