package com.itwill.billycar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.billycar.mapper.CsMapper;
import com.itwill.billycar.vo.NoticeVO;

@Service
public class CsService {

	@Autowired
	private CsMapper mapper;

	public int writeNotice(NoticeVO notice) {
		return mapper.insertNotice(notice);
	}
}
