package com.itwill.billycar.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class CsController {
	
	@GetMapping("cs")
	public String event() {
		return "event/eventPage";
	}
	
	// 공지사항 ----------------------------
	@GetMapping("notice")
	public String notice() {
		return "cs/notice";
	}
	
	// 글 작성
	@GetMapping("noticeWriteForm")
	public String notice_write() {
		return "cs/notice_write";
	}
	
	// 글 작성 처리
	@PostMapping("noticeWritePro")
	public String noticePro() {
		return "";
	}
	
	// 제목 누르면 게시물 보기
	@GetMapping("noticeDetail") 
	public String noticeDetail() {
		return "cs/notice_detail";
	}
	
	// 수정
	@GetMapping("noticeModify")
	public String noticeModify() {
		return "cs/notice_modify";
	}
	
	// 수정 처리
	@PostMapping("noticeModifyPro")
	public String noticeModifyPro() {
		return "";
	}
	
	// 삭제
	@GetMapping("noticeDeletePro")
	public String noticeDelete() {
		return "";
	}
	
	// FAQ -------------------------------
	@GetMapping("faq")
	public String faq() {
		return "cs/FAQ";
	}
	
	// QnA -------------------------------
	@GetMapping("qna")
	public String qna() {
		return "cs/Q&A_list";
	}
	
	@GetMapping("qna_q")
	public String qna_q() {
		return "cs/Q&A_Q";
	}
	
	@GetMapping("qna_a")
	public String qna_a() {
		return "cs/Q&A_A";
	}
	
	// 질문 처리
	@PostMapping("qnaQuestionPro")
	public String questionPro() {
		System.out.println("질문하는곳");
		return "";
	}
	
	// 질문 가져오기
	@GetMapping("qnaAnswerDetail")
	public String Answer() {
		System.out.println("qna_a");
		return "cs/Q&A_A";
	}
}
