package com.itwill.billycar.service;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.billycar.mapper.MemberMapper;
import com.itwill.billycar.vo.MemberVO;

@Service
public class Memberservice {
	@Autowired
	private MemberMapper mapper;
	
	public int registMember(MemberVO bean) { //회원가입
		return mapper.insertMember(bean);
	}
	
	
//	public boolean isCorrectUser(MemberVO member) { //로그인
//		return mapper.selectCorrectUser(member);
//	}


	public boolean isEmptyId(String member_id) { // 중복 아이디
		System.out.println(member_id);
		return mapper.selectCheckID(member_id);
	}


	public MemberVO getMember(MemberVO member) { // 회원 검색
		
		return mapper.selectMember(member);
	}


	public MemberVO forgotId(MemberVO member) { // 아이디 찾기
		
		return mapper.selectForgotId(member);
	}


	public int selectMemberCount() {
		return mapper.selectMemberCount();
	}


	public int todayMemberCount() {
		return mapper.selectTodayMember();
	}


<<<<<<< HEAD
=======
	// 네이버 정보 저장하기
	public int saveNaverInfo(MemberVO member) {
		return mapper.insertMember(member);
	}
>>>>>>> branch 'main' of https://github.com/admiles1/billyCar
}
