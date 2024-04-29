package com.itwill.billycar.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReservController {
	
	@GetMapping("reservation")
	public String reservation() {
		return "reservation/reservation";
	}
	
	@GetMapping("reservationdetail")
	public String reservationdetail() {
		return "reservation/reserv_detail";
	}
	
}
