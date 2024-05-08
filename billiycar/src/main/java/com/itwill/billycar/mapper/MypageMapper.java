package com.itwill.billycar.mapper;

import java.util.List;

import com.itwill.billycar.vo.MemberVO;
import com.itwill.billycar.vo.QnaVO;

public interface MypageMapper {

	
	
	MemberVO selectMemberInfo(String memberId);

	MemberVO selectMemberPasswd(String memberId);

//	Object selectMemberQna(String memberId);

	List<QnaVO> selcetMemberQna(String memberId);

	

	


	
}
