package com.itwill.billycar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.billycar.mapper.AdminMapper;
import com.itwill.billycar.vo.AdminVO;
import com.itwill.billycar.vo.CarVO;
import com.itwill.billycar.vo.MemberVO;
import com.itwill.billycar.vo.QnaVO;

@Service
public class AdminService {
	@Autowired
	private AdminMapper mapper;
	
	public AdminVO adminlogin(AdminVO admin) {
		System.out.println("AdminService - adminlogin()");
		return mapper.selectMember(admin);
	}

	public List<MemberVO> adminMemberList(String searchType, String searchKeyword, int startRow, int listLimit) {
		return mapper.adminMemberList(searchType,searchKeyword,startRow,listLimit);
	}

	public int getMemberListCount(String searchType, String searchKeyword, int startRow, int listLimit) {
		
		int listCount = 0;
		
		listCount = mapper.getMemberCount(searchType,searchKeyword,startRow,listLimit);
		return listCount;
	}

	public int carUpload(CarVO car) {
		
		return mapper.insertCar(car);
	}

	public int MemberStatusModify(MemberVO member) {
		return mapper.updateMember(member);
	}

	public List<QnaVO> adminAnswerList() {
		return mapper.selectQnaList();
	}

}
