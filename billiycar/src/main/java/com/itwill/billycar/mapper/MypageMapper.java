package com.itwill.billycar.mapper;

import com.itwill.billycar.vo.MemberVO;

public interface MypageMapper {

	
	
	MemberVO selectMemberInfo(String memberId);

	MemberVO selectMemberPasswd(String memberId);


	


	
}
