package com.itwill.billycar.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwill.billycar.vo.CouponVO;
import com.itwill.billycar.vo.EventVO;

@Mapper
public interface EventMapper {

	int insertEvent(EventVO event);

	List<EventVO> selectEventList(int limit);

	EventVO selectEventContent(int event_idx);

	int deleteEvent(EventVO event);

	int updateEvent(EventVO event);

	String selectEventImage(EventVO event);
	
	public List<CouponVO> selectCouponList();
}
