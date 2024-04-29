package com.itwill.billycar.Controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {
	
	@GetMapping("login")
	public String login(HttpSession session) {
		Map<String, String> temp = new HashMap<String, String>();
		temp.put("id", "admin");
		session.setAttribute("id", temp);
		return "login/login_form";
	}
	
	@GetMapping("loginPro")
	public String loginPro(HttpSession session) {
		Map<String, String> temp = new HashMap<String, String>();
		temp.put("id", "admin");
		session.setAttribute("id", temp);
		return "index";
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "index";
	}
	
}
