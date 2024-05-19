package com.itwill.billycar.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.billycar.mapper.ReviewMapper;
import com.itwill.billycar.vo.CarReviewVO;
import com.itwill.billycar.vo.HeartVO;
import com.itwill.billycar.vo.ReviewVO;

@Service
public class ReviewService {
	
	@Autowired
	private ReviewMapper mapper;
	
	public int reviewWrite(ReviewVO review) {
		return mapper.insertReview(review);
	}

	public List<CarReviewVO> selectReviewList(String option,int startRow,int listLimit) {
		System.out.println("mapper.selectReviewList(service) : " + mapper.selectReviewList(option,startRow,listLimit));
		return mapper.selectReviewList(option,startRow,listLimit);
	}
	
	public List<ReviewVO> getReview(String carNumber){
		return mapper.selectReview(carNumber);
	}

	public double selectReviewAvg() {
		System.out.println("mapper.selectReviewAvg() : " + mapper.selectReviewAvg());
		return mapper.selectReviewAvg();
	}

	public int selectAllReview() {
		return mapper.selectAllReview();
	}

	public int updateReviewHeart(int review_idx, int count) {
		return mapper.updateReviewHeart(review_idx,count);
	}

	public HeartVO selectHeart(int review_idx, String member_id) {
		return mapper.selectHeart(review_idx,member_id);
	}

	public int insertHeart(int review_idx, String member_id) {
		return mapper.insertHeart(review_idx,member_id);
	}

	public int deleteHeart(int review_idx, String member_id) {
		return mapper.deleteHeart(review_idx,member_id);
	}

	public HeartVO heartStatus(int review_idx, String member_id) {
		return mapper.selectheartStatus(review_idx,member_id);
	}

	

	

	


}
