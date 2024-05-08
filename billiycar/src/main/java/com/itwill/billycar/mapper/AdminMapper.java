package com.itwill.billycar.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwill.billycar.vo.AdminVO;
import com.itwill.billycar.vo.CarVO;
import com.itwill.billycar.vo.MemberVO;

@Mapper
public interface AdminMapper {
	AdminVO selectMember(AdminVO admin);
	
	//회원 목록 조회
	List<MemberVO> adminMemberList(@Param("searchType") String searchType,
			@Param("searchKeyword") String searchKeyword,
			@Param("startRow") int startRow,
			@Param("listLimit") int listLimit);

	int getMemberCount(@Param("searchType") String searchType,
			@Param("searchKeyword") String searchKeyword,
			@Param("startRow") int startRow,
			@Param("listLimit") int listLimit);

	int insertCar(CarVO car);

	int updateMember(MemberVO member);

}
