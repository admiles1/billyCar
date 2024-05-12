package com.itwill.billycar.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwill.billycar.vo.CarVO;
import com.itwill.billycar.vo.MemberVO;
import com.itwill.billycar.vo.ReservVO;


@Mapper
public interface ReservMapper {
	List<CarVO> selectCarList(CarVO car);
	
	CarVO selectCar(int idx);
	
	int selectReservCountCar();
	
	//예약 현황 리스트
	List<ReservVO> selectReservList(MemberVO member);

	int updateReviewStatus(int review_idx);
	
}
