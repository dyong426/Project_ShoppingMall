package com.ezen.jhc.web.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.jhc.web.admin.dto.prod.MainCtgrDTO;
import com.ezen.jhc.web.admin.dto.prod.SubCtgrDTO;
import com.ezen.jhc.web.admin.mapper.prod.CtgrMapper;

@Service
public class AdminProdRegServiceImpl implements AdminProdRegService{

	@Autowired
	CtgrMapper ctgrMapper;
	
	@Override
	public List<MainCtgrDTO> getMainCtgrList() {
		
		return ctgrMapper.getMainCtgr();
	}
	
	@Override
	public List<SubCtgrDTO> getSubCtgrList(Integer m_ctgr_num) {
		
		return ctgrMapper.getSubCtgr(m_ctgr_num);
	}
}
