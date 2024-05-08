package com.itwill.billycar.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.itwill.billycar.service.Memberservice;
import com.itwill.billycar.vo.MemberVO;

@Controller
public class MemberController {
	@Autowired
	private Memberservice service;
	
	
	// 회원가입 Controller
	
	@GetMapping("join")
	public String join() {
		return "join/join_agree";
	}
	
	@GetMapping("join_form")
	public String join_form() {
		return "join/join_form";
	}
	
	// get매핑 join_form에서 중복확인을 위한 window.open 하기위한 매핑
	@GetMapping("check_id")
	public String check_id() {
		return "join/check_id";
	}
	
	// 실제 유효성검사를 마친후 중복확인을 위해 DB작업을 하기 위한 매핑주소
	@PostMapping("check_id")
	public String check_id_pro(String member_id, Model model, HttpServletResponse response) {
		boolean isEmptyId = service.isEmptyId(member_id);
		if(!isEmptyId) {
			
			model.addAttribute("member_id", member_id);
			model.addAttribute("isValid", true);
			
		} else {
			
			model.addAttribute("member_id", member_id);
			model.addAttribute("isValid", false);
		}
		
		return "redirect:/check_id";
		
	}
	
	@PostMapping("join")
	public String joinPro(MemberVO member, Model model, BCryptPasswordEncoder passwordEncoder) {
		
		String securePasswd = passwordEncoder.encode(member.getMember_passwd());
		member.setMember_passwd(securePasswd);
		
		if(service.registMember(member) > 0) {
			model.addAttribute("member_id", member.getMember_id());
			System.out.println(member.getMember_id());
			return "join/join_complete";
		} else {
			model.addAttribute("msg", "회원가입 실패!");
			return "err/fail";
		}
	}
	
	// ==================================================================================================================
	// 로그인 Controller
	
	@GetMapping("login")
	public String login() {
		return "login/login_form";
	}
	
	@PostMapping("login")
	public String loginPro(MemberVO member,  HttpSession session , Model model, BCryptPasswordEncoder passwordEncoder) {
		
		
		MemberVO dbMember = service.getMember(member);
		
		
		if(dbMember == null || !passwordEncoder.matches(member.getMember_passwd(), dbMember.getMember_passwd())) { // 로그인 실패
			model.addAttribute("msg", "로그인 실패!");
			return "redirect:/error";
		} else { // 로그인 성공
			// 세션 객체에 로그인 성공한 아이디를 "sId" 속성값으로 추가
			session.setAttribute("member_id", member.getMember_id());
			
			// 메인페이지 리다이렉트
			return "redirect:/";
		}
		
		
//		boolean isCorrectUser = service.isCorrectUser(member);
//		
//		if(isCorrectUser) {
//			session.setAttribute("member_id",  member.getMember_id());
//			return "redirect:/./";
//		} else {
//			return "redirect:/error";
//		}
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
	
	@PostMapping ("passwdChange")
	public String passwdChange() {
		return "redirect:/./";
	}
	
}
