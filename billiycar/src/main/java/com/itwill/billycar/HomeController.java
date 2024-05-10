package com.itwill.billycar;

import java.text.DateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Locale;

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
	private Memberservice memberService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		
		//faq
		List<FaqVO> faqList = csService.getFaqList(4, 0, null);
		System.out.println("컨트롤러(FAQ) : " + faqList);
		
		model.addAttribute("faqList", faqList);
		
		//--------------------------------------------------------
		
		//예약 가능 차량 보이기
		int carCount = reservService.selectReservCountCar();
		System.out.println("예약 가능 차량 : " + carCount);
		
		model.addAttribute("carCount", carCount);
		
		//누적 회원 수 보이기
		int memberCount = memberService.selectMemberCount();
		System.out.println("지금까지 누적 회원 수 : " + memberCount);
		model.addAttribute("memberCount", memberCount);
		
		return "index";
	}
	
}
