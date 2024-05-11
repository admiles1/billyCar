package com.itwill.billycar.Controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwill.billycar.service.ReviewService;
import com.itwill.billycar.vo.ReviewVO;

@Controller
public class ReviewController {
	@Autowired ReviewService reviewService;
	
	@PostMapping("reviewWrite")
	public String reviewWritePro(Model model,ReviewVO review,RedirectAttributes redirectAttributes) {
		System.out.println(review);
		System.out.println(review.getReview_idx());
		int insertSuccess = reviewService.reviewWrite(review);
		
		//등록이 완료되었다면 review안에 있는 review_idx값(review.getReview_idx())을 가져와서
		//예약테이블에 reserv_idx와 같은 데이터를 가져와서 reserv_review_status를 1로 변경할것
		
		if(insertSuccess == 0) {
			model.addAttribute("msg", "리뷰등록이 되지 않았습니다.");
			model.addAttribute("targetURL", "admin/admin_member");
			
			return "error/fail";
		}
		redirectAttributes.addFlashAttribute("message", "리뷰 등록이 되었습니다.");
		
		return "redirect:/resvConfirm";
	}
}
