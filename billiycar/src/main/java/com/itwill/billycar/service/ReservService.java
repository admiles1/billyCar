package com.itwill.billycar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.billycar.mapper.ReservMapper;
import com.itwill.billycar.vo.CarVO;

@Service
public class ReservService {
	@Autowired ReservMapper mapper;
	
	public List<CarVO> selectCarList() {
		return mapper.selectCarList();
	}
}
