package com.ezen.jhc.web.admin.mapper.contact;

import java.util.List;

import com.ezen.jhc.web.admin.dto.contact.ContactDTO;

public interface AdminContactMapper {
	
	public List<ContactDTO> getContactContents();
}
