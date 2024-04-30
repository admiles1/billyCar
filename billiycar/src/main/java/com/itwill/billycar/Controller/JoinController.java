package com.itwill.billycar.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itwill.billycar.service.Joinservice;
import com.itwill.billycar.vo.MemberVO;

@Controller
public class JoinController {
	
	@GetMapping("join")
	public String join() {
		return "join/join_agree";
	}
	
	@GetMapping("join_form")
	public String join_form() {
		return "join/join_form";
	}
	
	@PostMapping("joinPro")
	public ModelAndView joinPro(MemberVO member, Model model) {
		System.out.println("조인프로");
		System.out.println(member);
		ModelAndView mav = null;
		Joinservice service = new Joinservice();
		
		if(service.registMember(member)) {
			model.addAttribute(member);
			mav = new ModelAndView("join/join_complete", "member", model ); // 이동할 경로, 객체이름, 실제 객채
		} else {
			mav = new ModelAndView("err/fail", "msg", "로그인 실패");
		}
		
		return mav;
	}
	
}
