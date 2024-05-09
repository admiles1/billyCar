package com.itwill.billycar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.itwill.billycar.mapper.AdminCusMapper;
import com.itwill.billycar.mapper.CsMapper;
import com.itwill.billycar.vo.FaqVO;
import com.itwill.billycar.vo.NoticeVO;
import com.itwill.billycar.vo.QnaVO;

@Service
public class AdminCusService {

	@Autowired
	private AdminCusMapper mapper;

	//-----------------------------------------------------------------------------
	// ** [FaQ] **
	// 글쓰기 처리
	public int writeFaq(FaqVO faq) {
		return mapper.insertFaq(faq);
	}

	// 글 목록 불러오기
	public List<FaqVO> getFaqList(int listLimit, int startRow) {
		return mapper.selectFaqList(listLimit, startRow);
	}
	
	// 글 목록 개수
	public int getFaqListCount() {
		return mapper.selectFaqCount();
	}

	// 글 목록 자세히
	public FaqVO selectFaqDetail(int faq_idx) {
		return mapper.selectFaqDetail(faq_idx);
	}

	// 자주묻는질문 수정
	public int modifyFaq(FaqVO faq) {
		return mapper.updateFaq(faq);
	}

	// 자주묻는질문 삭제
	public int deleteFaq(int faq_idx) {
		return mapper.deleteFaq(faq_idx);
	}



}
