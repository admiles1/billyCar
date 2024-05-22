package com.itwill.billycar.Controller;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwill.billycar.service.Memberservice;
import com.itwill.billycar.service.MypageService;
import com.itwill.billycar.service.PaymentService;
import com.itwill.billycar.service.ReservService;
import com.itwill.billycar.vo.CarVO;
import com.itwill.billycar.vo.CouponIssueVO;
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
	
	@Autowired
	private Memberservice memberservicer;
	
	// reservation_detail에서 예약하기 버튼 눌렀을 때 컨트롤러
	@GetMapping("payment")
	public String payment(CarVO car 
						, Model model
						, HttpSession session
						, ReservVO reserv
						, CouponIssueVO coupon
						, MemberVO member
						, @RequestParam(defaultValue = "1")int totalAmount
            			, @RequestParam(defaultValue = "") Map<String, String> map) {
		// 카넘버로 조회하기 컬럼은 car_dayprice, car_hourprice, car_img / * 
		// WHERE car_number = car.getCar_number 받아간값
		// map.get("schedule").split("\\,") 로 짜른 스트링배열 컨트롤러에서 가공or자바스크립터에서 가공
		System.out.println(session.getAttribute("member_id"));
		System.out.println(car.getCar_number());
		System.out.println(map.get("schedule"));
//		coupon.getCoupon_id()
		System.out.println(reserv);
		System.out.println("00000000000000000000000000000000000000000");
		
		String MemberId = (String)session.getAttribute("member_id");
		member.setMember_id(MemberId);
		
		if(MemberId == null) {
			model.addAttribute("msg", "로그인을 진행하여 주세요");
			model.addAttribute("targetURL", "login");
			return "err/fail";
		}
		
		member = memberservicer.getMember(member);
		if(member.getMember_license_checked() != 1) {
			model.addAttribute("msg", "면허 인증을 진행하여 주십시오");
			model.addAttribute("targetURL", "license");
			return "err/fail";
		}
		
		model.addAttribute("info", MyPageService.getMemberInfo(MemberId));
		
		CarVO dbcar = paymentService.getCarInfo(car);
		model.addAttribute("car", dbcar);
		model.addAttribute("totalAmount", totalAmount);
		
		return "payment/paymentPage";
	}
	
	@ResponseBody
	@PostMapping("payment")
	public String paymentPro(CarVO car 
							, PaymentVO payment
							, @RequestParam(defaultValue = "") Map<String, String> map
							, Model model) {
		System.out.println("====================================");
		System.out.println(car);
		System.out.println(payment);
		System.out.println(map);
		String memberId = (String)session.getAttribute("member_id");
		String carNumber = car.getCar_number();
		
		// 주소값을 강제로 바꿔서 진입하였고 그게 부산이 아닐 시 
		if(!Pattern.matches("^부산", map.get("schedule").split(",")[2])) {
			model.addAttribute("msg", "유효한 값이 아닙니다");
			return "err/fail";
		}

		
		ReservVO reserv = new ReservVO();
		
		String pickupdate = map.get("schedule").split(",")[0];
		String returndate = map.get("schedule").split(",")[1];
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH");
		reserv.setReserv_pickupdate(LocalDateTime.parse(pickupdate, formatter));
		reserv.setReserv_returndate(LocalDateTime.parse(returndate, formatter));
		reserv.setReserv_pickuplocation(map.get("schedule").split(",")[2]);
		reserv.setReserv_returnlocation(map.get("schedule").split(",")[3]);
		reserv.setMember_id(memberId);
		reserv.setCar_number(carNumber);
		payment.setMember_id(memberId);
		payment.setCar_number(carNumber);
		
		// 예약내역 insert후 insert된 차량내역의 idx값 리턴 받아서 payment객체에 세팅
		paymentService.registReserv(reserv);
		
		payment.setReserv_idx(reserv.getReserv_idx());
		
		int count = paymentService.registerPayment(payment);
		
		if(count > 0) {
			int carReserveCount = paymentService.updateCarReserveCount(car);
			
			if(carReserveCount > 0) {
				return "true";
			}
			
			return "false";
		}
		
		
		 
		return "false";
	}
	
	@GetMapping("paymentDetail")
	public String paymentDetail(Model model, MemberVO member, @RequestParam(defaultValue = "1") int idx, ReservVO reserv, PaymentVO payment) {
		
		System.out.println(idx + "!@#!@#!@#!@##!");
		
		String memberId = (String)session.getAttribute("member_id");
		model.addAttribute("info", MyPageService.getMemberInfo(memberId));
		List<Map<String, Object>> reservDetails = paymentService.getReservDetails(idx);
		
		 // Date formatting
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	    for (Map<String, Object> reservDetail : reservDetails) {
	        // Check if the object is instanceof java.util.Date
	        Object pickupdateObj = reservDetail.get("reserv_pickupdate");
	        if (pickupdateObj instanceof Date) {
	            reservDetail.put("reserv_pickupdate", dateFormat.format((Date) pickupdateObj));
	        }

	        Object returndateObj = reservDetail.get("reserv_returndate");
	        if (returndateObj instanceof Date) {
	            reservDetail.put("reserv_returndate", dateFormat.format((Date) returndateObj));
	        }
	    }
		
		model.addAttribute("reservDetails", reservDetails);
		
		//		reserv = paymentService.getReservationByIdx(idx);
//        if (reserv != null && reserv.getReserv_status() == 0) {
//            model.addAttribute("reservDetail", reserv);
//        } 
//        
//        payment = paymentService.getPaymentByIdx(idx);
//        if(payment != null && payment.getPayment_status() == 1) {
//        	model.addAttribute("paymentDetail", payment);
//        }
		
        return "payment/paymentDetail"; 
		
	}
}
