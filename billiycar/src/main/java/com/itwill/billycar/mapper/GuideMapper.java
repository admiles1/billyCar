package com.itwill.billycar.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwill.billycar.vo.CouponVO;



@Mapper
public interface GuideMapper {
	public List<Map<String, Object>> selectCarList(@Param("startRow") int startRow
												, @Param("listLimit") int listLimit
												, @Param("searchType") String searchType
												, @Param("searchKeyword") String searchKeyword);

}
