package com.itwill.billycar.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.billycar.mapper.PaymentMapper;
import com.itwill.billycar.vo.CarVO;
import com.itwill.billycar.vo.PaymentVO;
import com.itwill.billycar.vo.ReservVO;


@Service
public class PaymentService {
	
	@Autowired
	private PaymentMapper mapper;
	
	public List<Integer> salesMonthSelect() {
		System.out.println("총 매출 받아온 값(service) : " + mapper.salesMonthSelect());
		return mapper.salesMonthSelect();
	}

	public int registerPayment(PaymentVO payment) {
		System.out.println("registPayment 서비스 까진옴");
		return mapper.insertPayment(payment);
	}
	
	public int registReserv(ReservVO reserv) {
		return mapper.insertRserv(reserv);
	}



	public CarVO getCarInfo(CarVO car) {
		return mapper.selectCarInfo(car);
	}

	public ReservVO getReservationByIdx(int idx) {
		return mapper.selectReservDetail(idx);
	}
	
	

}
