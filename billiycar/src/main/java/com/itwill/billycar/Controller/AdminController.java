package com.itwill.billycar.Controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.itwill.billycar.service.AdminService;
import com.itwill.billycar.vo.AdminVO;
import com.itwill.billycar.vo.CarVO;
import com.itwill.billycar.vo.MemberVO;
import com.itwill.billycar.vo.PageInfo;
import com.itwill.billycar.vo.QnaVO;

@Controller
public class AdminController {
	@Autowired
	private AdminService service;
	
	@Autowired
	private HttpSession session;
	
	
	@GetMapping("adminForm")
	public String adminForm() {
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
	public String admin() {
		System.out.println("admin");
		
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

	
	
	@GetMapping("admin_blackList")
	public String admin_blackList() {
		
		return "admin/admin_blackList";
	}
	
	@GetMapping("admin_car")
	public String admin_car(CarVO car, Model model) {
		
		List<CarVO> carList = service.getCar(car);
		model.addAttribute("carList", carList);
		
		return "admin/admin_car";
	}
	
	@GetMapping("admin_car_registration")
	public String admin_car_registration() {
		
		return "admin/admin_car_registration";
	}
	
	// 차량 등록
	@PostMapping("carUpload")
	public String carUpload(CarVO car, HttpServletRequest request, Model model) {
		System.out.println(car); // 차량정보
		
		// 차량최대인수를 숫자 + "인승" 으로 DB에 넣기위해 사전작업
		car.setCar_capacity(car.getCar_capacity() + "인승"); 
		// 1) 경로
		String uploadDir = "/resources/upload"; // 가상 경로
		String saveDir = session.getServletContext().getRealPath(uploadDir); // 실제 경로
		
		// 2) 날짜별 서브 디렉토리 나누기
		String subDir = ""; 
		LocalDate today = LocalDate.now();
		String datePattern = "yyyy" + File.separator + "MM" + File.separator + "dd";
		
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern(datePattern);
		
		// 3) 서브디렉토리에 저장
		subDir = today.format(dtf);
		
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
			return "error/fail";
		}
		
	}
	
	
	@GetMapping("admin_car_reservation")
	public String admin_car_reservation() {
		
		return "admin/admin_car_reservation";
	}
	
	@GetMapping("admin_review")
	public String admin_review() {
		
		return "admin/admin_review";
	}
	
	@GetMapping("adminAnswerList")
	public String adminAnswerList(Model model) {
		System.out.println("qnaList(controller)");
		List<QnaVO> qna = service.adminAnswerList();
		System.out.println(qna);
		model.addAttribute("qna", qna);
		
		return "admin/admin_answerList";
	}
	
	@GetMapping("adminAnswerForm")
	public String adminAnswer() {
		return "admin/admin_answerList_form";
	}
	
	
	@GetMapping("admin_counsel")
	public String admin_counsel() {
		
		return "admin/admin_counsel";
	}
	
	@GetMapping("admin_answerList_form")
	public String admin_answerList_form() {
		
		return "admin/admin_answerList_form";
	}
	
	
	
	
	
	
	
	
}
