package com.ezen.jhc.web.user.service.csService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.jhc.web.user.dto.faq.FaqDTO;
import com.ezen.jhc.web.user.mapper.cs.FaqMapper;



@Service
public class FaqServiceImpl implements FaqService{

	@Autowired
	FaqMapper faq_mapper;

	@Override
	public String ctgr_name(List<FaqDTO> faq) {
		String ctgr_name = faq.get(0).getCs_ctgr_name();
		return ctgr_name;
	}


  



}
