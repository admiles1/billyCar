package com.itwill.billycar.mapper;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.itwill.billycar.vo.CarVO;
import com.itwill.billycar.vo.CouponIssueVO;
import com.itwill.billycar.vo.PaymentVO;
import com.itwill.billycar.vo.ReservVO;


@Mapper
public interface PaymentMapper {

	List<Integer> salesMonthSelect();

	int insertPayment(PaymentVO payment);
	
	int insertRserv(ReservVO reserv);

	CarVO selectCarInfo(CarVO car);
	
	
	ReservVO selectReservDetail(int idx);

	List<Map<String, Object>> selectPaymentDetail(int idx);

	int updateCarCountReserve(CarVO car);

	List<Map<String, Object>> selectMemberCoupon(String memberId);

//	int updateCouponStatus(CouponIssueVO couponIssue);

	

	

}
