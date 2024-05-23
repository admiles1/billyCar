package com.itwill.billycar.Controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringJoiner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwill.billycar.service.AdminService;
import com.itwill.billycar.service.ReservService;
import com.itwill.billycar.service.ReviewService;
import com.itwill.billycar.vo.CarReviewVO;
import com.itwill.billycar.vo.CarVO;
import com.itwill.billycar.vo.MemberVO;
import com.itwill.billycar.vo.HeartVO;
import com.itwill.billycar.vo.PageInfo;
import com.itwill.billycar.vo.ReservVO;
import com.itwill.billycar.vo.ReviewVO;

import retrofit2.http.GET;

@Controller
public class ReservController {
	@Autowired  ReservService reservService;
	@Autowired  AdminService adminService;
	@Autowired ReviewService reviewService;
	
	// 조건검색하지않고 예약페이지 진입시 (모든 차량검색, 페이징처리)
	
	@GetMapping("reservation")
	public String reservationget(CarVO car
								, @RequestParam(defaultValue = "") Map<String,String> map 
								, Model model
								, @RequestParam(defaultValue = "1") int pageNum) {
		
		LocalDateTime now = LocalDateTime.now();
		// 접속한 날짜 기준 다음날 06시 ~ 07시
		// pickupDate 기준 날 + 1 06시
		// returnDate 기준날  + 2 07시
		ReservVO reserv = new ReservVO();
		LocalDateTime defalutPickup = now.withDayOfMonth(now.getDayOfMonth() +1).withHour(6).withMinute(0).withSecond(0).withNano(0);
		LocalDateTime defalutReturn = now.withDayOfMonth(now.getDayOfMonth() +2).withHour(7).withMinute(0).withSecond(0).withNano(0);
		// Ex) 2024-05-20일 접속 기준 defalutPickup = 2024-05-21T06:00 // defalutReturn = 2024-05-22T07:00
		// T기준 스플릿 [0] 날짜 [1] 시간  XXX[1].substring(0, 2) 시간단위만 분리
		map.put("reserv_pickupdate", defalutPickup.toString().split("T")[0]);
		map.put("pickupTime", defalutPickup.toString().split("T")[1].substring(0, 2));
		map.put("reserv_returndate", defalutReturn.toString().split("T")[0]);
		map.put("returnTime", defalutReturn.toString().split("T")[1].substring(0, 2));

		reserv.setReserv_pickupdate(defalutPickup);
		reserv.setReserv_returndate(defalutReturn);
		
		 // 한 번 검색당 4개씩 보여주기
	    int listLimit = 4;
	    int startRow = (pageNum - 1) * listLimit;
		
		// 자동차검색
		List<Map<String, String>> cars = reservService.getCarList(car, reserv, startRow , listLimit);
		System.out.println(cars);
		// 공통 코드에서 type, fule 조회해서 가져오기 TODO = 줄일것
		model.addAttribute("schedule", map);
		model.addAttribute("types", adminService.getTypes());
		model.addAttribute("fuels", adminService.getFuels());
		model.addAttribute("BusinessHours", adminService.getBusinesshours());
		model.addAttribute("cars", cars);
		
		return "reservation/reservation";
	}
	
	// 메인페이지에서 조건을 입력하였을 시 (조건에 맞는 차량 검색 및 받아온 값 표시)
	@PostMapping("reservation")
	public String reservationpost(CarVO car
								, @RequestParam(defaultValue = "") Map<String,String> map 
								, Model model
								, @RequestParam(defaultValue = "1")int pageNum) {
		
		ReservVO reserv = new ReservVO();
		String pickupdate = map.get("reserv_pickupdate") + " " + map.get("pickupTime");
		String returndate = map.get("reserv_returndate") + " " + map.get("returnTime");
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH");
		reserv.setReserv_pickupdate(LocalDateTime.parse(pickupdate, formatter));
		reserv.setReserv_returndate(LocalDateTime.parse(returndate, formatter));
		
		String carType = car.getCar_type();
		String carFuel = car.getCar_fuel();
		
		model.addAttribute("selType", carType);
		model.addAttribute("selFuel", carFuel);
		
		if(carType.equals("")) {
			car.setCar_type(null);
			carType = null;
		}
		
		if(carFuel.equals("")) {
			car.setCar_fuel(null);
			carFuel = null;
		}
		
		if(carType != null && carFuel == null) { 	// 자동차타입 조건만 존재 할 경우
			// search메소드로 스트링 포맷 변환 후 초기화
			car.setCar_type(searchMethod(carType));
		} else if (carType == null && carFuel != null) { // 자동차연료 조건만 존재 할 경우
			car.setCar_fuel(searchMethod(carFuel));
		} else if (carType != null && carFuel != null) { // 두 가지 모두 검색 할 경우
			car.setCar_fuel(searchMethod(carFuel));
			car.setCar_type(searchMethod(carType));
		} 
		
		 // 한 번 검색당 4개씩 보여주기
	    int listLimit = 4;
	    int startRow = (pageNum - 1) * listLimit;
		
		// 자동차검색
		List<Map<String, String>> cars = reservService.getCarList(car, reserv, startRow , listLimit);
		// 공통 코드에서 type, fule 조회해서 가져오기 TODO = 줄일것
		model.addAttribute("schedule", map);
		model.addAttribute("types", adminService.getTypes());
		model.addAttribute("fuels", adminService.getFuels());
		model.addAttribute("BusinessHours", adminService.getBusinesshours());
		model.addAttribute("cars", cars);
		
		return "reservation/reservation";
	}
	
	// ajax 차량검색
	@ResponseBody
	@PostMapping("SelectCarList")
	public List<Map<String, String>> SelectCarList(CarVO car
							, @RequestParam(defaultValue = "") Map<String, String> map 
				            , Model model
				            , @RequestParam(defaultValue = "1")int pageNum) {
		System.out.println(map);
		pageNum = 1;
		ReservVO reserv = new ReservVO();
		String pickupdate = map.get("reserv_pickupdate") + " " + map.get("pickupTime");
		String returndate = map.get("reserv_returndate") + " " + map.get("returnTime");
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH");
		reserv.setReserv_pickupdate(LocalDateTime.parse(pickupdate, formatter));
		reserv.setReserv_returndate(LocalDateTime.parse(returndate, formatter));
		
		String carType = car.getCar_type();
		String carFuel = car.getCar_fuel();
		
		if(carType != null && carFuel == null) { 	// 자동차타입 조건만 존재 할 경우
			// search메소드로 스트링 포맷 변환 후 초기화
			car.setCar_type(searchMethod(carType));
		} else if (carType == null && carFuel != null) { // 자동차연료 조건만 존재 할 경우
			car.setCar_fuel(searchMethod(carFuel));
		} else if (carType != null && carFuel != null) { // 두 가지 모두 검색 할 경우
			car.setCar_fuel(searchMethod(carFuel));
			car.setCar_type(searchMethod(carType));
		} 
		
		int listLimit = 4;
	    int startRow = (pageNum - 1) * listLimit;
		List<Map<String, String>> cars = reservService.getCarList(car, reserv, startRow, listLimit);
		System.out.println(cars);
		return cars;
	}
	
	
	// 차량 더보기
	@ResponseBody
	@PostMapping("MoreList")
	public List<Map<String, String>> moreList(CarVO car
											, @RequestParam(defaultValue = "") Map<String, String> map 
											, Model model
											, @RequestParam(defaultValue = "1")int pageNum) {
		System.out.println("========================================================");
		ReservVO reserv = new ReservVO();
		String pickupdate = map.get("reserv_pickupdate") + " " + map.get("pickupTime");
		String returndate = map.get("reserv_returndate") + " " + map.get("returnTime");
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH");
		reserv.setReserv_pickupdate(LocalDateTime.parse(pickupdate, formatter));
		reserv.setReserv_returndate(LocalDateTime.parse(returndate, formatter));
		
		String carType = car.getCar_type();
		String carFuel = car.getCar_fuel();
		
		if(carType.equals("")) {
			car.setCar_type(null);
			carType = null;
		}
		
		if(carFuel.equals("")) {
			car.setCar_fuel(null);
			carFuel = null;
		}
		
		if(carType != null && carFuel == null) { 	// 자동차타입 조건만 존재 할 경우
			// search메소드로 스트링 포맷 변환 후 초기화
			car.setCar_type(searchMethod(carType));
		} else if (carType == null && carFuel != null) { // 자동차연료 조건만 존재 할 경우
			car.setCar_fuel(searchMethod(carFuel));
		} else if (carType != null && carFuel != null) { // 두 가지 모두 검색 할 경우
			car.setCar_fuel(searchMethod(carFuel));
			car.setCar_type(searchMethod(carType));
		} 
		
		int listLimit = 4;
		int startRow = (pageNum - 1) * listLimit;
		List<Map<String, String>> cars = reservService.getCarList(car, reserv, startRow, listLimit);

		return cars;
	} // 차량 더보기
	
	//상세 차량 조회 페이지
	@GetMapping("detail")
	public String reservdetail(CarVO car
							, @RequestParam(defaultValue = "") Map<String, String> map 
				            , Model model) {
		
		String[] schedule = map.get("schedule").split(",");
		String pickupdate = schedule[0];
		String returndate = schedule[1];
		String pickupLocation = schedule[2];
		String returnLocation = schedule[3];
		
		
		ReservVO reserv = new ReservVO();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH");
		reserv.setReserv_pickupdate(LocalDateTime.parse(pickupdate, formatter));
		reserv.setReserv_returndate(LocalDateTime.parse(returndate, formatter));
		
		String carType = car.getCar_type();
		String carFuel = car.getCar_fuel();
		
		if(carType != null) {
			if(carType.equals("")) {
				car.setCar_type(null);
				carType = null;
			}
		};
		
		if(carFuel != null) {
			if(carFuel.equals("")) {
				car.setCar_fuel(null);
				carFuel = null;
			}
		};
		
		System.out.println(car);
		
		if(carType != null && carFuel == null) { 	// 자동차타입 조건만 존재 할 경우
			// search메소드로 스트링 포맷 변환 후 초기화
			car.setCar_type(searchMethod(carType));
		} else if (carType == null && carFuel != null) { // 자동차연료 조건만 존재 할 경우
			car.setCar_fuel(searchMethod(carFuel));
		} else if (carType != null && carFuel != null) { // 두 가지 모두 검색 할 경우
			car.setCar_fuel(searchMethod(carFuel));
			car.setCar_type(searchMethod(carType));
		} 
		
		// 자동차검색
		Map<String, String> selectCar = reservService.getCar(car, reserv);
		System.out.println(selectCar);
		
		String carNumber = selectCar.get("car_number");
		
		// 리뷰 검색
		List<ReviewVO> reviewes = reviewService.getReview(carNumber);
		
		while(true) {
			if(reviewes.size() < 3) {
				reviewes.add(new ReviewVO());
			} else {
				break;
			}
		}
		
		model.addAttribute("reviewes", reviewes);
		model.addAttribute("car", selectCar);
		return "reservation/reserv_detail";
	}
	
	@GetMapping("review")
	public String review(Model model,
					@RequestParam(defaultValue = "latest") String option,
					@RequestParam(defaultValue = "1") int pageNum
					) {
		System.out.println("review");
		int listLimit = 4;
		int startRow = (pageNum - 1) * listLimit;
		
		if (option == null) {
	        option = "latest"; // 기본값 설정
	    }
		
		System.out.println(listLimit);
		System.out.println(startRow);
		System.out.println(option);
		List<CarReviewVO> reviewList = reviewService.selectReviewList(option,startRow,listLimit);
		System.out.println("List<CarReviewVO> reviewList : " + reviewList);
		
		int reviewListCount = reviewService.selectAllReview();
		int pageListLimit = 4;
		
		//----------------------------------------------------------------
		int maxPage = reviewListCount/listLimit + (reviewListCount%listLimit > 0 ? 1 : 0);
		System.out.println(maxPage);
		//----------------------------------------------------------------
		//시작페이지 설정
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		//끝페이지 설정
		int endPage = startPage + pageListLimit - 1;
				
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		
		System.out.println("option : " + option);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("option", option);
		model.addAttribute("pageInfo", new PageInfo(reviewListCount, pageListLimit, maxPage, startPage, endPage));
		
		return "reservation/review";
	}
	
	
	@ResponseBody
	@GetMapping("reviewOption")
	public Map<String, Object> reviewOption(@RequestParam(defaultValue = "latest") String option,
	                                        @RequestParam(defaultValue = "1") int pageNum) {
	    System.out.println("option 값 : " + option);
	    if (option == null) {
	        option = "latest"; // 기본값 설정
	    }

	    int listLimit = 4;
	    int startRow = (pageNum - 1) * listLimit;

	    System.out.println("ajax사용했을때 option : " + option);

	    List<CarReviewVO> reviewList = reviewService.selectReviewList(option, startRow, listLimit);
	    System.out.println("List<CarReviewVO> reviewList : " + reviewList);

	    int reviewListCount = reviewService.selectAllReview();
	    int pageListLimit = 4;

	    //----------------------------------------------------------------
	    int maxPage = reviewListCount / listLimit + (reviewListCount % listLimit > 0 ? 1 : 0);
	    System.out.println(maxPage);
	    //----------------------------------------------------------------
	    //시작페이지 설정
	    int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
	    //끝페이지 설정
	    int endPage = startPage + pageListLimit - 1;

	    if (endPage > maxPage) {
	        endPage = maxPage;
	    }

	    Map<String, Object> data = new HashMap<>();
	    data.put("reviewList", reviewList);
	    data.put("option", option);
	    data.put("pageInfo", new PageInfo(reviewListCount, pageListLimit, maxPage, startPage, endPage));
	    System.out.println("data : " + data);
	    return data;
	}
	
	// 맵핑메소드는 이 위에
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
