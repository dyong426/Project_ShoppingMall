package com.ezen.jhc.web.admin.controller.prod;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.ezen.jhc.web.admin.dto.prod.SubCtgrDTO;
import com.ezen.jhc.web.admin.mapper.prod.SubCtgrMapper;

@RestController
public class AdminProdRegRestController {
	
	@Autowired
	SubCtgrMapper scMapper;
	
	@PostMapping(value = "/restful/admin/prod/reg", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<SubCtgrDTO> setSubCtgr(@RequestBody SubCtgrDTO sCtgr) {
		
		return scMapper.getSubCtgr(sCtgr.getM_ctgr_num());
	}
}
