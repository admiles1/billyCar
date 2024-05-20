package com.itwill.billycar.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwill.billycar.vo.CarVO;
import com.itwill.billycar.vo.PaymentVO;
import com.itwill.billycar.vo.ReservVO;


@Mapper
public interface PaymentMapper {

	List<Integer> salesMonthSelect();

	int insertPayment(PaymentVO payment);
	int insertRserv(ReservVO reserv);

	CarVO selectCarInfo(CarVO car);
	
	
	ReservVO selectReservDetail(int idx);

	PaymentVO selectPaymentDetail(int idx);

	

	

}
