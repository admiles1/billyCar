package com.itwill.billycar.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwill.billycar.service.AdminCusService;
import com.itwill.billycar.service.EventService;
import com.itwill.billycar.vo.AdminVO;
import com.itwill.billycar.vo.CouponVO;
import com.itwill.billycar.vo.FaqVO;
import com.itwill.billycar.vo.PageInfo;
import com.itwill.billycar.vo.QnaVO;

@Controller
public class AdminCusController {
	
	@Autowired
	private AdminCusService service;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private EventService eventService;
	
	// 자주묻는질문 목록
	@GetMapping("admin_counsel")
	public String admin_counsel(FaqVO faq, Model model, @RequestParam(defaultValue ="1") int pageNum, AdminVO admin) {
		
		// 관리자 아닐 경우 돌려보내기
		admin.setAdmin_id((String)session.getAttribute("member_id"));
		
		if(session.getAttribute("member_id")== null || !session.getAttribute("member_id").equals(admin.getAdmin_id())) {
			model.addAttribute("msg","접근 권한이 없습니다");
			return "err/fail";
		} 
		
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
	public String counselWrite(Model model, AdminVO admin) {
		
		// 관리자 아닐 경우 돌려보내기
		admin.setAdmin_id((String)session.getAttribute("member_id"));
		
		if(session.getAttribute("member_id")==null || !session.getAttribute("member_id").equals(admin.getAdmin_id())) {
			model.addAttribute("msg","접근 권한이 없습니다");
			return "err/fail";
		} 
		
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
	public String faqDetail(int faq_idx, Model model, AdminVO admin) {
		
		// 관리자 아닐 경우 돌려보내기
		admin.setAdmin_id((String)session.getAttribute("member_id"));
		
		if(session.getAttribute("member_id")==null || !session.getAttribute("member_id").equals(admin.getAdmin_id())) {
			model.addAttribute("msg","접근 권한이 없습니다");
			return "err/fail";
		} 
		
		FaqVO faq = service.selectFaqDetail(faq_idx);
		model.addAttribute("faq", faq);
		
		return "admin/admin_counsel_detail";
	}
	
	// 자주묻는질문 수정 폼
	@GetMapping("faqModify")
	public String faqModifyform(FaqVO faq, int faq_idx, Model model, AdminVO admin) {
		
		// 관리자 아닐 경우 돌려보내기
		admin.setAdmin_id((String)session.getAttribute("member_id"));
		
		if(session.getAttribute("member_id")==null || !session.getAttribute("member_id").equals(admin.getAdmin_id())) {
			model.addAttribute("msg","접근 권한이 없습니다");
			return "err/fail";
		} 
		
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
	public String faqDelete(FaqVO faq, int faq_idx, Model model, AdminVO admin) {
		
		// 관리자 아닐 경우 돌려보내기
		admin.setAdmin_id((String)session.getAttribute("member_id"));
		
		if(session.getAttribute("member_id")==null || !session.getAttribute("member_id").equals(admin.getAdmin_id())) {
			model.addAttribute("msg","접근 권한이 없습니다");
			return "err/fail";
		} 
		
		int deleteCnt = service.deleteFaq(faq_idx);
		
		if(deleteCnt == 0) {
			model.addAttribute("msg", "삭제 실패하셨습니다");
			return "err/fail";
		}
		
		return "redirect:/admin_counsel";
	}
	
	// -------------------------------------------------------------------------------------------------
	// ** [문의내역] **
	@GetMapping("adminAnswerList")
	public String adminAnswerList(Model model, AdminVO admin, QnaVO qna, @RequestParam(defaultValue ="1") int pageNum, @RequestParam(defaultValue ="") String answer) {
		
		// 관리자 아닐 경우 돌려보내기
		admin.setAdmin_id((String)session.getAttribute("member_id"));
		
		if(session.getAttribute("member_id")==null || !session.getAttribute("member_id").equals(admin.getAdmin_id())) {
			model.addAttribute("msg","접근 권한이 없습니다");
			return "err/fail";
		} 
		
		// 답변 상태 파라미터 int로 바꿔주기
		int answer_status = 0;
		
		switch (answer) {
			case "all":
			case "": answer_status = 2; break;
			case "ok": answer_status = 1; break;
			case "no": answer_status = 0; break;
		}
		
		int listLimit = 5;
		int startRow = (pageNum-1)*listLimit;
		int pageListLimit = 3;
		int listCount = service.getQnaListCount(answer_status);
		
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
		
		
		List<QnaVO> qnaList = service.getQnaList(startRow, listLimit, answer_status);
		model.addAttribute("qnaList", qnaList);
		
		return "admin/admin_answerList_form";
	}
	
	// 문의내역 답변폼
	@GetMapping("adminAnswer")
	public String adminAnswerForm(QnaVO qna, Model model, AdminVO admin, int qna_idx) {
		
		// 관리자 아닐 경우 돌려보내기
		admin.setAdmin_id((String)session.getAttribute("member_id"));
		
		if(session.getAttribute("member_id")==null || !session.getAttribute("member_id").equals(admin.getAdmin_id())) {
			model.addAttribute("msg","접근 권한이 없습니다");
			return "err/fail";
		} 
		
		// 문의내역 불러오기
		qna.setQna_idx(qna_idx);
		qna = service.getQna(qna);
		
		model.addAttribute("qna",qna);
		
		return "admin/admin_QnaAnswer_form";
	}
	
	@PostMapping("adminAnswer")
	public String adminAnswerPro(QnaVO qna, Model model, int qna_idx) {
		
		// 답변 작성한 거 저장하기
		qna.setQna_idx(qna_idx);
		int answerCnt = service.wrtieAnswer(qna);
		
		if(answerCnt <= 0) {
			model.addAttribute("msg", "답변 달기 실패하셨습니다. \\n 다시 시도해 주세요");
			return "err/fail";
		}
				
		
		return "redirect:/adminAnswerList";
	}
	
	// -------------------------------------------------------------------------------------------------
	// ** [쿠폰] **
	@GetMapping("couponList")
	public String couponList(CouponVO coupon, Model model, AdminVO admin) {
		
		// 관리자 아닐 경우 돌려보내기
		admin.setAdmin_id((String)session.getAttribute("member_id"));
		
		if(session.getAttribute("member_id")==null || !session.getAttribute("member_id").equals(admin.getAdmin_id())) {
			model.addAttribute("msg","접근 권한이 없습니다");
			return "err/fail";
		} 
		
		List<CouponVO> couponList = service.getCouponList();
		model.addAttribute("couponList", couponList);
		return "admin/couponList";
	}
	
	@GetMapping("couponAdd")
	public String couponAdd() {
		return "admin/couponAdd";
	}
	
	@ResponseBody
	@PostMapping("couponAdd")
	public String couponAddPro(CouponVO coupon, Model model) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		// 중복 쿠폰 코드 막기
		CouponVO dbCoupon = service.selectCouponCode(coupon);
		
		if(dbCoupon != null) {
			resultMap.put("alreadyHasCoupon", true);
			return new JSONObject(resultMap).toString();
		}
		
		int insertCoupon = service.addCoupon(coupon);
		
		if(insertCoupon <= 0) {
			resultMap.put("fail", true);
			return new JSONObject(resultMap).toString();
		}
		
		resultMap.put("success", true);
		return new JSONObject(resultMap).toString();
	}
	
	@GetMapping("couponDelete")
	public String couponDelete(String coupon_code, Model model, AdminVO admin) {
		
		System.out.println(coupon_code);
		
		// 관리자 아닐 경우 돌려보내기
		admin.setAdmin_id((String)session.getAttribute("member_id"));
		
		if(session.getAttribute("member_id")==null || !session.getAttribute("member_id").equals(admin.getAdmin_id())) {
			model.addAttribute("msg","접근 권한이 없습니다");
			return "err/fail";
		} 
		
		int deleteCount = service.removeCoupon(coupon_code);
		
		if(deleteCount <= 0) {
			model.addAttribute("msg", "쿠폰 삭제 실패하셨습니다. \\n 다시 시도해 주세요");
			return "err/fail";
		}
		
		
		return "redirect:/couponList";
	}
	
	// ----------------------------------------------------------------------------------------------
	// [ 면허인증 관리 ]

	@GetMapping("admin_license")
	public String admin_blackList(Model model, AdminVO admin, @RequestParam(defaultValue ="1") int pageNum, String license) {
		
		// 관리자 아닐 경우 돌려보내기
		admin.setAdmin_id((String)session.getAttribute("member_id"));
		
		if(session.getAttribute("member_id")==null || !session.getAttribute("member_id").equals(admin.getAdmin_id())) {
			model.addAttribute("msg","접근 권한이 없습니다");
			return "err/fail";
		} 
		
		// 페이징
		int listLimit = 10;
		int startRow = (pageNum-1)*listLimit;
		
//		System.out.println(license);
		
		int license_auth = 0;
		
		switch (license) {
		case "license_unauth": license_auth = 2; break;
		case "license_auth": license_auth = 1; break;
		default: license_auth = 0; break;
		}
		// 목록 불러오기
		List<Map<String, Object>> memberList = service.getLicenseList(listLimit, startRow, license_auth);
		model.addAttribute("memberList", memberList);
		model.addAttribute("license_auth", license);
		
		// 1) 전체 게시물 수 조회
		int listCount = service.getMemberCount(license_auth);
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
		
		return "admin/admin_license";
	}
	
}
