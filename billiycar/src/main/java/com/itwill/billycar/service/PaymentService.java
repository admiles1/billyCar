package com.itwill.billycar.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.billycar.mapper.PaymentMapper;


@Service
public class PaymentService {
	
	@Autowired
	private PaymentMapper mapper;
	
	public List<Integer> salesMonthSelect() {
		System.out.println("총 매출 받아온 값(service) : " + mapper.salesMonthSelect());
		return mapper.salesMonthSelect();
	}
	
	

}
