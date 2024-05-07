package com.itwill.billycar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.billycar.mapper.AdminMapper;
import com.itwill.billycar.vo.AdminVO;
import com.itwill.billycar.vo.CarVO;
import com.itwill.billycar.vo.MemberVO;

@Service
public class AdminService {
	@Autowired
	private AdminMapper mapper;
	
	public AdminVO adminlogin(AdminVO admin) {
		System.out.println("AdminService - adminlogin()");
		return mapper.selectMember(admin);
	}

	public List<MemberVO> adminMemberList(String searchType, String searchKeyword, int startRow, int listLimit) {
		System.out.println(searchType);
		System.out.println(searchKeyword);
		System.out.println(startRow);
		System.out.println(listLimit);
		return mapper.adminMemberList(searchType,searchKeyword,startRow,listLimit);
	}

	public int getMemberListCount() {
		
		int listCount = 0;
		
		listCount = mapper.getMemberCount();
		System.out.println("listCount : " + listCount);
		return listCount;
	}

	public int carUpload(CarVO car) {
		
		return mapper.insertCar(car);
	}

}
