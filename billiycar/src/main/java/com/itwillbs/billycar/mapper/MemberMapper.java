package com.itwillbs.billycar.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itwill.billycar.vo.MemberVO;

@Mapper
public interface MemberMapper {
	int insertMemever(MemberVO member);
}
