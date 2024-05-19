package com.itwill.billycar.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwill.billycar.vo.CarReviewVO;
import com.itwill.billycar.vo.HeartVO;
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

	int updateReviewHeart(@Param("review_idx") int review_idx,@Param("count") int count);

	HeartVO selectHeart(@Param("review_idx") int review_idx,@Param("member_id") String member_id);

	int insertHeart(@Param("review_idx") int review_idx,@Param("member_id") String member_id);

	int deleteHeart(@Param("review_idx") int review_idx,@Param("member_id") String member_id);

	HeartVO selectheartStatus(@Param("review_idx") int review_idx,@Param("member_id") String member_id);

	

}
