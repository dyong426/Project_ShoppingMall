package com.ezen.jhc.web.user.service.csService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.jhc.web.user.dto.contact.AttachImageDTO;
import com.ezen.jhc.web.user.dto.contact.AttachImageListDTO;
import com.ezen.jhc.web.user.dto.contact.ContactDTO;
import com.ezen.jhc.web.user.mapper.cs.ContactMapper;

@Service
public class ContactServiceImpl implements ContactService{

	
	@Autowired
	private ContactMapper contact_mapper;
	
	public Integer contactImgEnroll(ContactDTO contact, AttachImageListDTO images) {
		System.out.println("service imgEroll.........");
		
		AttachImageDTO img = images.getImageList().get(0);
		//contact.setContact_image_path(img.getUploadPath(), img.getUuid(), img.getFileName());
		
		// 글 insert
		contact_mapper.insert_contact(contact);
		
		if(images.getImageList() == null || images.getImageList().size() <= 0) {
			return 0;
		}
		
		images.getImageList().forEach(attach ->{
			attach.setContact_num(contact.getContact_num());
			contact_mapper.insert_contact_img(attach);
		});
		
		
		
		return 1;
	}

	@Override
	public Integer contactImgEnroll(AttachImageListDTO imgs) {
		// TODO Auto-generated method stub
		return null;
	}

}
