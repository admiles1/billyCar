package com.itwill.billycar;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwill.billycar.service.AdminService;
import com.itwill.billycar.service.CsService;
import com.itwill.billycar.service.Memberservice;
import com.itwill.billycar.service.PaymentService;
import com.itwill.billycar.service.ReservService;
import com.itwill.billycar.vo.FaqVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private CsService csService;

	@Autowired
	private ReservService reservService;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private Memberservice memberService;
	
	@Autowired
	private PaymentService paymentService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {

		
		//faq
		List<FaqVO> faqList = csService.getFaqList(4, 0, null);
		System.out.println("컨트롤러(FAQ) : " + faqList);

		model.addAttribute("faqList", faqList);

		//--------------------------------------------------------

		//예약 가능 차량 보이기
		int carCount = adminService.selectAllcar(0);
		System.out.println("예약 가능 차량 : " + carCount);

		model.addAttribute("carCount", carCount);

		//누적 회원 수 보이기
		int memberCount = memberService.selectMemberCount();
		System.out.println("지금까지 누적 회원 수 : " + memberCount);
		model.addAttribute("memberCount", memberCount);
		
		//누적 예약
		int reservCount = reservService.selecReservCount();
		System.out.println("지금까지 누적 예약 수 : " + reservCount);
		model.addAttribute("reservCount", reservCount);
		
		// 자동차 타입, 연료, 영업시간
		model.addAttribute("types", adminService.getTypes());
		model.addAttribute("fuels", adminService.getFuels());
		model.addAttribute("BHS", adminService.getBusinesshours().get(0).getName());
		model.addAttribute("BHE", adminService.getBusinesshours().get(1).getName());
		
		
		return "index";
	}

}