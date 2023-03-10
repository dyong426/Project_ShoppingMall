package com.ezen.jhc.web.user.service.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.jhc.web.user.mapper.mypage.MyPageMapper;

@Service
public class HistoryServiceImpl implements HistoryService {
	

	@Autowired
	MyPageMapper myPageMapper;
	
	
	
}
