package com.itwill.billycar.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ReservController {
	
	
	// 상탑 차량예약 탭으로 링크 이동시
	@GetMapping("reservation")
	public String reservationGet() {
		return "reservation/reservation";
	}
	
	// 메인페이지, 예약페이지에서 조건들을 검색할 시
	@PostMapping("reservation")
	public String reservationPost() {
		return "reservation/reservation";
	}
	
	@GetMapping("reservationdetail")
	public String reservationdetail() {
		return "reservation/reserv_detail";
	}
	
	@GetMapping("review")
	public String review() {
		return "reservation/review";
	}
	
}
