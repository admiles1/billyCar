package com.itwill.billycar.Controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {
	
	@GetMapping("login")
	public String login() {
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
	
	@GetMapping("forgot_id")
	public String forgot_id() {
		return "login/forgot_id";
	}
	
	@GetMapping("go_join")
	public String go_join() {
		return "join/join_form";
	}
	
	@GetMapping("show_id")
	public String show_id() {
		return "login/show_id";
	}
	
	@GetMapping("forgot_pw")
	public String forgot_pw() {
		return "login/forgot_pw1";
	}
	
	@GetMapping("forgot_pw2")
	public String forgot_pw2() {
		return "login/forgot_pw2";
	}
	
	@GetMapping("forgot_pw3")
	public String forgot_pw3() {
		return "login/forgot_pw3";
	}
}
