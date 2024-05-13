package com.itwill.billycar.service;

import org.springframework.stereotype.Service;

import com.itwill.billycar.handler.GenerateRandomCode;
import com.itwill.billycar.handler.SendMailClient;
import com.itwill.billycar.vo.MailAuthInfoVO;
import com.itwill.billycar.vo.MemberVO;

@Service
public class MailService {
	
	// 인증 메일 발송 요청
	public MailAuthInfoVO sendAuthMail(MemberVO member) {
		// 인증 메일에 포함시킬 난수 생성
		// => GenerateRandomCode 클래스의 getRandomCㄴode() 메서드 호출
		//    (파라미터 : 난수 길이 전달)
		String auth_code = GenerateRandomCode.getRandomCode(50);
//		System.out.println("생성된 난수 : " + auth_code);
		// -------------------------------------------------------
		// 인증메일에 포함할 제목과 본문 생성
		String subject = "[빌리카] 가입 인증 메일입니다.";
		String content = "<a href='http://localhost:8081/billycar/MemberEmailAuth?member_email=" + member.getMember_email() + "&auth_code=" + auth_code + "'>빌리카 이메일 인증을 위해 링크를 클릭해 주세요.</a>";
		// -------------------------------------------------------
		// SendMailClient - sendMail() 메서드 호출하여 메일 발송 요청
		// => 파라미터 : 이메일주소, 제목, 본문
		SendMailClient mailClient = new SendMailClient();
		// 단, 메일 발송 과정에서 메일 전송 상황에 따라 시간이 지연될 수 있는데
		// 이 과정에서 다음 코드를 실행하지 못하고 발송이 끝날때까지 기다리게된다.
		// 따라서, 메일 발송 작업과 나머지 작업을 별도로 동작시키기 위해
		// 메일 발송 메서드 호출 작업을 자바의 쓰레드(Thread)를 활용하여 수행할 수 있다!
		// 즉, 메일 발송이 완료되지 않더라도 다음 작업을 진행할 수 있게 됨
		// -----------------------
		// 익명 객체를 활용하여 1회용 쓰레드 생성
		// new Thread(new Runnable() { public void run() { 멀티쓰레드코드.... }}).start();
//		mailClient.sendMail(member.getEmail(), subject, content);
		new Thread(new Runnable() {
			@Override
			public void run() {
				mailClient.sendMail(member.getMember_email(), subject, content);
			}
		}).start();


		// -------------------------------------------------------
		// MailAuthInfoVO 객체 생성 후 아이디, 인증코드 저장 및 리턴
		MailAuthInfoVO authInfo = new MailAuthInfoVO(member.getMember_email(), auth_code);
		
		return authInfo;
	}
	
}


























