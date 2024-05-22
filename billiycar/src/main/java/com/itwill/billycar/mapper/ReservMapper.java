package com.itwill.billycar.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwill.billycar.vo.CarVO;
import com.itwill.billycar.vo.MemberVO;
import com.itwill.billycar.vo.ReservVO;


@Mapper
public interface ReservMapper {
	List<Map<String, String>> selectCarList(@Param("car")CarVO car, @Param("reserv")ReservVO reserv
											, @Param("startRow") int startRow, @Param("listLimit") int listLimit);
	
	Map<String, String> selectCar(@Param("car")CarVO car, @Param("reserv")ReservVO reserv);
	
	CarVO selectCar(String model);
	
	//예약 현황 리스트
	List<ReservVO> selectReservList(@Param(value = "memberId")String memberId, @Param(value = "startRow")int startRow, @Param(value = "listLimit")int listLimit);
	
	
	int updateReviewStatus(int review_idx);
	
	int selecReservCount();

	ReservVO selectReviewCondition(int reserv_idx);

	
}
