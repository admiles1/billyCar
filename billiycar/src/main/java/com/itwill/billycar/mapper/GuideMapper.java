package com.itwill.billycar.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;



@Mapper
public interface GuideMapper {
	public List<Map<String, Object>> selectCarList(@Param("startRow") int startRow, @Param("listLimit") int listLimit);

}
