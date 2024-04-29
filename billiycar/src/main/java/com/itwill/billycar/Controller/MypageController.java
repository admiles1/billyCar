package com.itwill.billycar.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MypageController {
	
	@GetMapping("mypage")
	public String mypage() {
		return "mypage/page/Mypage_Insert_Password";
	}
	
}
