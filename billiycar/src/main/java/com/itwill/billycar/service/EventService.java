package com.itwill.billycar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.billycar.mapper.EventMapper;
import com.itwill.billycar.vo.CouponVO;
import com.itwill.billycar.vo.EventVO;

@Service
public class EventService {
	@Autowired
	private EventMapper mapper;
	
	public int insertEvent(EventVO event) {
		return mapper.insertEvent(event);
	}

	public List<EventVO> selectEventList(int limit) {
		return mapper.selectEventList(limit);
	}

	public EventVO selectEventContent(int event_idx) {
		return mapper.selectEventContent(event_idx);
	}

	public int deleteEvent(EventVO event) {
		return mapper.deleteEvent(event);
	}

	public int updateEvent(EventVO event) {
		return mapper.updateEvent(event);
	}

	public String selectEventImage(EventVO event) {
		return mapper.selectEventImage(event);
	}
	
	
	public List<CouponVO> selectCouponList(){
		return mapper.selectCouponList();
	}

}
