package com.itwill.billycar.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.itwill.billycar.mapper.CsMapper;
import com.itwill.billycar.vo.FaqVO;
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

	// 공지사항 글 개수 조회
	public int getBoardListCount() {
		return mapper.selectListCount();
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
	// ** [자주묻는질문] **
	public List<FaqVO> getFaqList(int listLimit, int startRow, String category) {
		return mapper.selectFaqList(listLimit, startRow, category);
	}
	
	// 글 목록 개수
	public int getFaqListCount() {
		return mapper.selectFaqCount();
	}
	
	// 특정 카테고리 선택했을 때의 목록 개수
	public int getCategoryListCount(String category) {
		return mapper.selectFaqCategoryCount(category);
	}
	
	// ------------------------------------------------------------------------------------------------
	// ** [QnA] **
	// 큐엔에이 목록 불러오기
	public List<Map<String, Object>> getQnaList(int startRow, int listLimit, String id) {
		return mapper.selectQnaList(startRow, listLimit, id);
	}

	// 큐엔에이 페이지 수 조회
	public int getQnaListCount(String writer) {
		return mapper.selectQnaListCount(writer);
	}
	
	// 큐엔에이 글작성
	public int writeQna(QnaVO qna) {
		return mapper.insertQna(qna);
	}

	// 작성한 큐엔에이 가져오기
	public QnaVO getQnaDetail(QnaVO qna) {
		return mapper.selectQnaDetail(qna);
	}
	
	
	


}
