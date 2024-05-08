package com.itwill.billycar.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.billycar.mapper.MypageMapper;
import com.itwill.billycar.vo.MemberVO;
import com.itwill.billycar.vo.QnaVO;

@Service
public class MypageService {
	
	@Autowired
	private MypageMapper mapper;
	
	public MemberVO getMemberInfo(String memberId) {
        // 회원 아이디를 이용하여 회원 정보를 가져오는 로직
        return mapper.selectMemberInfo(memberId);
    }
//
//	public MemberVO getMemberPasswd(String memberId) {
//		return mapper.selectMemberPasswd(memberId);
//	}

//	public Object getMemberQna(String memberId) {
//		return mapper.selectMemberQna(memberId);
//	}

	public List<QnaVO> getMemberQna(String memberId) {
		return mapper.selcetMemberQna(memberId);
	}



	

	

	
	
	
	
	
//	public MemberVO getMemberInfo(MemberVO member) {
//		
//		
//		return mapper.selectMember(member);
//	}
	
}
