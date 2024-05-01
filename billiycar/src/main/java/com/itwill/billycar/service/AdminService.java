package com.itwill.billycar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.billycar.mapper.AdminMapper;
import com.itwill.billycar.vo.AdminVO;

@Service
public class AdminService {
	@Autowired
	private AdminMapper mapper;
	
	public AdminVO adminlogin(AdminVO admin) {
		System.out.println("AdminService - adminlogin()");
		return mapper.selectMember(admin);
	}

}
