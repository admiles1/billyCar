package com.itwill.billycar.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itwill.billycar.service.Joinservice;
import com.itwill.billycar.vo.MemberVO;

@Controller
public class JoinController {
	@Autowired
	private Joinservice service;
	
	
	@GetMapping("join")
	public String join() {
		return "join/join_agree";
	}
	
	@GetMapping("join_form")
	public String join_form() {
		return "join/join_form";
	}
	
	@PostMapping("joinPro")
	public String joinPro(MemberVO member, Model model) {
		if(service.registMember(member) > 0) {
			model.addAttribute("member_id", member.getMember_id());
			System.out.println(member.getMember_id());
			return "join/join_complete";
		} else {
			model.addAttribute("msg", "회원가입 실패!");
			return "err/fail";
		}
		
	}
}
