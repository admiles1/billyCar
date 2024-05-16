package com.itwill.billycar.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwill.billycar.vo.EventVO;

@Mapper
public interface EventMapper {

	int updateEvent(EventVO event);

	List<EventVO> selectEventList();

	EventVO selectEventContent(int event_idx);

}
