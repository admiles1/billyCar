package com.itwill.billycar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.itwill.billycar.mapper.CsMapper;
import com.itwill.billycar.vo.NoticeVO;
import com.itwill.billycar.vo.QnaVO;

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
	
	// 공지사항 삭제를 위한 관리자 비밀번호 확인
	public String isAdmin() {
		return mapper.selectAdminPasswd();
	}

	// 공지사항 삭제하기
	public int deleteNotice(int notice_idx) {
		return mapper.deleteNotice(notice_idx);
	}
	
	// ------------------------------------------------------------------------------------------------
	// ** [QnA] **
	// 큐엔에이 목록 불러오기
	public List<QnaVO> getQnaList(int startRow, int listLimit, String id) {
		return mapper.selectQnaList(startRow, listLimit, id);
	}

	// 큐엔에이 글작성
	public int writeQna(QnaVO qna) {
		return mapper.insertQna(qna);
	}

}
