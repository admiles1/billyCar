package com.itwill.billycar.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.itwill.billycar.service.CsService;
import com.itwill.billycar.vo.NoticeVO;

@Controller
public class CsController {
	
	@Autowired
	private CsService service;
	
	@GetMapping("cs")
	public String cs() {
		return "event/eventPage";
	}
	
	// 공지사항 ----------------------------
	@GetMapping("notice")
	public String notice() {
		return "cs/notice";
	}
	
	// 글 작성
	@GetMapping("noticeWrite")
	public String notice_write() {
		return "cs/notice_write";
	}
	
	// 글 작성 처리
	@PostMapping("noticeWrite")
	public String noticePro(NoticeVO notice, Model model) {
		
		int insertCnt = service.writeNotice(notice);
		
		if(insertCnt > 0) {
			
			return "";
		} else {
			model.addAttribute("msg","글쓰기 실패하셨습니다. \\n 다시 시도해 주세요");
			return "err/fail";
		}
		
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
	@PostMapping("noticeModify")
	public String noticeModifyPro() {
		return "";
	}
	
	// 삭제
	@GetMapping("noticeDelete")
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
	@PostMapping("qnaQuestion")
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
