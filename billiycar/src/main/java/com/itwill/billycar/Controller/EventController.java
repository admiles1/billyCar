package com.itwill.billycar.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class EventController {
	
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
	
}
