package com.itwill.billycar.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.itwill.billycar.vo.MailAuthInfoVO;
import com.itwill.billycar.vo.MemberVO;

@Mapper
public interface MemberMapper {

	int insertMember(MemberVO member); //회원가입 mapper
	
//	boolean selectCorrectUser(MemberVO member); // 로그인 mapper

	boolean selectCheckID(String member_id);// 회원가입 아이디 중복체크

	MemberVO selectMember(MemberVO member); 

	MemberVO selectForgotId(MemberVO member); // 이름과 이메일로 아이디 찾기

	MemberVO selectForgotPw(MemberVO member); // 아이디, 이름, 이메일로 비밀번호 찾기
	
	int selectMemberCount();

	int selectTodayMember();

	Map<String, String> selectMailAuthInfo(MailAuthInfoVO mailAuthInfo);

	void insertMailAuthInfo(MailAuthInfoVO mailAuthInfo);

	void updateMailAuthInfo(MailAuthInfoVO mailAuthInfo);

	boolean selectEmptyEmail(String member_email);

	boolean selectEmptyPhoneNum(String member_phone);


}
