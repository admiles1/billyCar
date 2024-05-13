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
	
	public List<Map<String, String>> selectCarList(CarVO car, ReservVO reserv) {
		return mapper.selectCarList(car, reserv);
	}
	
	public CarVO getCar(int idx) {
		return mapper.selectCar(idx);
	}

	
	//예약 현황 리스트
	public List<ReservVO> selectReservList(MemberVO member) {
		System.out.println("service에서 값 보기 : " + mapper.selectReservList(member));
		return mapper.selectReservList(member);
	}

	public int updateReviewStatus(int review_idx) {
		return mapper.updateReviewStatus(review_idx);
	}

	public int selecReservCount() {
		return mapper.selecReservCount();
	}

}
