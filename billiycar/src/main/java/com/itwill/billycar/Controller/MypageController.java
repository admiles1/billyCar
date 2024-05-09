package com.itwill.billycar.Controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwill.billycar.service.MypageService;
import com.itwill.billycar.vo.LicenseVO;
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
		return "mypage/page/Mypage_Member_Info";
	}
	
	@GetMapping("modifyInfo") //회원정보수정 클릭시
	public String modifyInfo(Model model) {
		String MemberId = (String)session.getAttribute("member_id");
		model.addAttribute("info", service.getMemberInfo(MemberId));
		return "mypage/page/Mypage_Insert_Password";
	}
	
	@PostMapping("modifyInfo")
	public String modifyMemberInfo(MemberVO member, String member_passwd , Model model, BCryptPasswordEncoder passwordEncoder) {
		
		String MemberId = (String)session.getAttribute("member_id");
		MemberVO dbMember = service.getMemberInfo(MemberId);
		
		if(dbMember == null || !passwordEncoder.matches(member_passwd, dbMember.getMember_passwd())) { // 비밀번호 확인 실패
			model.addAttribute("msg", "비밀번호를 확인해주세요.");
			return "err/fail";
		} else { // 비밀번호 확인 성공
			
			model.addAttribute("info", service.getMemberInfo(MemberId));
			return "mypage/page/Mypage_Modify_Info";
		}

	}
	
	
	@PostMapping("mypage")
	public String modifyMemberInfoPro(Model model, MemberVO member) {
	
		member.setMember_id((String)session.getAttribute("member_id"));
		member.setMember_email(member.getMember_email());
		member.setMember_phone(member.getMember_phone());
		
		int updateCount = service.modifyInfo(member);
		
		
		if(updateCount <= 0) {
			model.addAttribute("msg", "회원정보 업데이트 실패");
			return "err/fail";
		}
		
		return "redirect:/mypage";
	}




	
	
	
	
//	@GetMapping("checkPasswd")
//	public String checkPasswd() {
//		return "mypage/page/Mypage_Insert_Password";
//	}
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
	
	@PostMapping("license")
	public String licensePro(LicenseVO license, Model model) {
		String memberId = (String) session.getAttribute("member_id");
		license.setLicense_id(memberId);
		
		int insertCount = service.registLicense(license);
		if(insertCount == 0) {
			model.addAttribute("msg", "면허 등록 실패!");
			return "error/fail";
		} else {
			boolean match = service.checkLicenseMatch(license);
			if(match) {
				return "redirect:/licenseInfo";
			} else {
				model.addAttribute("msg", "면허 정보를 다시 확인해주세요!");
				return "error/fail";
			}
		}
	}

	
	@GetMapping("licenseInfo")
	public String licenseInfo(Model model) {
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
	
//	@GetMapping("resignPasswd")
//    public String resignPasswd() {
//        System.out.println("회원탈퇴 처리과정");
//        return "mypage/page/Mypage_Delete_Account";
//    }
	
	@GetMapping("MemberWithdraw")
	public String withdrawForm(Model model) {
		// 세션 아이디가 없을 경우 "error/fail" 페이지 포워딩 처리
		// => msg 속성값 : "잘못된 접근입니다!", targetURL 속성값 : "./"(메인페이지)
		String memberId = (String)session.getAttribute("member_id");
		
		if(memberId == null) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			model.addAttribute("targetURL", "./");
			return "err/fail";
		}
		
		return "mypage/page/Mypage_Delete_Account";
	}
	
	@PostMapping("MemberWithdraw")
	public String withdrawPro(MemberVO member, BCryptPasswordEncoder passwordEncoder, Model model) {
		String memberId = (String)session.getAttribute("member_id");
		
		if(memberId == null) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			model.addAttribute("targetURL", "./");
			return "err/fail";
		}
		
//		System.out.println(memberId);
		member.setMember_id(memberId);
		MemberVO dbMember = service.getMemberInfo(memberId);
		
		if(dbMember != null && passwordEncoder.matches(member.getMember_passwd(), dbMember.getMember_passwd())) {
			int updateCount = service.withdrawMember(member);
			
			session.invalidate();
			return "redirect:/";
		} else { 
			model.addAttribute("msg", "비밀번호를 다시 확인해주세요!");
			return "err/fail";
		}
	}
	
}
