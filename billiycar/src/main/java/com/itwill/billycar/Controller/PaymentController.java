package com.itwill.billycar.Controller;

import java.util.List;
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
import com.itwill.billycar.vo.ReservVO;

@Controller
public class PaymentController {
	
	@Autowired
	private ReservService reservService;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private MypageService MyPageService;
	
	@Autowired
	private PaymentService paymentService;
	// reservation_detail에서 예약하기 버튼 눌렀을 때 컨트롤러
	@GetMapping("payment")
	public String payment(CarVO car 
						, Model model
						, HttpSession session
						, ReservVO reserv
            			, @RequestParam(defaultValue = "") Map<String, String> map) {
		//TODO 카넘버로 조회하기 컬럼은 car_dayprice, car_hourprice, car_img / * 
		// WHERE car_number = car.getCar_number 받아간값
		// map.get("schedule").split("\\,") 로 짜른 스트링배열 컨트롤러에서 가공or자바스크립터에서 가공
		System.out.println(session.getAttribute("member_id"));
		System.out.println(car.getCar_number());
		System.out.println(map.get("schedule"));
		
		
		String MemberId = (String)session.getAttribute("member_id");
		model.addAttribute("info", MyPageService.getMemberInfo(MemberId));
		
		CarVO dbcar = paymentService.getCarInfo(car);
		model.addAttribute("car", dbcar);
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
	
	@GetMapping("paymentDetail")
	public String paymentDetail(Model model, MemberVO member, @RequestParam("idx") int idx, ReservVO reserv) {
		String MemberId = (String)session.getAttribute("member_id");
		model.addAttribute("info", MyPageService.getMemberInfo(MemberId));
		reserv = paymentService.getReservationByIdx(idx);
        if (reserv != null && reserv.getReserv_status() == 1) {
            model.addAttribute("reservDetail", reserv);
        } 
        return "payment/paymentDetail"; 
//        else {
//            // 예약 상태가 1이 아니거나 예약 정보가 없는 경우 처리할 내용
//        	model.addAttribute("msg", "뭔가 잘못 댐");
//			model.addAttribute("targetURL", "payment");
//			return "err/fail"; // 오류 페이지로 이동하거나 다른 처리를 수행할 수 있습니다.
//        }
		
	}
}
