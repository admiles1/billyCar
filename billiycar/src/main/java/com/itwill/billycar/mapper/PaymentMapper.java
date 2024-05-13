package com.itwill.billycar.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface PaymentMapper {

	List<Integer> salesMonthSelect();

	

}
