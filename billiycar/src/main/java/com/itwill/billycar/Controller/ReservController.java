package com.itwill.billycar.Controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.StringJoiner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
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
import com.itwill.billycar.vo.CommonVO;
import com.itwill.billycar.vo.PageInfo;
import com.itwill.billycar.vo.ReviewVO;
import com.mysql.cj.protocol.x.SyncFlushDeflaterOutputStream;
import com.itwill.billycar.vo.ReservVO;

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
		model.addAttribute("BHS", adminService.getBusinesshours().get(0).getName());
		model.addAttribute("BHE", adminService.getBusinesshours().get(1).getName());
		return "reservation/reservation";
	}
	
	// 메인페이지, 예약페이지에서 조건을 입력하였을 시 (조건에 맞는 차량 검색 및 받아온 값 표시)
	@PostMapping("reservation")
	public String reservationpost(CarVO car
								, @RequestParam(defaultValue = "") Map<String,String> map 
								, Model model) {
		System.out.println(car);
		// 체크박스 checked용 값 따로 빼두기 
		
		// 주입하면 변환해서 세팅못하니 따로 만들기
		ReservVO reserv = new ReservVO();
		String pickupdate = map.get("reserv_pickupdate") + " " + map.get("pickupTime");
		String returndate = map.get("reserv_returndate") + " " + map.get("returnTime");
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH");
		reserv.setReserv_pickupdate(LocalDateTime.parse(pickupdate, formatter));
		reserv.setReserv_returndate(LocalDateTime.parse(returndate, formatter));
		
		String carType = car.getCar_type();
		String carFuel = car.getCar_fuel();
		
		// from index
		// 널이 아니지만 널로 바꿈 
		// from reservation 아예 널로 넘어와서 메소드 호출불가
		if(carType != null) {
			if(carType.equals("")) {
				car.setCar_type(null);
				carType = null;
			}
		}
		
		if(carFuel != null) {
			if(carFuel.equals("")) {
				car.setCar_fuel(null);
				carFuel = null;
			}
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
		
		// 자동차검색
		List<Map<String, String>> cars = reservService.selectCarList(car, reserv);
		// 공통 코드에서 type, fule 조회해서 가져오기 TODO = 줄일것
		model.addAttribute("pickupDate", map.get("reserv_pickupdate"));
		model.addAttribute("pickupTime", map.get("pickupTime"));
		model.addAttribute("returnDate", map.get("reserv_returndate"));
		model.addAttribute("returnTime", map.get("returnTime"));
		model.addAttribute("pickupLocation", map.get("reserv_pickuplocation"));
		model.addAttribute("returnLocation", map.get("reserv_returnlocation"));
		model.addAttribute("types", adminService.getTypes());
		model.addAttribute("fuels", adminService.getFuels());
		model.addAttribute("BHS", adminService.getBusinesshours().get(0).getName());
		model.addAttribute("BHE", adminService.getBusinesshours().get(1).getName());
		model.addAttribute("cars", cars);
		
		System.out.println(cars);
		return "reservation/reservation";
	}
	
	@ResponseBody
	@PostMapping("SelectCarList")
	public List<Map<String, String>> SelectCarList(CarVO car
							, @RequestParam(defaultValue = "") Map<String, String> map 
				            , Model model) {
		System.out.println(car);
		System.out.println(map);
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
		
		List<Map<String, String>> cars = reservService.selectCarList(car, reserv);
		System.out.println(cars);
		System.out.println("---------------------------------");
		return cars;
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
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("option", option);
		model.addAttribute("pageInfo", new PageInfo(reviewListCount, pageListLimit, maxPage, startPage, endPage));
		
		return "reservation/review";
	}
	
	
	@ResponseBody
	@GetMapping("reviewOption")
	public Map<String, Object> reviewOption(@RequestParam(defaultValue = "latest") String option,
											@RequestParam(defaultValue = "1") int pageNum
											) {
		System.out.println("option 값 : " + option);
		if (option == null) {
	        option = "latest"; // 기본값 설정
	    }
		
		int listLimit = 4;
		int startRow = (pageNum - 1) * listLimit;
		
		System.out.println("ajax사용했을때 option : " + option);
		
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
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("reviewList", reviewList);
		data.put("option", option);
		data.put("pageInfo", new PageInfo(reviewListCount, pageListLimit, maxPage, startPage, endPage));
		System.out.println("data : " + data);
		return data;
	}
	
	
	
}
