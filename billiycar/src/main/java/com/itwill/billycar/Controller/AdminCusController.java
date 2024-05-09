package com.itwill.billycar.Controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwill.billycar.service.AdminCusService;
import com.itwill.billycar.vo.FaqVO;
import com.itwill.billycar.vo.PageInfo;

@Controller
public class AdminCusController {
	
	@Autowired
	private AdminCusService service;
	
	@Autowired
	private HttpSession session;
	
	@GetMapping("admin_counsel")
	public String admin_counsel(FaqVO faq, Model model, @RequestParam(defaultValue ="1") int pageNum) {
		
		// 페이징
		int listLimit = 10;
		int startRow = (pageNum-1)*listLimit;
		
		// 1) 전체 게시물 수 조회
		int listCount = service.getFaqListCount();
		int pageListLimit = 3;
		
		//----------------------------------------------------------------
		int maxPage = listCount/listLimit + (listCount%listLimit > 0 ? 1 : 0);
		//----------------------------------------------------------------
		//시작페이지 설정
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		//끝페이지 설정
		int endPage = startPage + pageListLimit - 1;
				
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		model.addAttribute("pageInfo", new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage));

		
		System.out.println("여기까지 오나");
		// 목록 불러오기
		List<FaqVO> faqList = service.getFaqList(listLimit, startRow);
		model.addAttribute("faqList", faqList);
		
		return "admin/admin_counsel";
	}
	
	// 자주묻는질문 글쓰기 폼
	@GetMapping("CounselWrite")
	public String counselWrite() {
		return "admin/admin_counsel_write";
	}
	
	// 자주묻는질문 글쓰기 처리
	@PostMapping("CounselWrite")
	public String counselWritePro(FaqVO faq, Model model) {
		int insertCnt = service.writeFaq(faq);
		
		if(insertCnt <= 0 ) {
			model.addAttribute("msg", "글쓰기 실패하셨습니다. \\n 다시 시도해 주세요");
			return "err/fail";
		}
		
		return "redirect:/admin_counsel";
	}
	
	// 자주묻는질문 자세히 보기
	@GetMapping("faqDetail")
	public String faqDetail(int faq_idx, Model model) {
		
		FaqVO faq = service.selectFaqDetail(faq_idx);
		model.addAttribute("faq", faq);
		
		return "admin/admin_counsel_detail";
	}
	
	// 자주묻는질문 수정 폼
	@GetMapping("faqModify")
	public String faqModifyform(FaqVO faq, int faq_idx, Model model) {
		
		faq = service.selectFaqDetail(faq_idx);
		model.addAttribute("faq", faq);
		
		return "admin/admin_counsel_modify";
	}
	
	// 자주묻는질문 수정 처리
	@PostMapping("faqModify")
	public String faqModifyPro(FaqVO faq, int faq_idx, Model model) {
		
		faq.setFaq_idx(faq_idx);
		int modifyCnt = service.modifyFaq(faq);
		
		if(modifyCnt == 0) {
			model.addAttribute("msg", "수정 실패하셨습니다");
			return "err/fail";
		}
		
		return "redirect:/admin_counsel";
	}
	
	// 자주묻는질문 삭제
	@GetMapping("faqDelete")
	public String faqDelete(FaqVO faq, int faq_idx, Model model) {
		
		int deleteCnt = service.deleteFaq(faq_idx);
		
		if(deleteCnt == 0) {
			model.addAttribute("msg", "삭제 실패하셨습니다");
			return "err/fail";
		}
		
		return "redirect:/admin_counsel";
	}
	
	
}