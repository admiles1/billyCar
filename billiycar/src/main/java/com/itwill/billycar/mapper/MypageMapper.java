package com.itwill.billycar.mapper;

import com.itwill.billycar.vo.MemberVO;

public interface MypageMapper {

//	MemberVO selectMember(MemberVO member);

	MemberVO selectMemberByMemberId(String memberId);

	
}
