package com.ezen.jhc.web.admin.mapper.prod;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ezen.jhc.web.admin.dto.prod.MainCtgrDTO;
import com.ezen.jhc.web.admin.dto.prod.SubCtgrDTO;

@Mapper
public interface MainCtgrMapper {
	
	public List<MainCtgrDTO> getMainCtgr();
	
	public List<SubCtgrDTO> getSubCtgr(Integer m_ctgr_num);

}
