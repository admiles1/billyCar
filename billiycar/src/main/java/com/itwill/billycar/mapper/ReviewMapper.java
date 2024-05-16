package com.itwill.billycar.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwill.billycar.vo.CarReviewVO;
import com.itwill.billycar.vo.ReviewVO;

@Mapper
public interface ReviewMapper {

	int insertReview(ReviewVO review);

	List<CarReviewVO> selectReviewList(@Param("option") String option
										,@Param("startRow") int startRow
										,@Param("listLimit") int listLimit);
								
	List<ReviewVO> selectReview(String carNumber);
	
	double selectReviewAvg();

	int selectAllReview();
	

}
