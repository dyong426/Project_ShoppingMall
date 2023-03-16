package com.ezen.jhc.web.admin.service.contact;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ezen.jhc.web.admin.dto.contact.ContactDTO;

@Service
public interface AdminContactService {
	
	public List<ContactDTO> getContactContentList();
}
