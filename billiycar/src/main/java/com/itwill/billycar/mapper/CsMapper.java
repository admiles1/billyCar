package com.itwill.billycar.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwill.billycar.vo.FaqVO;
import com.itwill.billycar.vo.NoticeVO;
import com.itwill.billycar.vo.QnaVO;

@Mapper
public interface CsMapper {

	// **  [공지사항] **
	int insertNotice(NoticeVO notice); // 공지사항 글쓰기
	List<NoticeVO> selectNoticeList(@Param(value = "startRow") int startRow,@Param(value = "listLimit") int listLimit); // 공지사항 목록 불러오기
	int selectListCount(); // 글 개수 조회
	NoticeVO selectNoticeDetail(int notice_idx); // 공지사항 내용 보기
	NoticeVO selectModifyInfo(int notice_idx); // 공지사항 수정하기 위해 내용 불러오기
	int updateNotice(NoticeVO notice); // 공지사항 수정
	String selectAdminPasswd(); // 관리자 확인
	int deleteNotice(int notice_idx); // 공지사항 삭제
	
	// ---------------------------------------------------------
	// **  [자주묻는질문] **
	List<FaqVO> selectFaqList(@Param(value = "startRow")int startRow, @Param(value = "listLimit") int listLimit,@Param(value = "category") String category); // 자주묻는질문 목록 가져오기
	int selectFaqCount(); // 자주묻는질문 개수
	int selectFaqCategoryCount(String category); // 자주묻는질문 카테고리별 전체 개수 구하기
	
	// ---------------------------------------------------------
	// **  [QnA] **
	List<QnaVO> selectQnaList(@Param(value = "startRow")int startRow, @Param(value = "listLimit") int listLimit, @Param(value = "id") String id); // 문의 내역 가져오기
	int selectQnaListCount(); // 큐엔에이 목록 수
	int insertQna(QnaVO qna); // 큐엔에이 작성하기
	QnaVO selectQnaDetail(QnaVO qna); // 작성한 큐엔에이 가져오기

}
