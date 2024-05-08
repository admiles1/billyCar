package com.itwill.billycar.Controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwill.billycar.service.ReservService;
import com.itwill.billycar.vo.CarVO;

@Controller
public class ReservController {
	@Autowired  ReservService service;
	
	
	// 조건검색하지않고 예약페이지 진입시 (모든 차량검색, 페이징처리)
	@GetMapping("reservation")
	public String reservationget(Model model) {
		List<CarVO> cars = service.selectCarList();
		model.addAttribute("cars", cars);
		return "reservation/reservation";
	}
	
	// 메인페이지, 예약페이지에서 조건을 입력하였을 시 (조건에 맞는 차량 검색 및 받아온 값 표시)
	@PostMapping("reservation")
	public String reservationpost(@RequestParam(defaultValue = "") Map<String, String> map, 
								  @RequestParam(defaultValue = "") List<String> carType, 
								  @RequestParam(defaultValue = "") List<String> fuelType, 
								  Model model) {
		// 1. 차종류, 연료 각 값으로 빼서 가지고감
		// 2. select *
		//		from car 
		//	   where 자동차타입 in ('XX','OO') AND 자동차연료 in ('ㅁㅁ','ㅇㅇ');
		
		//TODO
		// 페이징처리
		// 받아온 조건들을 Map으로 관리 후 Model로 다시 넘겨주기
		
		// 1. 예약 일정
		model.addAttribute("pickupDate", map.get("pickupDate"));
		model.addAttribute("returnDate", map.get("returnDate"));
		model.addAttribute("pickupTime", map.get("pickupDate"));
		model.addAttribute("returnTime", map.get("returnDate"));
		
		// 2. 예약 지점과 반납 지점
	    // 3. 예약 자동차의 타입 (List객체로 받아옴(임시)
		// 4. 예약 자동차의 연료종류 (List객체로 받아옴(임시)
		return "reservation/reservation";
	}
	
	@GetMapping("reservationdetail")
	public String reservationdetail(CarVO car, int idx, Model model) {
		// idx없이 강제로 상세예약페이지 진입시
		if (idx == 0 ) {
			model.addAttribute("msg", "차량을 선택하여 주십시오");
			model.addAttribute("targetURL", "reservation");
			return "err/fail";
		} 
		
		// db에서 받아온 idx에 맞는 차조회
		car = service.getCar(idx);
		
		// 존재하지않는 idx를 조회했을 시
		if(car == null) {
			model.addAttribute("msg", "존재하지 않는 차량입니다");
			model.addAttribute("targetURL", "reservation");
			return "err/fail";
		} else { // db에서 조회성공하였을 시
			model.addAttribute("car", car);
			return "reservation/reserv_detail";
		}
	}
	
	@GetMapping("review")
	public String review() {
		return "reservation/review";
	}
	
}
