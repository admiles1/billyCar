package com.itwill.billycar.Controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwill.billycar.service.MailService;
import com.itwill.billycar.service.Memberservice;
import com.itwill.billycar.service.MypageService;
import com.itwill.billycar.vo.MailAuthInfoVO;
import com.itwill.billycar.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	private Memberservice service;
	@Autowired
	private MailService mailService;
	
	// 회원가입 Controller
	
	@GetMapping("join")
	public String join() {
		return "join/join_agree";
	}
	
	@GetMapping("join_form")
	public String join_form() {
		return "join/join_form";
	}
	
	// join_form에서 중복확인용 window.open을 하기위한 매핑
	@GetMapping("check_id")
	public String check_id() {
		return "join/check_id";
	}
	
	// 실제 유효성검사를 마친후 중복확인 DB작업을 하기 위한 매핑주소
	@PostMapping("check_id")
	public String check_id_pro(String member_id, Model model, HttpServletResponse response) {
		boolean isEmptyId = service.isEmptyId(member_id);
		model.addAttribute("member_id", member_id);
		model.addAttribute("isValid", !isEmptyId);
		
		return "redirect:/check_id";
		
	}
	
	// join_form에서 추천인 확인용 window.open을 하기위한 매핑
		@GetMapping("check_inviter")
		public String check_inviter() {
			return "join/check_inviter";
		}
	
	// 추천인 아이디 검색
	@PostMapping("check_inviter")
	public String check_inviter(String member_inviter, Model model, HttpServletResponse response) {
		boolean isEmptyId = service.isEmptyId(member_inviter);
		model.addAttribute("member_inviter", member_inviter);
		model.addAttribute("isValid", isEmptyId);
		
		return "redirect:/check_inviter";
		
	}
	
	
	@PostMapping("join")
	public String joinPro(MemberVO member, Model model, BCryptPasswordEncoder passwordEncoder) {
		
		// ------------------------------메일-----------------------------
//		System.out.println("ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ" + member.getMember_email());
		// MailService - sendAuthMail() 메서드 호출하여 인증 메일 발송 요청
		// => 파라미터 : MemberVO 객체   리턴타입 : MailAuthInfoVO(mailAuthInfo)
		MailAuthInfoVO mailAuthInfo = mailService.sendAuthMail(member);
		System.out.println("인증정보 : " + mailAuthInfo);
		
		// MemberService - registMailAuthInfo() 메서드 호출하여 인증 정보 등록 요청
		// => 파라미터 : MailAuthInfoVO 객체   리턴타입 : void
		service.registMailAuthInfo(mailAuthInfo);
		
		// ----------------------중복 이메일 전화번호 확인------------------------------
		boolean isEmptyEmail = service.isEmptyEmail(member.getMember_email());
		boolean isEmptyPhoneNum = service.isEmptyPhoneNum(member.getMember_phone());
		
		if(!isEmptyEmail) {
			model.addAttribute("msg", "이미 가입된 이메일 입니다.");
			return "err/fail";
		}
		
		if(!isEmptyPhoneNum) {
			model.addAttribute("msg", "이미 가입된 전화번호입니다.");
			return "err/fail";
		}
		//-------------------------비밀번호 암호화-------------------------------------
		String securePasswd = passwordEncoder.encode(member.getMember_passwd());
		member.setMember_passwd(securePasswd);
		
		if(service.registMember(member) > 0) {
			model.addAttribute("member_id", member.getMember_id());
			System.out.println(member.getMember_id());
			return "join/join_complete";
		} else {
			model.addAttribute("msg", "회원가입 실패!");
			return "err/fail";
		}
	}
	
//	// 이메일 인증
//	@GetMapping("SendAuthMail")
//	public String sendAuthMail(MemberVO member, Model model) {
//		System.out.println(member.getMember_email());
//		// MailService - sendAuthMail() 메서드 호출하여 인증 메일 발송 요청
//		// => 파라미터 : MemberVO 객체   리턴타입 : MailAuthInfoVO(mailAuthInfo)
//		MailAuthInfoVO mailAuthInfo = mailService.sendAuthMail(member);
//		System.out.println("인증정보 : " + mailAuthInfo);
//		
//		// MemberService - registMailAuthInfo() 메서드 호출하여 인증 정보 등록 요청
//		// => 파라미터 : MailAuthInfoVO 객체   리턴타입 : void
//		service.registMailAuthInfo(mailAuthInfo);
//		
//		// send_auth_mail_success.jsp 페이지 포워딩
//		return "";
//	}
//	
//	 [ 이메일 인증 비즈니스 로직 ] 
//	 "MemberEmailAuth" 서블릿 주소 매핑(인증정보 파라미터 저장)
//	@GetMapping("MemberEmailAuth")
//	public String emailAuth(MailAuthInfoVO authInfo, Model model) {
//		System.out.println("인증정보 : " + authInfo);
//		
//		// MemberService - requestEmailAuth() 메서드 호출하여 이메일 인증 요청
//		// => 파라미터 : MailAuthInfoVO 객체   리턴타입 : boolean(isAuthSuccess)
//		boolean isAuthSuccess = service.requestEmailAuth(authInfo);
//		
//		// 인증 요청 결과 판별
//		// 임시) 성공/실패 모두 error/fail.jsp 페이지로 포워딩
//		// 성공 시 : "인증 성공! 로그인 페이지로 이동합니다!" 메세지와 로그인 페이지 주소 전달
//		// 실패 시 : "인증 실패!" 메세지 전달
//		if(isAuthSuccess) {
//			model.addAttribute("msg", "인증 성공!\\n로그인 페이지로 이동합니다!");
//			model.addAttribute("targetURL", "MemberLogin");
//		} else {
//			model.addAttribute("msg", "인증 실패!");
//		}
//		
//		return "error/fail";
//	}
	
	// ==================================================================================================================
	// 로그인 Controller
	
	@GetMapping("login")
	public String login() {
		return "login/login_form";
	}
	
	@PostMapping("login")
	public String loginPro(MemberVO member,  HttpSession session , Model model, BCryptPasswordEncoder passwordEncoder) {
		
		
		MemberVO dbMember = service.getMember(member);
		
		
		if(dbMember == null || !passwordEncoder.matches(member.getMember_passwd(), dbMember.getMember_passwd())
							|| dbMember.getMember_status() == 2) { // 로그인 실패
			model.addAttribute("msg", "아이디 또는 비밀번호를 잘못 입력했습니다.\\n입력하신 내용을 다시 확인해주세요.");
			return "err/fail";
		}  else { // 로그인 성공
			// 세션 객체에 로그인 성공한 아이디를 "sId" 속성값으로 추가
			session.setAttribute("member_id", member.getMember_id());
			
			// 메인페이지 리다이렉트
			return "redirect:/";
		}
		
	}
	
	@GetMapping("loginNaver")
	public String loginNaver( @RequestParam(value = "email", required = false) String email,
            				  @RequestParam(value = "name", required = false) String name,
            				  @RequestParam(value = "id", required = false) String id,
            				  MemberVO member) {
		
		return "";
    }
	
	

	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/./";
	}
	
	@GetMapping("forgot_id")
	public String forgot_id() {
		return "login/forgot_id";
	}
	
//	@PostMapping("forgot_id")
//	public String forgot_idPro(MemberVO member, Model model) {
//		member = service.forgotId(member);
//		if(member != null) {
//			String id = member.getMember_id().substring(0,4) + "****";
//			model.addAttribute("member_id",  id);
//			return "login/show_id";
//		} else {
//			model.addAttribute("msg", "이름 또는 E-Mail 주소를 잘못 입력했습니다.");
//			return "err/fail";
//		}
//	}
	
	@PostMapping("forgot_id")
	public String forgot_idPro(MemberVO member, Model model) {
		
		member = service.forgotId(member);
		
		if(member != null) {
			mailService.sendForgotId(member);
			model.addAttribute("msg", "이메일 전송이 완료되었습니다.\\n메일을 확인해주세요");
			model.addAttribute("targetURL", "login");
			return "err/fail";
		} else {
			model.addAttribute("msg", "이름 또는 E-Mail 주소를 잘못 입력했습니다.");
			return "err/fail";
		}
	}
	
	@GetMapping("show_id")
	public String show_id() {
		return "login/show_id";
	}
	
	@GetMapping("forgot_pw_step1")
	public String forgot_pw() {
		return "login/forgot_pw1";
	}
	
	@PostMapping("forgot_pw_step1")
	public String forgot_pwPro(MemberVO member, Model model, HttpSession session) {
		
		System.out.println(member);
		
		MemberVO dbMember = service.getMember(member);
		
		if(dbMember != null) {
			model.addAttribute("member_id", dbMember.getMember_id());
			return "redirect:/forgot_pw_step2";
		} else {
			model.addAttribute("msg", "존재하지 않는 회원입니다.");
			return "err/fail";
		}
	}
	
	@GetMapping("forgot_pw_step2")
	public String forgot_pw2(MemberVO member, Model model) {
		model.addAttribute("member_id", member.getMember_id());
		return "login/forgot_pw2";
	}
	
	@PostMapping("forgot_pw_step2")
	public String forgot_pw2Pro(MemberVO member, Model model, String member_id) {
		
		member = service.forgotPw(member);
		
		if(member != null) {
			mailService.sendForgotPw(member);
			model.addAttribute("msg", "이메일 전송이 완료되었습니다.\\n메일을 확인해주세요");
			model.addAttribute("targetURL", "login");
			return "err/fail";
		} else {
			model.addAttribute("msg", "이름 또는 E-Mail 주소를 잘못 입력했습니다.");
			return "err/fail";
		}
	}
	
	@GetMapping("forgot_pw_step3")
	public String forgot_pw3(MemberVO member, Model model) {
		model.addAttribute("member_id", member.getMember_id());
		return "login/forgot_pw3";
	}
	
	@PostMapping("forgot_pw_step3")
	public String forgot_pw3Pro(MemberVO member
								, BCryptPasswordEncoder passwordEncoder
					            , Model model
					            , String member_passwd) {
//		MypageService mypageService = new MypageService();
		
		System.out.println("sadflhawrilfhqeiorashgiuewqkarshdgilqwrheasdfilqwrehfd" + member);
		
		String securePasswd = passwordEncoder.encode(member.getMember_passwd());
		member.setMember_passwd(securePasswd);
		
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" + member);
		int updateCnt = service.modifyPasswd(member);
		
		if(updateCnt <= 0) {
			model.addAttribute("msg", "비밀번호 변경 실패");
			return "err/fail";
		}
		
		return "redirect:/login";
	}
	
	@PostMapping ("passwdChange")
	public String passwdChange() {
		return "redirect:/./";
	}
	
	@GetMapping("go_join")
	public String go_join() {
		return "join/join_form";
	}
}

