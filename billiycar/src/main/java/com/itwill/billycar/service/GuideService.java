package com.itwill.billycar.service;

import java.util.List;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.billycar.mapper.GuideMapper;
import com.itwill.billycar.vo.CarVO;
import com.itwill.billycar.vo.CouponVO;

@Service
public class GuideService {
	
	@Autowired
	private GuideMapper mapper;

	public List<Map<String, Object>> carList(int startRow, int listLimit, String searchType, String searchKeyword) {
        return mapper.selectCarList(startRow,listLimit,searchType,searchKeyword);
	}


}
