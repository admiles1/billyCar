package com.itwill.billycar.Controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwill.billycar.service.MypageService;
import com.itwill.billycar.service.PaymentService;
import com.itwill.billycar.service.ReservService;
import com.itwill.billycar.vo.CarVO;
import com.itwill.billycar.vo.MemberVO;
import com.itwill.billycar.vo.PaymentVO;

@Controller
public class PaymentController {
	
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private MypageService MyPageService;
	
	@Autowired
	private PaymentService paymentService;
	// reservation_detail에서 예약하기 버튼 눌렀을 때 컨트롤러
	@GetMapping("payment")
	public String payment(CarVO car , Model model, MemberVO member
            				, @RequestParam(defaultValue = "") Map<String, String> map) {
		
		model.addAttribute("car", car);
		
		String MemberId = (String)session.getAttribute("member_id");
		model.addAttribute("info", MyPageService.getMemberInfo(MemberId));
//		map.put(MemberId, MemberId)
		
		
		return "payment/paymentPage";
	}
	
	@PostMapping("payment")
	public String paymentPro(CarVO car , Model model, MemberVO member, PaymentVO payment
							, @RequestParam(defaultValue = "") Map<String, String> map) {
		int paymentCount = paymentService.regisetPayment(payment);
		
		if(paymentCount > 0) {
			
			return "reidrect:./";
		} else {
			model.addAttribute("msg", "뭔가 잘못 댐");
			model.addAttribute("targetURL", "payment");
			return "err/fail";
		}
		
	}
	
//	@GetMapping("paymentComplete")
//	public String paymentComplet(Model model, Map<String, String> map) {
//		
//		System.out.println(model);
//		
//		
//		return "payment/paymentComplete";
//	}
	
}
