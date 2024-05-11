package com.itwill.billycar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.billycar.mapper.ReviewMapper;
import com.itwill.billycar.vo.ReviewVO;

@Service
public class ReviewService {
	
	@Autowired
	private ReviewMapper mapper;
	
	public int reviewWrite(ReviewVO review) {
		return mapper.insertReview(review);
	}

}
