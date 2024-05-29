package com.itwill.billycar.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.billycar.mapper.PaymentMapper;
import com.itwill.billycar.vo.CarVO;
import com.itwill.billycar.vo.CouponIssueVO;
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
		return mapper.insertPayment(payment);
	}
	
	public int registReserv(ReservVO reserv) {
		System.out.println("예약 서비스까지 옴");
		return mapper.insertRserv(reserv);
	}



	public CarVO getCarInfo(CarVO car) {
		return mapper.selectCarInfo(car);
	}

//	public ReservVO getReservationByIdx(int idx) {
//		return mapper.selectReservDetail(idx);
//	}

//	public PaymentVO getPaymentByIdx(int idx) {
//		return mapper.selectPaymentDetail(idx);
//	}

	public List<Map<String, Object>> getReservDetails(int idx) {
		return mapper.selectPaymentDetail(idx);
	}

	public int updateCarReserveCount(CarVO car) {
		return mapper.updateCarCountReserve(car);
	}

	public List<Map<String, Object>> getMemberCoupon(String memberId) {
		return mapper.selectMemberCoupon(memberId);
	}

	public void updateCouponStatus(int coupon_id, String memberId) {
		mapper.updateCouponStatus(coupon_id,memberId);
	}

//	public int updateCouponStatus(CouponIssueVO couponIssue) {
//		return mapper.updateCouponStatus(couponIssue);
//	}
	
	

}
