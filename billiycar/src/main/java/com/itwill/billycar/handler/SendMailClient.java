package com.itwill.billycar.handler;

import java.util.Date;
import java.util.Properties;

import jakarta.mail.Address;
import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.Message.RecipientType;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

public class SendMailClient {
	// 메일 발송에 사용할 문자열 관리할 변수 선언
	private static final String HOST = "smtp.naver.com";
	private static final String PORT = "587";
	private static final String SENDER_MAIL = "amugae111@naver.com";


	// 메일 발송을 수행할 sendMail() 메서드 정의
	// => 파라미터 : 이메일주소, 제목, 본문   리턴타입 : void
	public void sendMail(String email, String subject, String content) {
		try {
			// 1. 시스템(서버)의 속성 정보(= 서버 정보)를 java.util.Properties 객체 타입으로 리턴받기
			Properties props = System.getProperties(); // 구조가 Map 객체와 유사
			
			// 2. Properties 객체의 put() 메서드 호출하여 메일 발송에 필요한 기본 정보 설정(저장)
			//    => 모든 키와 값은 문자열로 전달(이 때, 키와 값 모두 약속된 값 사용)
			// 메일 발송에 사용할 메일 서버 지정(Gmail, 네이버, 네이트 등)
			props.put("mail.smtp.host", "smtp.naver.com"); // 네이버의 SMTP 서버 주소
			props.put("mail.smtp.port", "587"); // 네이버 메일 서버 SMTP 서버 포트 번호(TLS 프로토콜 번호 587 사용)
			props.put("mail.smtp.auth", "true"); // SMTP 서버 접근 시 인증 필요 여부 설정(로그인 필요 여부)
			// 메일 서버 인증 관련 추가 정보 설정(설정 내용에 따라 위의 정보 중 포트번호 바뀜)
			props.put("mail.smtp.starttls.enable", "true"); // TLS 인증 프로토콜(보안 관련 프로토콜) 사용 여부 설정
			props.put("mail.smtp.ssl.trust", "smtp.naver.com"); // SSL 인증에 사용할 신뢰할 수 있는 서버 주소 지정
			
			// 3. 메일 서버 인증 정보 관리하는 사용자 정의 클래스의 인스턴스 생성
			//    => MailAuthenticator -> Authenticator 타입 업캐스팅
			Authenticator authenticator = new MailAuthenticator();
			
			// 4. 자바 메일 전송 수행 작업을 javax.mail.Session 객체 단위로 관리하므로
			//    Session 클래스의 getDefaultInstance() 메서드 호출하여 Session 타입 객체 리턴받기
			//    => 주의! 웹에서 사용하는 기본 세션 객체(HttpSession)와 다름
			//    => 파라미터 : Properties 객체(SMTP 서버 정보), Authenticator 객체(인증 정보)
			Session mailSession = Session.getDefaultInstance(props, authenticator);
			
			// 5. 서버 정보와 인증 정보를 포함하여 전송할 메일 정보를 하나의 묶음으로 관리할
			//    javax.mail.internet.MimeMessage 객체 생성(파라미터 : Session 객체)
			//    => MimeMessage -> Message 타입으로 업캐스팅
			Message message = new MimeMessage(mailSession);
			// -----------------------------------------------------------------------------------
			// 6. 전송할 메일에 대한 상세 정보 설정
			// 1) 발신자 정보 설정
			//    => InternetAddress -> Address 타입 업캐스팅
			//    => 파라미터 : 발신자 주소, 발신자 이름
			//    => UnsupportedEncodingException 예외 처리 필요

			Address senderAddress = new InternetAddress("SENDER_MAIL", "빌리카");
			
			// 2) 수신자 정보 설정
			//    => 파라미터 : 수신자 주소
			//    => AddressException 예외 처리 필요(수신자 주소 불일치 등)
			Address receiverAddress = new InternetAddress(email);
			
			// 3) 5번에서 생성한 Message 객체를 사용하여 전송할 메일에 대한 내용 설정
			//    => MessagingException 예외 처리 필요
			// 3-1) 메일 헤더 정보 설정(생략 가능)
//		message.setHeader("content-type", "text/html; charset=UTF-8");
			
			// 3-2) 발신자 정보 설정
//		message.setFrom(senderAddress);
			message.setFrom(new InternetAddress(SENDER_MAIL, "빌리카"));
			
			
			// 3-3) 수신자 정보 설정
			//      => 수신타입 : javax.mail.RecipientType 클래스의 상수 활용
			//         RecipientType.TO : 수신자에게 직접 전송(메일을 직접 수신할 수신자 = 업무 담당자)
			//         RecipientType.CC : 참조(Carbon Copy 약자). 직접 수신자는 아니나 업무 참조용으로 수신(= 업무 관계자)
			//         RecipientType.BCC : 숨은 참조(Blind CC). 다른 사람들이 누가 참조하는지 알 수 없게 참조 수신자 숨김

			message.setRecipient(RecipientType.TO, receiverAddress);
			
			// 3-4) 메일 제목 설정
			message.setSubject(subject);
			
			// 3-5) 메일 본문 설정(파라미터 : 메일 본문, 컨텐츠 타입)
			message.setContent(content, "text/html; charset=UTF-8" );

			// 3-6) 메일 발송 날짜 및 시간 설정
			message.setSentDate(new Date()); // 현재 날짜 및 시각 정보로 설정
			
			
			// 7. 메일 전송
			//    javax.mail.Transport 클래스의 static 메서드 send() 호출
			//    => 파라미터 : 6번 과정에서 설정한 Message 객체
			Transport.send(message);
			System.out.println("인증 메일 발송 성공!");
		} catch (Exception e) {
			System.out.println("인증 메일 발송 실패!");
			e.printStackTrace();
		}


		
		
		
		
	}

	
}







