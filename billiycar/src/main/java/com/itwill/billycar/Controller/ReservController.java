package com.itwill.billycar.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ReservController {
	
	// 조건검색하지않고 예약페이지 진입시 (모든 차량검색, 페이징처리)
	@GetMapping("reservation")
	public String reservationget() {
		
		return "reservation/reservation";
	}
	
	// 메인페이지, 예약페이지에서 조건을 입력하였을 시 (조건에 맞는 차량 검색 및 받아온 값 표시)
	@PostMapping("reservation")
	public String reservationpost() {
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
