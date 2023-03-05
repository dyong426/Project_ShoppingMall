package com.ezen.jhc.web.admin.mapper.prod;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ezen.jhc.web.admin.dto.prod.MainCtgrDTO;

@Mapper
public interface MainCtgrMapper {
	
	public List<MainCtgrDTO> getMainCtgr();

}
