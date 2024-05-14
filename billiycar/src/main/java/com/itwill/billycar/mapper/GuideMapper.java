package com.itwill.billycar.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;



@Mapper
public interface GuideMapper {
	public List<Map<String, Object>> selectCarList();

}
