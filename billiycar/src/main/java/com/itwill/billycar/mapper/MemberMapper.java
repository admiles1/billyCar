package com.itwill.billycar.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itwill.billycar.vo.MemberVO;

@Mapper
public interface MemberMapper {

	int insertMember(MemberVO member); //회원가입 mapper
	
	boolean selectCorrectUser(MemberVO member); // 로그인 mapper

	boolean selectCheckID(String member_id);// 회원가입 아이디 중복체크
	
}
