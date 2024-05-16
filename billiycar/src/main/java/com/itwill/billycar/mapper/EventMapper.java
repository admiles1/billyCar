package com.itwill.billycar.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itwill.billycar.vo.EventVO;

@Mapper
public interface EventMapper {

	int updateEvent(EventVO event);

}
