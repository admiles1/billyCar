package com.itwill.billycar.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itwill.billycar.vo.MemberVO;

@Mapper
public interface LoginMapper {

	boolean selectCorrectUser(MemberVO member);

}
