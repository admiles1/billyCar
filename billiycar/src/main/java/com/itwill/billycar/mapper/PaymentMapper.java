package com.itwill.billycar.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwill.billycar.vo.PaymentVO;


@Mapper
public interface PaymentMapper {

	List<Integer> salesMonthSelect();

	int insertPayment(PaymentVO payment);

	

	

}
