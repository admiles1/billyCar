package com.itwill.billycar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.billycar.mapper.MemberMapper;
import com.itwill.billycar.vo.MemberVO;

@Service
public class Memberservice {
	@Autowired
	private MemberMapper mapper;
	
	public int registMember(MemberVO bean) { //회원가입 service
		return mapper.insertMember(bean);
	}
	
	
	public boolean isCorrectUser(MemberVO member) { //로그인 service
		return mapper.selectCorrectUser(member);
	}
}
