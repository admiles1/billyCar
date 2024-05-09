package com.itwill.billycar.Controller;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.StringJoiner;

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
		model.addAttribute("needSearch", true);
		
		return "reservation/reservation";
	}
	
	// 메인페이지, 예약페이지에서 조건을 입력하였을 시 (조건에 맞는 차량 검색 및 받아온 값 표시)
	@PostMapping("reservation")
	public String reservationpost(CarVO car, Model model) {
		System.out.println(car);
//		String str = "준중형,중형,테스트";
//		String[] strArr = str.split(",");
//		StringJoiner sj = new StringJoiner(",");
//		for(String s : strArr) {
//			s = "'" + s + "'";
//			sj.add(s);
//		}
//		System.out.println(sj);
//		
		List<CarVO> cars = service.selectCarList(car);
		
		Set<String> hasThisType = new HashSet<String>();
		Set<String> hasThisFuel = new HashSet<String>();
		
		for (CarVO c : cars) {
			hasThisType.add(c.getCar_type());
			hasThisFuel.add(c.getCar_fuel());
		}
		model.addAttribute("hasThisType", hasThisType);
		model.addAttribute("hasThisFuel", hasThisFuel);
		model.addAttribute("cars", cars);
		return "reservation/reservation";
	}
	
	@GetMapping("reservationdetail")
	public String reservationdetail(CarVO car 
			                        , @RequestParam(defaultValue = "") Map<String, String> map 
			                        , Model model) {
		System.out.println(map);
		// idx없이 강제로 상세예약페이지 진입시
		if (map.get("idx").equals("")) {
			model.addAttribute("msg", "차량을 선택하여 주십시오");
			model.addAttribute("targetURL", "reservation");
			return "err/fail";
		} 
		
		// db에서 받아온 idx에 맞는 차조회
		car = service.getCar(Integer.parseInt(map.get("idx")));
		
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
		
		
		Date startDate = new Date();
		
		
		return "reservation/review";
	}
	
}
