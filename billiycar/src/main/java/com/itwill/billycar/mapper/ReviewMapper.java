package com.itwill.billycar.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.itwill.billycar.vo.CarReviewVO;
import com.itwill.billycar.vo.ReviewVO;

@Mapper
public interface ReviewMapper {

	int insertReview(ReviewVO review);

	List<CarReviewVO> selectReviewList(String option);

	double selectReviewAvg();

	int selectAllReview();

}
