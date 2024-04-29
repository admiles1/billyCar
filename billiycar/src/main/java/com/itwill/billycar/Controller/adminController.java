package com.itwill.billycar.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class adminController {

	@GetMapping("admin")
	public String admin() {
		System.out.println("admin");
		
		return "admin/admin_main";
	}
	
	@GetMapping("admin_member")
	public String admin_member() {
		
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
