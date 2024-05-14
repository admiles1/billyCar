package com.itwill.billycar.Controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwill.billycar.service.MypageService;
import com.itwill.billycar.service.ReservService;
import com.itwill.billycar.vo.CarVO;
import com.itwill.billycar.vo.MemberVO;

@Controller
public class PaymentController {
	
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private MypageService MyPageService;
	
	// reservation_detail에서 예약하기 버튼 눌렀을 때 컨트롤러
	@GetMapping("payment")
	public String reservation(CarVO car , Model model, MemberVO member
            				, @RequestParam(defaultValue = "") Map<String, String> map) {
		
		model.addAttribute("car", car);
		
		String MemberId = (String)session.getAttribute("member_id");
		model.addAttribute("info", MyPageService.getMemberInfo(MemberId));
		
		
		
		return "payment/paymentPage";
	}
	
}
