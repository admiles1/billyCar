package com.itwill.billycar.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itwill.billycar.vo.NoticeVO;

@Mapper
public interface CsMapper {

	int insertNotice(NoticeVO notice);

}
