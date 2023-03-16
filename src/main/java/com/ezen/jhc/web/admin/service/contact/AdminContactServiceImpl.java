package com.ezen.jhc.web.admin.service.contact;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.jhc.web.admin.dto.contact.ContactDTO;
import com.ezen.jhc.web.admin.mapper.contact.AdminContactMapper;

@Service
public class AdminContactServiceImpl implements AdminContactService{
	
	@Autowired
	AdminContactMapper csMapper;
	
	@Override
	public List<ContactDTO> getContactContentList() {
		
		return csMapper.getContactContents();
	}
}
