package com.itwill.billycar.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwill.billycar.vo.AdminVO;
import com.itwill.billycar.vo.MemberVO;

@Mapper
public interface AdminMapper {
	AdminVO selectMember(AdminVO admin);
	
	//회원 목록 조회
	List<MemberVO> selectMemberList();
}
