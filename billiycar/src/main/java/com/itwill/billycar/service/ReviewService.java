package com.itwill.billycar.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.billycar.mapper.ReviewMapper;
import com.itwill.billycar.vo.CarReviewVO;
import com.itwill.billycar.vo.ReviewVO;

@Service
public class ReviewService {
	
	@Autowired
	private ReviewMapper mapper;
	
	public int reviewWrite(ReviewVO review) {
		return mapper.insertReview(review);
	}

	public List<CarReviewVO> selectReviewList(String option) {
		System.out.println("mapper.selectReviewList(service) : " + mapper.selectReviewList(option));
		return mapper.selectReviewList(option);
	}

	public double selectReviewAvg() {
		return mapper.selectReviewAvg();
	}

	public int selectAllReview() {
		return mapper.selectAllReview();
	}

}
