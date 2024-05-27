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

import com.itwill.billycar.service.Memberservice;
import com.itwill.billycar.service.MypageService;
import com.itwill.billycar.service.ReservService;
import com.itwill.billycar.vo.CouponIssueVO;
import com.itwill.billycar.vo.CouponVO;
import com.itwill.billycar.vo.LicenseVO;
import com.itwill.billycar.vo.License_StandardVO;
import com.itwill.billycar.vo.MemberVO;
import com.itwill.billycar.vo.PageInfo;
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
	
	@Autowired
	private Memberservice memberService;
	
//	TODO
	@GetMapping("mypage")
	public String memberInfo(Model model) {
		String MemberId = (String)session.getAttribute("member_id");
		System.out.println(MemberId + " 1231231");
		if(MemberId == null) {
			model.addAttribute("msg", "로그인이 필요합니다.");
			model.addAttribute("targetURL", "login");
			return "err/fail";
		}
		
		Object memberInfo = service.getMemberInfo(MemberId);
	    if (memberInfo == null) {
	        model.addAttribute("msg", "유효하지 않은 회원 정보입니다.");
	        return "err/fail";
	    }
		
		model.addAttribute("info", service.getMemberInfo(MemberId));
		return "mypage/page/Mypage_Member_Info";
	}
	
	@GetMapping("modifyInfo") //회원정보수정 클릭시
	public String modifyInfo(Model model) {
		String MemberId = (String)session.getAttribute("member_id");
		if(MemberId == null) {
			model.addAttribute("msg", "허용되지 않은 접근입니다!");
			return "err/fail";
		}
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
		boolean isEmptyEmail = memberService.isEmptyEmail(member.getMember_email());
		boolean isEmptyPhoneNum = memberService.isEmptyPhoneNum(member.getMember_phone());
		
		if(!isEmptyEmail) {
			model.addAttribute("msg", "이미 가입된 이메일 입니다.");
			return "err/fail";
		}
		
		if(!isEmptyPhoneNum) {
			model.addAttribute("msg", "이미 가입된 전화번호입니다.");
			return "err/fail";
		}
		
		int updateCount = service.modifyInfo(member);
		
		if(updateCount <= 0) {
			model.addAttribute("msg", "회원정보 업데이트 실패");
			return "err/fail";
		} else {
			model.addAttribute("msg", "회원정보가 수정되었습니다!");
			model.addAttribute("targetURL", "mypage");
			return "success/success";
		}
	}
	
	@GetMapping("modifyPasswd")
    public String modifyPasswd(Model model) {
        System.out.println("비밀번호 변경");
        String MemberId = (String)session.getAttribute("member_id");
		if(MemberId == null) {
			model.addAttribute("msg", "허용되지 않은 접근입니다!");
			return "err/fail";
		}
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
		if(dbMember == null || !passwordEncoder.matches(member.getMember_passwd(), dbMember.getMember_passwd())) {
			model.addAttribute("msg", "현재 비밀번호가 잘못 입력되었습니다.");
			return "err/fail";
		} else { // 비밀번호 일치시 비밀번호 업데이트
			member.setMember_passwd(newMember_passwd);
			member.setMember_id(dbMember.getMember_id());
			String securePasswd = passwordEncoder.encode(member.getMember_passwd());
			member.setMember_passwd(securePasswd);
			if(service.modifyPasswd(member) <= 0) {
				model.addAttribute("msg", "비밀번호 변경 실패");
				return "err/fail";
			} else {
				model.addAttribute("msg", "비밀번호가 정상적으로 변경되었습니다!");
				model.addAttribute("targetURL", "mypage");
				return "success/success";
			}
//			return "redirect:/mypage";
		}
		
	}
	
	@GetMapping("license")
    public String license(Model model) {
        System.out.println("면허등록 및 갱신");
        String MemberId = (String)session.getAttribute("member_id");
		if(MemberId == null) {
			model.addAttribute("msg", "허용되지 않은 접근입니다!");
			return "err/fail";
		}
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
		} else {
			model.addAttribute("msg", "면허등록이 정상적으로 이루어졌습니다!");
			model.addAttribute("targetURL", "licenseInfo");
			return "success/success";
		}
//		return "redirect:/licenseInfo";
	}
	
	@GetMapping("licenseInfo")
	public String licenseInfo(Model model, LicenseVO license) {
		String memberId = (String)session.getAttribute("member_id");
		if(memberId == null) {
			model.addAttribute("msg", "허용되지 않은 접근입니다!");
			return "err/fail";
		}
		model.addAttribute("licenseInfo", service.getLicenseInfo(memberId));
		return "mypage/page/Mypage_License_Info";
	}
	
	
	//예약 현황 리스트 
	@GetMapping("resvConfirm")
    public String resvConfirm(@RequestParam(defaultValue = "1") int pageNum, 
    						  MemberVO member, Model model, ReservVO reserv) {
		String memberId = (String)session.getAttribute("member_id");
		if(memberId == null) {
			model.addAttribute("msg", "허용되지 않은 접근입니다!");
			return "err/fail";
		}
        // 페이징 
 		int listLimit = 10;
 		int startRow = (pageNum-1)*listLimit;
 		// 1) 전체 예약 목록 갯수 조회
		String client = (String)session.getAttribute("member_id");
		int listCount = service.getReservListCount(client);
		int pageListLimit = 3;
		//----------------------------------------------------------------
		int maxPage = listCount/listLimit + (listCount%listLimit > 0 ? 1 : 0);
		System.out.println(maxPage);
		//----------------------------------------------------------------
		//시작페이지 설정
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		//끝페이지 설정
		int endPage = startPage + pageListLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		model.addAttribute("pageInfo", new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage));
		model.addAttribute("pageNum", pageNum);
        List<ReservVO> reservList = reservService.selectReservList(startRow, listLimit, memberId);
        System.out.println("회원의 예약 리스트 보이기 : " + reservList);
        model.addAttribute("reservList", reservList);
        
        return "mypage/page/Mypage_Reservation";
    }
	
	@GetMapping("MyInquiry")
    public String MyInquiry(@RequestParam(defaultValue = "1") int pageNum, 
    						Model model, QnaVO qna) {
		String MemberId = (String)session.getAttribute("member_id");
		if(MemberId == null) {
			model.addAttribute("msg", "허용되지 않은 접근입니다!");
			return "err/fail";
		}
		// 페이징 
		int listLimit = 10;
		int startRow = (pageNum-1)*listLimit;
		// 1) 전체 게시물 수 조회
		String writer = (String)session.getAttribute("member_id");
//				System.out.println("누구"+writer);
		int listCount = service.getQnaListCount(writer);
//				System.out.println(listCount);
		int pageListLimit = 3;
		
		//----------------------------------------------------------------
		int maxPage = listCount/listLimit + (listCount%listLimit > 0 ? 1 : 0);
		System.out.println(maxPage);
		//----------------------------------------------------------------
		//시작페이지 설정
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		//끝페이지 설정
		int endPage = startPage + pageListLimit - 1;
				
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		model.addAttribute("pageInfo", new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage));
		List<QnaVO> qnaList = service.getMemberQna(startRow, listLimit, MemberId);
		model.addAttribute("qna", qnaList);
        return "mypage/page/Mypage_Inquiry";
    }
	
//	@GetMapping("MyCoupon")
//    public String MyCoupon(Model model) {
//        System.out.println("나의 쿠폰함");
//        String member_id = (String)session.getAttribute("member_id");
//        List<Map<String, Object>> couponList = service.getMemberCoupon(member_id);
//        System.out.println(couponList);
//        model.addAttribute("Coupon", couponList);
//        return "mypage/page/Mypage_Coupon";
//    }
	
	@GetMapping("MyCoupon")
	public String MyCoupon(@RequestParam(defaultValue = "1") int pageNum, 
	                       HttpSession session,
	                       Model model) {
	    System.out.println("나의 쿠폰함");
	    String memberId = (String) session.getAttribute("member_id");
	    if(memberId == null) {
	    	model.addAttribute("msg", "허용되지 않은 접근입니다!");
	    	return "err/fail";
	    }

	    int listLimit = 10; // 한 페이지당 표시할 목록 개수
	    int startRow = (pageNum - 1) * listLimit; // 시작 행 번호
	    int listCount = service.getCouponListCount(memberId); // 총 목록 개수

	    int pageListLimit = 3; // 한 번에 표시할 페이지 목록 개수
	    int maxPage = (int) Math.ceil((double) listCount / listLimit); // 최대 페이지 번호
	    int startPage = ((pageNum - 1) / pageListLimit) * pageListLimit + 1; // 시작 페이지 번호
	    int endPage = startPage + pageListLimit - 1; // 끝 페이지 번호
	    if (endPage > maxPage) {
	        endPage = maxPage;
	    }

	    model.addAttribute("pageInfo", new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage));
	    List<Map<String, Object>> couponList = service.getMemberCoupon(startRow, listLimit, memberId);
	    model.addAttribute("Coupon", couponList);
	    model.addAttribute("pageNum", pageNum); // 현재 페이지 번호를 모델에 추가

	    System.out.println(pageNum);
	    return "mypage/page/Mypage_Coupon";
	}
	
	@PostMapping("couponUpdate")
	public String MyCouponUpdate(Model model, String coupon_code) {
		String member_id= (String)session.getAttribute("member_id");
//		System.out.println(couponIssue);
		
		// 중복된 쿠폰인지 확인
		int duplicateCoupon = service.couponCheck(member_id, coupon_code);
		
		if(duplicateCoupon > 0) {
			model.addAttribute("msg", "이미 등록된 쿠폰입니다");
			return "err/fail";
		}
		
		int existCoupon = service.couponExist(coupon_code);
		
		if(existCoupon <= 0) {
			model.addAttribute("msg", "쿠폰 코드를 확인해 주세요");
			return "err/fail";
		} else {
			// 쿠폰 등록
			int insertCnt = service.couponUpdate(member_id, coupon_code);
			
			System.out.println(insertCnt);
			if(insertCnt <= 0) {
				model.addAttribute("msg", "쿠폰 등록 실패하셨습니다. \\n 다시 시도해 주세요");
				return "err/fail";
			} else {
				model.addAttribute("msg", "쿠폰 등록되었습니다");
				model.addAttribute("targetURL", "MyCoupon");
				return "err/fail";
			}
		}
		
		
			
		
	}
	
	
//	@GetMapping("resignReason")
//    public String resignReason() {
//        System.out.println("회원탈퇴 사유 등록");
//        return "mypage/page/Mypage_Delete_Account_Reason";
//    }
	
	@GetMapping("MemberWithdraw")
	public String withdrawForm(Model model) {
		// 세션 아이디가 없을 경우 "error/fail" 페이지 포워딩 처리
		// => msg 속성값 : "잘못된 접근입니다!", targetURL 속성값 : "./"(메인페이지)
		String memberId = (String)session.getAttribute("member_id");
		
		if(memberId == null) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "err/fail";
		}
		
		return "mypage/page/Mypage_Delete_Account";
	}
	
	@PostMapping("MemberWithdraw")
	public String withdrawPro(MemberVO member, BCryptPasswordEncoder passwordEncoder, Model model) {
		String memberId = (String)session.getAttribute("member_id");
		
		
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
