package com.itwill.billycar.mapper;

import java.util.List;

import com.itwill.billycar.vo.CarVO;

public interface ReservMapper {
	List<CarVO> selectCarList(CarVO car);
	CarVO selectCar(int idx);
}
