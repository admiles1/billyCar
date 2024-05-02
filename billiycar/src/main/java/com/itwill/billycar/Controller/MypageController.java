package com.itwill.billycar.Controller;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MypageController {
	
	@GetMapping("mypage")
	public String mypage(HttpSession session) {
		session.getAttribute("memberid");
		return "mypage/page/Mypage_Insert_Password";
	}
	
	@GetMapping("modifyInfo")
	public String modifyInfo() {
		System.out.println("회원정보 수정");
		return "mypage/page/Mypage_Modify_Info";
	}
	
	@GetMapping("modifyPasswd")
    public String modifyPasswd() {
        System.out.println("비밀번호 변경");
        return "mypage/page/Mypage_Modify_Password";
    }
	
	@GetMapping("license")
    public String license() {
        System.out.println("면허등록 및 갱신");
        return "mypage/page/Mypage_License_register";
    }
	
	@GetMapping("resvConfirm")
    public String resvConfirm() {
        System.out.println("예약확인");
        return "mypage/page/Mypage_Reservation";
    }
	
	@GetMapping("MyInquiry")
    public String MyInquiry() {
        System.out.println("문의 내역");
        return "mypage/page/Mypage_Inquiry";
    }
	
	@GetMapping("MyCoupon")
    public String MyCoupon() {
        System.out.println("나의 쿠폰함");
        return "mypage/page/Mypage_Coupon";
    }
	
	@GetMapping("resignReason")
    public String resignReason() {
        System.out.println("회원탈퇴 사유 등록");
        return "mypage/page/Mypage_Delete_Account_Reason";
    }
	
	@GetMapping("resignPasswd")
    public String resignPasswd() {
        System.out.println("회원탈퇴 처리과정");
        return "mypage/page/Mypage_Delete_Account";
    }
	
}
