package com.itwill.billycar.Controller;

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

import com.itwill.billycar.service.AdminService;
import com.itwill.billycar.service.ReservService;
import com.itwill.billycar.service.ReviewService;
import com.itwill.billycar.vo.CarReviewVO;
import com.itwill.billycar.vo.CarVO;
import com.itwill.billycar.vo.CommonVO;
import com.itwill.billycar.vo.ReviewVO;

@Controller
public class ReservController {
	@Autowired  ReservService reservService;
	@Autowired  AdminService adminService;
	@Autowired ReviewService reviewService;
	
	// 조건검색하지않고 예약페이지 진입시 (모든 차량검색, 페이징처리)
	@GetMapping("reservation")
	public String reservationget(Model model) {
		List<CommonVO> fuels = adminService.getFuels();
		List<CommonVO> types = adminService.getTypes();
		model.addAttribute("types", types);
		model.addAttribute("fuels", fuels);
		model.addAttribute("needSearch", true);
		return "reservation/reservation";
	}
	
	// 메인페이지, 예약페이지에서 조건을 입력하였을 시 (조건에 맞는 차량 검색 및 받아온 값 표시)
	@PostMapping("reservation")
	public String reservationpost(CarVO car
								, @RequestParam(defaultValue = "") Map<String,String> map 
								, Model model) {
		
		List<CarVO> cars = null;
		if(car.getCar_type() != null && car.getCar_fuel() == null) { 	// 자동차타입 조건만 존재 할 경우
			// search메소드로 스트링 포맷 변환 후 초기화
			car.setCar_type(searchMethod(car.getCar_type()));
			
			
			Set<String> hasThisType = new HashSet<String>();
			cars = reservService.selectCarList(car);
			
			for (CarVO c : cars) {
				hasThisType.add(c.getCar_type());
			}
			model.addAttribute("hasThisType", hasThisType);
			
			
		} else if (car.getCar_type() == null && car.getCar_fuel() != null) { // 자동차연료 조건만 존재 할 경우
			car.setCar_fuel(searchMethod(car.getCar_fuel()));
			cars = reservService.selectCarList(car);
			
			Set<String> hasThisFuel = new HashSet<String>();
			for (CarVO c : cars) {
				hasThisFuel.add(c.getCar_fuel());
			}
			
			model.addAttribute("hasThisFuel", hasThisFuel);
			
		} else if (car.getCar_type() == null && car.getCar_fuel() == null) { // 두 가지 모두 검색하지 않을 경우
			
			cars = reservService.selectCarList(car);
			
		} else { // 두 가지 모두 검색 할 경우
			
			car.setCar_fuel(searchMethod(car.getCar_fuel()));
			car.setCar_type(searchMethod(car.getCar_type()));
			cars = reservService.selectCarList(car);
			
			Set<String> hasThisType = new HashSet<String>();
			Set<String> hasThisFuel = new HashSet<String>();
			
			for (CarVO c : cars) {
				hasThisType.add(c.getCar_type());
				hasThisFuel.add(c.getCar_fuel());
			}
			
			model.addAttribute("hasThisType", hasThisType);
			model.addAttribute("hasThisFuel", hasThisFuel);
		}
		
		// 공통 코드에서 type, fule 조회해서 가져오기
		model.addAttribute("pickupDate", map.get("reserv_pickupdate"));
		model.addAttribute("returnDate", map.get("reserv_returndate"));
		model.addAttribute("types", adminService.getTypes());
		model.addAttribute("fuels", adminService.getFuels());
		model.addAttribute("cars", cars);
		
		return "reservation/reservation";
	}
	
	@GetMapping("reservationdetail")
	public String reservationdetail(CarVO car 
			                        , @RequestParam(defaultValue = "") Map<String, String> map 
			                        , Model model) {
		System.out.println(map);
		// idx없이 강제로 상세예약페이지 진입시
		if (map.get("idx") == null) {
			model.addAttribute("msg", "차량을 선택하여 주십시오");
			model.addAttribute("targetURL", "reservation");
			return "err/fail";
		} 
		
		// db에서 받아온 idx에 맞는 차조회
		car = reservService.getCar(Integer.parseInt(map.get("idx")));
		
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
	public String review(Model model, @RequestParam(value = "option", required = false) String option) {
		if (option == null) {
	        option = "latest"; // 기본값 설정
	    }
		
		List<CarReviewVO> reviewList = reviewService.selectReviewList(option);
		System.out.println("List<CarReviewVO> reviewList : " + reviewList);
		model.addAttribute("reviewList", reviewList);
		return "reservation/review";
	}
	
	
	// 호출용 메소드
	public String searchMethod(String option) {
		String[] strArr = option.split(",");
		StringJoiner options = new StringJoiner(",");
		for(String s : strArr) {
			s = "'" + s + "'";
			options.add(s);
		}
		return options.toString();
	}
}
