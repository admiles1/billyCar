package com.itwill.billycar.Controller;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwill.billycar.service.MypageService;
import com.itwill.billycar.service.ReservService;
import com.itwill.billycar.vo.CouponVO;
import com.itwill.billycar.vo.LicenseVO;
import com.itwill.billycar.vo.License_StandardVO;
import com.itwill.billycar.vo.MemberVO;
import com.itwill.billycar.vo.QnaVO;
import com.itwill.billycar.vo.ReservVO;


@Controller
public class MypageController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private MypageService service;
	
	@Autowired
	private ReservService reservService;
	
	
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
		
		int updateCount = service.modifyInfo(member);
		
		if(updateCount <= 0) {
			model.addAttribute("msg", "회원정보 업데이트 실패");
			return "err/fail";
		}
		
		return "redirect:/mypage";
	}

	
	@GetMapping("modifyPasswd")
    public String modifyPasswd() {
        System.out.println("비밀번호 변경");
        return "mypage/page/Mypage_Modify_Password";
    }
	
	@PostMapping("modifyPasswd")
	public String modifyPasswdPro(MemberVO member
			                     , BCryptPasswordEncoder passwordEncoder
			                     , Model model
			                     , HttpSession session
			                     , String newMember_passwd) {
		System.out.println("비밀번호 변경");
		MemberVO dbMember = service.getMemberInfo((String)session.getAttribute("member_id"));
		if(dbMember == null || !passwordEncoder.matches(member.getMember_passwd(), dbMember.getMember_passwd())) { // 로그인 실패
			model.addAttribute("msg", "비밀번호가 잘못 입력되었습니다.");
			return "err/fail";
		} else { // 비밀번호 일치시 비밀번호 업데이트
			member.setMember_passwd(newMember_passwd);
			member.setMember_id(dbMember.getMember_id());
			String securePasswd = passwordEncoder.encode(member.getMember_passwd());
			member.setMember_passwd(securePasswd);
			if(service.modifyPasswd(member) <= 0) {
				model.addAttribute("msg", "비밀번호 변경 실패");
				return "err/fail";
			}
			
			// 마아페이지 리다이렉트
			return "redirect:/mypage";
		}
		
	}
	
	@GetMapping("license")
    public String license() {
        System.out.println("면허등록 및 갱신");
        return "mypage/page/Mypage_License_register";
    }
	
	@PostMapping("license")
	public String licensePro(LicenseVO license, License_StandardVO licenseSt, Model model, MemberVO member) {
		String memberId = (String) session.getAttribute("member_id");
		license.setLicense_id(memberId);
		int isCorrectLiscense = service.getLicense(license);
		MemberVO dbMember = service.getMemberInfo(memberId);
		
		if(isCorrectLiscense < 1) {
			model.addAttribute("msg", "유효하지 않은 면허 정보입니다.\\n면허 정보를 다시 확인해주세요!");
			return "err/fail";
		}
		
		if (service.isLicenseDuplicate(license)) {
	        model.addAttribute("msg", "이미 등록된 면허 정보입니다.\\n면허 정보를 다시 확인해주세요!");
	        return "err/fail";
	    }
		
		
		int insertCount = service.registLicense(license);
		if(insertCount == 0) {
			model.addAttribute("msg", "면허 등록 실패!");
			return "err/fail";
		}
		
		
		int updateCount = service.changeLicenseStatus(dbMember);
		if(updateCount == 0) {
			model.addAttribute("msg", "면허 등록 실패!");
			return "err/fail";
		} 
		return "redirect:/licenseInfo";
	}
	
	@GetMapping("licenseInfo")
	public String licenseInfo(Model model, LicenseVO license) {
		String memberId = (String)session.getAttribute("member_id");
		model.addAttribute("licenseInfo", service.getLicenseInfo(memberId));
		return "mypage/page/Mypage_License_Info";
	}
	
	
	//예약 현황 리스트 
	@GetMapping("resvConfirm")
    public String resvConfirm(HttpSession session, MemberVO member, Model model) {
        System.out.println("예약확인");
        
        member.setMember_id((String)session.getAttribute("member_id"));
        
        List<ReservVO> reservList = reservService.selectReservList(member);
        System.out.println("회원의 예약 리스트 보이기 : " + reservList);
        
        model.addAttribute("reservList", reservList);
        
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
    public String MyCoupon(Model model) {
        System.out.println("나의 쿠폰함");
        String member_id = (String)session.getAttribute("member_id");
        List<Map<String, Object>> couponList = service.getMemberCoupon(member_id);
        System.out.println(couponList);
        model.addAttribute("Coupon", couponList);
        return "mypage/page/Mypage_Coupon";
    }
	
	@GetMapping("resignReason")
    public String resignReason() {
        System.out.println("회원탈퇴 사유 등록");
        return "mypage/page/Mypage_Delete_Account_Reason";
    }
	
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
