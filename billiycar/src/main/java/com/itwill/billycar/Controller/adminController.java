package com.itwill.billycar.Controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.itwill.billycar.service.AdminService;
import com.itwill.billycar.vo.AdminVO;
import com.itwill.billycar.vo.MemberVO;

@Controller
public class adminController {
	@Autowired
	private AdminService service;
	
	
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
			return "error/fail";
		}
		
		session.setAttribute("id", returnAdmin.getAdmin_id());
		return "index";
	}
	
	@GetMapping("admin")
	public String admin() {
		System.out.println("admin");
		
		return "admin/admin_main";
	}
	
	@GetMapping("admin_member")
	public String admin_member(Model model) {
		
		List<MemberVO> member = service.adminMemberList();
		model.addAttribute("member", member);
		System.out.println(member);
		
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
