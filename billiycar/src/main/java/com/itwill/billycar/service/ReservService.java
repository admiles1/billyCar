package com.itwill.billycar.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.billycar.mapper.ReservMapper;
import com.itwill.billycar.vo.CarVO;
import com.itwill.billycar.vo.MemberVO;
import com.itwill.billycar.vo.ReservVO;

@Service
public class ReservService {
	@Autowired ReservMapper mapper;
	
	public List<Map<String, String>> getCarList(CarVO car, ReservVO reserv, int startRow, int listLimit) {
		return mapper.selectCarList(car, reserv, startRow , listLimit);
	}
	
	public Map<String, String> getCar(CarVO car, ReservVO reserv){
		return mapper.selectCar(car, reserv);
	}

	public CarVO getCar(String model) {
		return mapper.selectCar(model);
	}

	
	//예약 현황 리스트
	public List<ReservVO> selectReservList(int startRow, int listLimit, String memberId) {
		return mapper.selectReservList(memberId, startRow, listLimit);
	}

	public int updateReviewStatus(int review_idx) {
		return mapper.updateReviewStatus(review_idx);
	}

	public int selecReservCount() {
		return mapper.selecReservCount();
	}

}
