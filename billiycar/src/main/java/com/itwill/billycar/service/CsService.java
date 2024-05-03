package com.itwill.billycar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.billycar.mapper.CsMapper;
import com.itwill.billycar.vo.NoticeVO;

@Service
public class CsService {

	@Autowired
	private CsMapper mapper;

	// 공지사항 글쓰기
	public int writeNotice(NoticeVO notice) {
		return mapper.insertNotice(notice);
	}
	
	// 공지사항 글 목록 불러오기
	public List<NoticeVO> getNoticeList(int startRow, int listLimit) {
		return mapper.selectNoticeList(startRow, listLimit);
	}

	// 공지사항 내용 보기
	public NoticeVO getNoticeDetail(int notice_idx) {
		return mapper.selectNoticeDetail(notice_idx);
	}

	// 공지사항 수정
	public int modifyNotice(NoticeVO notice) {
		return mapper.updateNotice(notice);
	}
	
	// 공지사항 수정 위해 불러오기
	public NoticeVO modifyInfo(int notice_idx) {
		return mapper.selectModifyInfo(notice_idx);
	}
}
