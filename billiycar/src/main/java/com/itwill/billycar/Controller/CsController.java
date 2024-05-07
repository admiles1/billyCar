package com.itwill.billycar.Controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String notice(Model model, @RequestParam(defaultValue = "1") int pageNum) {
		// 페이징 
		int listLimit = 5;
		int startRow = (pageNum-1)*listLimit;
		
		
		// 조회수
		
		// 글 목록
		List<NoticeVO> noticeList = service.getNoticeList(startRow, listLimit);
		model.addAttribute("noticeList", noticeList);
		
		return "cs/notice";
	}
	
	// 글 작성
	@GetMapping("noticeWrite")
	public String notice_write(HttpSession session, Model model) {
		
		// 작성자가 admin이 아닐 경우 튕구기
		String id = (String)session.getAttribute("member_id");
		
		if(id==null || !id.equals("admin")) {
			model.addAttribute("msg","잘못된 접근입니다");
			model.addAttribute("targetURL","notice");
			return "err/fail";
		}
		
		return "cs/notice_write";
	}
	
	// 글 작성 처리
	@PostMapping("noticeWrite")
	public String noticePro(NoticeVO notice, Model model, HttpSession session) {
		// 작성자id에 admin 추가
		String admin = (String)session.getAttribute("member_id");
		notice.setBoard_writer(admin);
		
		// DB에 추가
		int insertCnt = service.writeNotice(notice);
		
		// 판별
		if(insertCnt > 0) {
			return "redirect:/notice";
		} else {
			model.addAttribute("msg","글쓰기 실패하셨습니다. \\n 다시 시도해 주세요");
			return "err/fail";
		}
	}
	
	// 제목 누르면 게시물 보기
	@GetMapping("noticeDetail") 
	public String noticeDetail(int notice_idx, Model model) {
		
		// 디테일 가져오기
		NoticeVO notice = service.getNoticeDetail(notice_idx);
		
		// 보내기
		model.addAttribute("notice", notice);
		
		return "cs/notice_detail";
	}
	
	// 수정
	@GetMapping("noticeModify")
	public String noticeModify(Model model, NoticeVO notice, int notice_idx) {
		System.out.println(notice_idx);
		notice = service.modifyInfo(notice_idx);
		model.addAttribute("notice", notice);
		
		return "cs/notice_modify";
	}
	
	// 수정 처리
	@PostMapping("noticeModify")
	public String noticeModifyPro(Model model, NoticeVO notice) {
		
		int insertCount = service.modifyNotice(notice);
		
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
