package com.itwill.billycar.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itwill.billycar.vo.AdminVO;

@Mapper
public interface AdminMapper {
	AdminVO selectMember(AdminVO admin);
}
