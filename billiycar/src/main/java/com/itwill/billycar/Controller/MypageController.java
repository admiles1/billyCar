package com.itwill.billycar.Controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwill.billycar.service.MypageService;
import com.itwill.billycar.vo.MemberVO;
import com.itwill.billycar.vo.QnaVO;

@Controller
public class MypageController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private MypageService service;
	
//	@GetMapping("modifyInfo")
//	public String modifyInfo() {
//		return "mypage/page/Mypage_Modify_Info";
//	}
	
	@GetMapping("mypage")
	public String memberInfo(Model model) {
		String MemberId = (String)session.getAttribute("member_id");
		model.addAttribute("info", service.getMemberInfo(MemberId));
		return "mypage/page/Mypage_Modify_Info";
	}
	
	@GetMapping("modifyInfo")
	public String modifyInfo(Model model) {
		String MemberId = (String)session.getAttribute("member_id");
		model.addAttribute("info", service.getMemberInfo(MemberId));
		return "mypage/page/Mypage_Modify_Info";
	}
	
	@GetMapping("checkPasswd")
	public String checkPasswd() {
		return "mypage/page/Mypage_Insert_Password";
	}
//	@GetMapping("mypage")
//	public String mypage(HttpSession session, MemberVO member) {
//		session.getAttribute("memberid");
//		return "mypage/page/Mypage_Insert_Password";
//	}
//	@GetMapping("mypage")
//	public String mypage(HttpSession session, Model model) {
//	    // 세션에서 회원 아이디 가져오기
//		String memberId = (String) session.getAttribute("member_id");
//	    // 가져온 회원 아이디를 모델에 추가
//	    MemberVO memberPasswd = service.getMemberPasswd(memberId);
//	    if(memberPasswd == null) {
//	    	model.addAttribute("msg", "비밀번호를 다시 확인해주세요");
//	    	return "err/fail";
//	    } else {
//	    	model.addAttribute("memberPasswd", memberPasswd);
//	    	return "mypage/page/Mypage_Insert_Password";
//	    }
//	}
	
	
//	@GetMapping("modifyInfo")
//	public String modifyInfo(HttpSession session, MemberVO member, Model model) {
////		System.out.println("회원정보 수정");
//		MemberVO memberInfo = service.getMemberInfo(member);
//		model.addAttribute("memberInfo", memberInfo);
//		return "mypage/page/Mypage_Modify_Info";
//	}
	
//	@GetMapping("modifyInfo")
//	public String modifyInfo(HttpSession session, Model model) {
//	    // 세션에서 회원 아이디 가져오기
//	    String memberId = (String) session.getAttribute("member_id");
//	    // 해당 회원 아이디로 회원 정보 가져오기
//	    MemberVO memberInfo = service.getMemberInfo(memberId);
//	    // 회원 정보를 모델에 추가
//	    model.addAttribute("memberInfo", memberInfo);
//	    // 이후 원하는 페이지로 이동
//	    return "mypage/page/Mypage_Modify_Info";
//	}
	
	
	
	
	
	
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
    public String MyInquiry(@RequestParam(defaultValue = "1") int pageNum, 
    						Model model) {
		String MemberId = (String)session.getAttribute("member_id");
		List<QnaVO> qnaList = service.getMemberQna(MemberId);
		model.addAttribute("qna", qnaList);
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
