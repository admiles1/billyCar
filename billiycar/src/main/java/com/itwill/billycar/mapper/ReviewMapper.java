package com.itwill.billycar.mapper;

import java.util.List;
import java.util.Map;

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

	double selectReviewAvg();

	int selectAllReview();

}
