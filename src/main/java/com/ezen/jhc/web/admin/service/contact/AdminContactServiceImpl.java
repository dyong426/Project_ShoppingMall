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
	
	@Override
	public ContactDTO getContactContent(Integer contact_num) {
		
		return csMapper.getContactContent(contact_num);
	}
	
	@Override
	public Integer updateReply(Integer contact_num, String admin_reply) {
		
		return csMapper.updateReply(contact_num, admin_reply);
	}
	
	@Override
	public Integer deleteReply(Integer contact_num) {
		
		return csMapper.deleteReply(contact_num);
	}
}
