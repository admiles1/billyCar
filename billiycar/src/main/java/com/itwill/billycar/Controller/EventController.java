package com.itwill.billycar.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.itwill.billycar.service.EventService;
import com.itwill.billycar.service.Memberservice;
import com.itwill.billycar.vo.EventVO;

@Controller
public class EventController {
	
	@Autowired
	private EventService service;
	
	@GetMapping("event")
	public String event() {
		return "event/eventPage";
	}
	
	@GetMapping("event1")
	public String event1() {
		return "event/event1";
	}
	
	@GetMapping("event2")
	public String event2() {
		return "event/event2";
	}
	
	@GetMapping("event3")
	public String event3() {
		return "event/event3";
	}
	
	@GetMapping("eventWrite")
	public String eventWrite() {
		return "event/event_write";
	}
	
	@PostMapping("eventWrite")
	public String eventWritePro(EventVO event) {
		
//		int updateCnt = service.updateEvent(event);
		
		
		return "";
	}
	
	
}
