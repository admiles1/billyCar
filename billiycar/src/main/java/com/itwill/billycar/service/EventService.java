package com.itwill.billycar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.billycar.mapper.EventMapper;
import com.itwill.billycar.vo.EventVO;

@Service
public class EventService {
	@Autowired
	private EventMapper mapper;
	
	public int updateEvent(EventVO event) {
		return mapper.updateEvent(event);
	}

	public List<EventVO> selectEventList() {
		return mapper.selectEventList();
	}

	public EventVO selectEventContent(int event_idx) {
		return mapper.selectEventContent(event_idx);
	}

}
