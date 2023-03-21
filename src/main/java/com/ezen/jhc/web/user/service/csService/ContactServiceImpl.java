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
	@Override
	public Integer contactEnroll(ContactDTO contact, AttachImageListDTO images) {
		System.out.println("service");
		
		System.out.println();
		   
		  System.out.println("1. contactDTO :" + contact);

	      System.out.println();
	      
	      System.out.println("2. images : "  + images);
	
	      String uploadPath = images.getImageList().get(0).getUploadPath().replace('\\', '/');
	      
	      System.out.println(uploadPath);
	      
	      String contact_image_path = uploadPath + "/" + images.getImageList().get(0).getUuid() + images.getImageList().get(0).getFileName();
	      
	      contact.setContact_image_path(contact_image_path);
	      
	      System.out.println();
	      
	      // contact 먼저 인서트 
	      System.out.println("3. contact insert 전 contact_image_path 확인 :" + contact.getContact_image_path());
	      System.out.println();
	      System.out.println("4. insert 전 contact 확인: " + contact);
	      System.out.println();
	      contact_mapper.insert_contact(contact);
	      System.out.println();
	      
	      for (AttachImageDTO img : images.getImageList()) {
	    	  
	         String contact_img = img.getUploadPath().replace('\\', '/') + "/" + img.getUuid() + img.getFileName();
	         	
	         
	         
	         img.setContact_img(contact_img);
	         img.setContact_num(contact.getContact_num());
	         
	         //images 인서트; 
	         System.out.println("인서트 전 img 확인: " + img);
	         System.out.println();
	         int result = contact_mapper.insert_contact_img(img); 
	      }

	     
	        
		return 1;
	}

}
