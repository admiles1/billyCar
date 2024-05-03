package com.itwill.billycar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.billycar.mapper.MypageMapper;
import com.itwill.billycar.vo.MemberVO;

@Service
public class MypageService {
	
	@Autowired
	private MypageMapper mapper;
	
	public MemberVO getMemberInfo(String memberId) {
        // 회원 아이디를 이용하여 회원 정보를 가져오는 로직
        return mapper.selectMemberByMemberId(memberId);
    }

	
	
	
	
	
//	public MemberVO getMemberInfo(MemberVO member) {
//		
//		
//		return mapper.selectMember(member);
//	}
	
}
