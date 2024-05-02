package com.itwill.billycar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.billycar.mapper.LoginMapper;
import com.itwill.billycar.vo.MemberVO;

@Service
public class LoginService {
	@Autowired
	private LoginMapper mapper;

	public boolean isCorrectUser(MemberVO member) {
		return mapper.selectCorrectUser(member);
	}

}
