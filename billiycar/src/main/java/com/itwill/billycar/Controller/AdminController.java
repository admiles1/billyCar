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
	
	@GetMapping("adminMemberSearch")
	public String adminMemberSearch(@RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String searchKeyword,
			@RequestParam(defaultValue = "1") int pageNum,
			Model model) {
		
		System.out.println("controller(searchType) : " + searchType);
		System.out.println("controller(searchkeyword) : " + searchKeyword);
		System.out.println("pageNum : " + pageNum);
		
		int listLimit = 3;
		int startRow = (pageNum - 1) * listLimit;
		
		
		
		List<MemberVO> member = service.adminMemberList(searchType,searchKeyword,startRow,listLimit);
		System.out.println(member);
		
		int listCount = service.getMemberListCount(searchType,searchKeyword,startRow,listLimit);
		System.out.println("listCount(controller) : " + listCount);
		//페이지 번호 갯수를 3개로 지정
		int pageListLimit = 3;
		
		//----------------------------------------------------------------
		int maxPage = listCount/listLimit + (listCount%listLimit > 0 ? 1 : 0);
		System.out.println(maxPage);
		//----------------------------------------------------------------
		//시작페이지 설정
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		System.out.println("시작 페이지 번호 : " + startPage);
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

	
	
	@GetMapping("admin_blackList")
	public String admin_blackList() {
		
		return "admin/admin_blackList";
	}
	
	@GetMapping("admin_car")
	public String admin_car() {
		
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

		int insertCount = service.carUpload(car);
		
		if(insertCount > 0) {
			
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
	
	@GetMapping("admin_answerList")
	public String admin_answerList() {
		
		return "admin/admin_answerList";
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
