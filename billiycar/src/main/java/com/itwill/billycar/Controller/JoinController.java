package com.itwill.billycar.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	public String joinPro(MemberVO member) {
		
		
		return "join/join_complete";
	}
	
}
