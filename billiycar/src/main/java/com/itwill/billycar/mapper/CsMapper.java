package com.itwill.billycar.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwill.billycar.vo.NoticeVO;

@Mapper
public interface CsMapper {

	int insertNotice(NoticeVO notice); // 공지사항 글쓰기
	List<NoticeVO> selectNoticeList(); // 공지사항 목록 불러오기

}
