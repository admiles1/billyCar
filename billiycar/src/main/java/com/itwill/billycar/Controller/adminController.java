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
	
}
