package com.itwill.billycar.Controller;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwill.billycar.service.ReservService;
import com.itwill.billycar.service.ReviewService;
import com.itwill.billycar.vo.HeartVO;
import com.itwill.billycar.vo.ReviewVO;

import retrofit2.http.GET;

@Controller
public class ReviewController {
	@Autowired ReviewService reviewService;
	@Autowired ReservService resercService;
	
	@PostMapping("reviewWrite")
	public String reviewWritePro(Model model,ReviewVO review,RedirectAttributes redirectAttributes) {
		System.out.println(review);
		System.out.println(review.getReview_idx());
		int insertSuccess = reviewService.reviewWrite(review);
		
		//등록이 완료되었다면 review안에 있는 review_idx값(review.getReview_idx())을 가져와서
		//예약테이블에 reserv_idx와 같은 데이터를 가져와서 reserv_review_status를 1로 변경할것
		
		if(insertSuccess > 0) {
			System.out.println("review_idx 확인 : " + review.getReview_idx());
			int updateSuccess = resercService.updateReviewStatus(review.getReview_idx());
			System.out.println("updateSuccess(확인) : " + updateSuccess);
			redirectAttributes.addFlashAttribute("message", "리뷰 등록이 되었습니다.");
		}else {
			model.addAttribute("msg", "리뷰등록이 되지 않았습니다.");
			model.addAttribute("targetURL", "admin/admin_member");
			
			return "error/fail";
		}
		
		
		return "redirect:/resvConfirm";
	}
	
	@ResponseBody
	@GetMapping("reviewHeart")
	public Map<String, String> reviewHeart(boolean isHeart, int review_idx, String member_id) {
		
		// 현재 좋아요 상태를 확인
	    HeartVO heart = reviewService.selectHeart(review_idx, member_id);
	    System.out.println("heart테이블에 있는지 확인 : " + heart);
	    
	    
	    // 좋아요가 없으면 true
	    System.out.println("isHeart : " +isHeart);
	    
	    Map<String, String> map = new HashMap<String, String>();
	    if (isHeart) {
	        // 좋아요 추가
	        if (heart == null) {
	            int insertHeart = reviewService.insertHeart(review_idx, member_id);
	            System.out.println("insertHeart: " + insertHeart);
	        }
	        // review 테이블에 review_heart 카운터 증가
	        int updateHeartSuccess = reviewService.updateReviewHeart(review_idx, 1);
	        System.out.println("review_heart 증가: " + updateHeartSuccess);
	        
	        map.put("status", "증가");
	    } else {
	        //좋아요 제거
	        if (heart != null) {
	            // heart 테이블에 delete
	            int deleteHeart = reviewService.deleteHeart(review_idx, member_id);
	            System.out.println("deleteHeart: " + deleteHeart);
	        }
	        // review 테이블에 review_heart 카운터 감소
	        int updateHeartSuccess = reviewService.updateReviewHeart(review_idx, -1);
	        System.out.println("review_heart 감소: " + updateHeartSuccess);
	        
	        map.put("status", "감소");
	    }
		
		
		return map;
		
	}
	
	@ResponseBody
	@GetMapping("heartStatus")
	public boolean heartStatus(int review_idx, String member_id) {
		
		System.out.println("review_idx" + review_idx);
		System.out.println("member_id" + member_id);
		HeartVO heart = reviewService.heartStatus(review_idx,member_id);
		System.out.println("결과값 : " + heart);
		if(heart == null) {
			return false;
		}
		return true;
		
	}
}
