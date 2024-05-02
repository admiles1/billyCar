package com.itwill.billycar.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.itwill.billycar.service.LoginService;
import com.itwill.billycar.vo.MemberVO;

@Controller
public class LoginController {
	
	@Autowired
	private LoginService service;
	
	@GetMapping("login")
	public String login() {
		return "login/login_form";
	}
	
	@GetMapping("loginPro")
	public String loginPro(MemberVO member,  HttpSession session , Model model) {
		System.out.println(member);
		boolean isCorrectUser = service.isCorrectUser(member);
		
		if(isCorrectUser) {
			session.setAttribute("memberid",  member.getMember_id());
			return "redirect:/./";
		} else {
			return "redirect:/error";
		}
	}

	@GetMapping("error")
	public String error(Model model) {
		model.addAttribute("msg", "아이디 또는 비밀번호를 잘못 입력했습니다.\\n입력하신 내용을 다시 확인해주세요.");
		return "err/fail";
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
