package com.itwill.billycar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.billycar.mapper.MemberMapper;
import com.itwill.billycar.vo.MemberVO;

@Service
public class Joinservice {
	@Autowired
	private MemberMapper mapper;
	
	public int registMember(MemberVO bean) {
		return mapper.insertMember(bean);
	}
}
