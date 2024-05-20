package com.itwill.billycar.Controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.itwill.billycar.service.AdminCusService;
import com.itwill.billycar.service.AdminService;
import com.itwill.billycar.service.Memberservice;
import com.itwill.billycar.service.PaymentService;
import com.itwill.billycar.service.ReviewService;
import com.itwill.billycar.vo.AdminVO;
import com.itwill.billycar.vo.CarVO;
import com.itwill.billycar.vo.CommonVO;
import com.itwill.billycar.vo.FaqVO;
import com.itwill.billycar.vo.MemberVO;
import com.itwill.billycar.vo.PageInfo;
import com.itwill.billycar.vo.QnaVO;
import com.itwill.billycar.vo.ReservVO;

@Controller
public class AdminController {
	@Autowired
	private AdminService service;
	
	@Autowired
	private Memberservice memberService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private PaymentService paymentService;
	
	
	@Autowired
	private HttpSession session;
	
	
	@GetMapping("adminForm")
	public String adminForm(Model model, AdminVO admin) {
		System.out.println("adminForm");
		
		return "admin/admin_form";
	}
	
	@PostMapping("adminPro")
	public String adminPro(AdminVO admin,HttpSession session,Model model) {
		System.out.println("adminPro");
		AdminVO returnAdmin = service.adminlogin(admin);
		
		if(returnAdmin == null) {
			model.addAttribute("msg","등록 실패");
			return "err/fail";
		}
		
		session.setAttribute("member_id", returnAdmin.getAdmin_id());
		
		System.out.println("관리자 아이디 : " + session.getAttribute("member_id"));
		return "index";
	}
	
	@GetMapping("admin")
	public String admin(Model model, AdminVO admin) {
		
		admin.setAdmin_id((String)session.getAttribute("member_id"));
		
		
		// 관리자 아닐 경우 돌려보내기
		if(session.getAttribute("member_id")==null || !session.getAttribute("member_id").equals(admin.getAdmin_id())) {
			model.addAttribute("msg","접근 권한이 없습니다");
			return "err/fail";
		} 
		
		//총 회원 수
		int totalMember = memberService.selectMemberCount();
		model.addAttribute("totalMember", totalMember);
		
		//오늘 등록한 회원 수
		int todayMember = memberService.todayMemberCount();
		System.out.println("오늘 등록한 회원 수 : " + todayMember);
		model.addAttribute("todayMember", todayMember);
		
		//총 차량 수
		int allCarCount = service.selectAllcar(5);
		System.out.println("selectAllcar(총 차량) : " + allCarCount);
		model.addAttribute("allCarCount", allCarCount);
		
		//대여 가능 차량 수
		int rentCarCount = service.selectAllcar(0);
		System.out.println("selectAllcar(대여 가능 차량) : " + rentCarCount);
		model.addAttribute("rentCarCount", rentCarCount);
		
		//총 리뷰 수
		int allReview = reviewService.selectAllReview();
		System.out.println("총 리뷰 : " + allReview);
		model.addAttribute("allReview", allReview);
		
		//평균 별점
		double reviewAvg = reviewService.selectReviewAvg();
		System.out.println("리뷰 평균 : " + reviewAvg);
		model.addAttribute("reviewAvg", reviewAvg);
		
		//월별 매출 통계
		List<Integer> paymentAmount = paymentService.salesMonthSelect();
		System.out.println("총 매출 받아온 값(controller) : " + paymentAmount);
		
		model.addAttribute("paymentAmount", paymentAmount);
		return "admin/admin_main";
	}
	
	
	@GetMapping("adminMember")
	public String adminMember() {
		
		return "admin/admin_member";
	}
	
	//회원 검색
	@GetMapping("adminMemberSearch")
	public String adminMemberSearch(@RequestParam(defaultValue = "") String searchType,
									@RequestParam(defaultValue = "") String searchKeyword,
									@RequestParam(defaultValue = "1") int pageNum,
									Model model) {
		
		
		int listLimit = 3;
		int startRow = (pageNum - 1) * listLimit;
		
		List<MemberVO> member = service.adminMemberList(searchType,searchKeyword,startRow,listLimit);
		
		int listCount = service.getMemberListCount(searchType,searchKeyword,startRow,listLimit);
		int pageListLimit = 3;
		
		//----------------------------------------------------------------
		int maxPage = listCount/listLimit + (listCount%listLimit > 0 ? 1 : 0);
		System.out.println(maxPage);
		//----------------------------------------------------------------
		//시작페이지 설정
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		//끝페이지 설정
		int endPage = startPage + pageListLimit - 1;
				
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		model.addAttribute("memberList", member);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("pageInfo", new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage));
		
		return "admin/admin_member";
	}
	
	//회원 상태 수정 폼 
	@GetMapping("memberStatus")
	public String memberStatus(MemberVO member) {
		return "admin/member_status";
	}
	
	//회원 상태 수정 PRO
	@PostMapping("memberStatus")
	public String memberStatusPro(MemberVO member, Model model) {
		
		int UpdateSuccess = service.MemberStatusModify(member);
		System.out.println("UpdateSuccess(member_id) : " + UpdateSuccess);
		
		if(UpdateSuccess > 0 ) {
			return "admin/member_status";
		}else {
			model.addAttribute("msg", "변경되지 않았습니다.");
			model.addAttribute("targetURL", "admin/admin_member");
			
			return "error/fail";
		}
		
	}

	// 차량 목록 조회
	@GetMapping("admin_car")
	public String admin_car(CarVO car, Model model) {
		
		List<CarVO> carList = service.getCar(car);
		model.addAttribute("carList", carList);
		
		return "admin/admin_car";
	}
	
	// 차량 목록 중 차량 삭제
	@PostMapping("deleteCar")
	@ResponseBody
	public String deleteCar(int carId, Model model) {
//		System.out.println("차량삭제번호 : " + carId);  // 넘어왔고
		
		int deleteCount = service.deleteCar(carId);
		
		if(deleteCount > 0) { // 성공 시 
			
			return "redirect:/admin_car";
		} else { // 실패 시
			model.addAttribute("msg", "차량삭제실패!");
			return "err/fail";
		}		
	}
	
	// 차량 검색
	@PostMapping("searchCars")
	public String searchCars() {
		
		return "";
				
	}
	
	// 차량브랜드 삭제
	@PostMapping("deleteNewCar")
	@ResponseBody
	public String deleteNewCar(String code) {
//		System.out.println(code);
		List<String> models = service.searchModel(code);
        if (!models.isEmpty()) {
            return "models_exist";
        }
		
		service.deleteCode(code);
		return "success";
	}
	
	// 차량 모델 삭제
	@PostMapping("deleteNewModel")
	@ResponseBody
	public String deleteNewModel(String code) {
		
		service.deleteModelCode(code);
		return "success";
	}
	
	// 차량 등록 페이지에 공통코드 가져가기
	@GetMapping("admin_car_registration")
	public String admin_car_registration(CommonVO common, Model model) {
//		System.out.println(common);
		
//		List<CommonVO> dbCommon = service.getCommon(common);
//		System.out.println(dbCommon);
//		model.addAttribute("common",dbCommon);
		
		// 제조사 정보 가져오기
	    List<CommonVO> brands = service.getBrands();
	    model.addAttribute("brands", brands);
		
	    
	    // 모델 정보 가져오기
	    List<CommonVO> models = service.getModel();
	    JsonArray jArr = new JsonArray(); // Json 배열만들기 (List 개념)
	    for(CommonVO vo : models) {
	    	JsonObject json = new JsonObject(); // Json 객체 생성 (VO개념) 
	    	json.addProperty("name", vo.getName()); // 모델 name json 객체에 주입
	    	json.addProperty("code", vo.getCode()); // 모델 code json 객체에 주입
	    	jArr.add(json); // json 배열에 json 객체 넣기
	    }
	    
	    model.addAttribute("models", jArr); // 그 json 배열을 모델에 넣기
	    
	    // 연료 정보 가져오기
	    List<CommonVO> fuels = service.getFuels();
	    model.addAttribute("fuels", fuels);
	    
	    // 타입 정보 가져오기
	    List<CommonVO> types = service.getTypes();
	    model.addAttribute("types", types);
	    
		return "admin/admin_car_registration";
	}
	
	
	// 차량 등록
	@PostMapping("carUpload")
	public String carUpload(CarVO car, String car_number1, String car_number2, String car_number3,HttpServletRequest request, Model model) {
//		System.out.println(car); // 차량정보
		
		// 차량 번포판 3개를 하나의 컬럼에 넣기 위해 합치기
		car.setCar_number(car_number1+car_number2+car_number3);
		System.out.println(car.getCar_number());
		
		// 차량최대인수를 숫자 + "인승" 으로 DB에 넣기위해 사전작업
		car.setCar_capacity(car.getCar_capacity() + "인승"); 
		// 1) 경로
		String uploadDir = "/resources/upload"; // 가상 경로
		String saveDir = session.getServletContext().getRealPath(uploadDir); // 실제 경로
		
	    // 제조사와 모델을 사용한 서브 디렉토리 설정
	    String carbrand = car.getCar_brand();
	    String carmodel = car.getCar_model();
		String subDir = carbrand + File.separator + carmodel;
		
		// 4) 기존 업로드 실제 경로에 서브 디렉토리 결합
		saveDir += File.separator + subDir;
		
		// 5) 해당 디렉토리가 실제 경로가 존재하지 않을 경우 자동 생성
		try {
			// (1) java.nio.file.Paths의 get() 호출하여 path 객체 리턴
			Path path = Paths.get(saveDir); 
			
			// (2) files 클래스의 createDirectories()로 실제 경로 생성
			Files.createDirectories(path);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// 6) 실제 파일 다루기
		MultipartFile mfile = car.getMfc_img(); // 여기 폼에 있는 file 이름으로 가져오기
		System.out.println(mfile.getOriginalFilename());

		// 7) 중복 이름 방지
		String uuid = UUID.randomUUID().toString();
		
		// 7-1) 업로드 안 됐을 시 널스트링
		car.setCar_img(""); // DB에 있는 file 이름 설정
		
		// 7-2) 결합
		String fileName = uuid.substring(0,8) + "_" + mfile.getOriginalFilename();
		
		if(!mfile.getOriginalFilename().equals("")) {
			car.setCar_img(subDir+ File.separator +fileName);
		}
		
		// DB 작업 ON 
		int insertCount = service.carUpload(car);
		
		try {
			if(!mfile.getOriginalFilename().equals("")) {
				mfile.transferTo(new File(saveDir, fileName));
			}
				
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} // 이것도 밑에 추가
		
		
		if(insertCount > 0) { // 성공 시 
			
			return "redirect:/admin_car_registration";
		} else { // 실패 시
			model.addAttribute("msg", "차량등록실패!");
			return "err/fail";
		}
		
	}
	
	// 제조사 추가 페이지 이동
	@GetMapping("addBrand")
    public String showAddBrandPage() {
        return "admin/addBrand"; // addBrandModel.jsp 파일의 경로
    }
	
	// 모델 추가 페이지 이동
	@GetMapping("addModel")
	public String showAddModelPage(){
		return "admin/addModel"; // addBrandModel.jsp 파일의 경로
	}
	
	// 새로운 제조사 추가
	@ResponseBody
	@PostMapping("addBrand")
    public String addBrand(Model model, String newBrandName) {
        System.out.println("새 브랜드 : " + newBrandName);
        int insertCount = service.addBrandModel(newBrandName);
        
        if (insertCount > 0) { // 성공 시 
            return "redirect:/admin_car_registration"; // 작업 후 차량 등록 페이지로 이동
        } else { // 실패 시
            model.addAttribute("msg", "차량등록실패!");
            return "err/fail";
        }
    }
	
	// 세로운 모델 추가
	@PostMapping("addModel")
	public String addModel(Model model, String brandName, String newModelName) {
		System.out.println("제조사 : " + brandName);
		System.out.println("새 차량모델 : " + newModelName);
		
		int insertCnt = service.addModel(brandName,newModelName);
		if (insertCnt > 0) { // 성공 시 
            return "redirect:/admin_car_registration"; // 작업 후 차량 등록 페이지로 이동
        } else { // 실패 시
            model.addAttribute("msg", "차량등록실패!");
            return "err/fail";
        }
		
	}
	
	// 차량 상태 수정을 위한 조회
	@GetMapping("carModify")
	public String carModify(@RequestParam("carId") int carId, Model model) {
	    // 특정 차량의 정보 조회
	    CarVO car = service.getCarById(carId);
	    
	    // 조회한 차량 정보를 수정 폼 페이지로 전달
	    model.addAttribute("car", car);
	    
	    return "admin/admin_car_modify";
	}
	
	// 차량 상태 수정 처리
	@PostMapping("carModifyPro")
	public String carModifyPro(@RequestParam("car_idx") int carId, CarVO car, Model model) {
	    // 전달된 차량 정보를 사용하여 데이터베이스에 업데이트 수행
		car.setCar_idx(carId);
	    int updateCount = service.updateCar(car);
	    
	    // 업데이트 결과에 따라 적절한 응답 반환
	    if (updateCount > 0) {
	        // 업데이트 성공 시
	        return "redirect:/admin_car";
	    } else {
	        // 업데이트 실패 시
	    	model.addAttribute("msg", "수정 실패!");
	        return "err/fail";
	    }
	}

	
	// 예약 차량 조회
	@GetMapping("admin_car_reservation")
	public String admin_car_reservation(CommonVO common, Model model) {
		
		// 제조사 정보 가져오기
	    List<CommonVO> brands = service.getBrands();
	    model.addAttribute("brands", brands);
	    // 모델 정보 가져오기
		List<CommonVO> models = service.getModel();
		model.addAttribute("models", models);

	    
		return "admin/admin_car_reservation";
	}
	
	@ResponseBody
	@PostMapping("showCarDetails")
	 public List<CarVO> showCarDetails(@RequestParam String modelCode) {
//		System.out.println(modelCode);
		
        return service.getCarModel(modelCode);
    }
	
	@GetMapping("carReservationDetails")
	public String carReservationDetails(String carNumber,Model model) {
//		System.out.println("차 번호 왔니? " + carNumber);
		List<ReservVO> rsList = service.getReservation(carNumber);
		
		System.out.println("=============================================");
		for(ReservVO car : rsList) {
			System.out.println(car);
		}
		
		model.addAttribute("reservList", rsList);
		return "admin/admin_car_reservationDetails";
	}
	
	
	@GetMapping("admin_review")
	public String admin_review() {
		
		return "admin/admin_review";
	}
	
//	@GetMapping("adminAnswerList")
//	public String adminAnswerList(Model model) {
//		System.out.println("qnaList(controller)");
//		List<QnaVO> qna = service.adminAnswerList();
//		System.out.println(qna);
//		model.addAttribute("qna", qna);
//		
//		return "admin/admin_answerList";
//	}
	
	
}
