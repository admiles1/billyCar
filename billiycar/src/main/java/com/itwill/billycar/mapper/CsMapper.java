package com.itwill.billycar.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwill.billycar.vo.NoticeVO;
import com.itwill.billycar.vo.QnaVO;

@Mapper
public interface CsMapper {

	// **  [공지사항] **
	int insertNotice(NoticeVO notice); // 공지사항 글쓰기
	List<NoticeVO> selectNoticeList(@Param(value = "startRow") int startRow,@Param(value = "listLimit") int listLimit); // 공지사항 목록 불러오기
	NoticeVO selectNoticeDetail(int notice_idx); // 공지사항 내용 보기
	NoticeVO selectModifyInfo(int notice_idx); // 공지사항 수정하기 위해 내용 불러오기
	int updateNotice(NoticeVO notice); // 공지사항 수정
	String selectAdminPasswd(); // 관리자 확인
	int deleteNotice(int notice_idx); // 공지사항 삭제
	
	// ---------------------------------------------------------
	// **  [QnA] **
	List<QnaVO> selectQnaList(@Param(value = "startRow")int startRow, @Param(value = "listLimit") int listLimit, @Param(value = "id") String id); // 문의 내역 가져오기
	int insertQna(QnaVO qna); // 큐엔에이 작성하기

}
