package com.ezen.jhc.web.user.service.csService;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ezen.jhc.web.user.dto.faq.FaqDTO;



@Service
public interface FaqService {

	String ctgr_name(List<FaqDTO> faq);
	

}
