package com.itwill.billycar.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.itwill.billycar.service.ReservService;

@Controller
public class PaymentController {
	@Autowired  
	ReservService service;
	
	@Autowired
	private HttpSession session;
	// reservation_detail에서 예약하기 버튼 눌렀을 때 컨트롤러
	@GetMapping("payment")
	public String reservation(Model model) {
		
		
		return "payment/paymentPage";
	}
	
}
