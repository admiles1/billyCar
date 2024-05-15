package com.itwill.billycar.service;

import java.util.List;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.billycar.mapper.GuideMapper;
import com.itwill.billycar.vo.CarVO;

@Service
public class GuideService {
	
	@Autowired
	private GuideMapper mapper;

	public List<Map<String, Object>> carList() {
        return mapper.selectCarList();
	}

}
