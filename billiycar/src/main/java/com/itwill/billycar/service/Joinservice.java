package com.itwill.billycar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.billycar.vo.MemberVO;
import com.itwillbs.billycar.mapper.MemberMapper;

@Service
public class Joinservice {
	@Autowired
	private MemberMapper mapper;
	
	public int registMember(MemberVO bean) {
		return mapper.insertMemever(bean);
	}
}
