package com.itwill.billycar.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class guideController {
	
	@GetMapping("guideCompany")
	public String guideCompany() {
		return "guidance/company";
	}
	
	@GetMapping("guideRental")
	public String guideReantal() {
		return "guidance/rental";
	}
	
	@GetMapping("guideRefund")
	public String guideRefund() {
		return "guidance/refund";
	}
	
	@GetMapping("guideCar")
	public String guideCar() {
		return "guidance/car_introduction";
	}
	
}
