package com.itwill.billycar.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CsController {
	
	@GetMapping("cs")
	public String cs() {
		return "event/eventPage";
	}
	
}
