package com.itwill.billycar.vo;

import lombok.Data;

@Data
public class PageInfo {
	private int listCount; // 총 게시물 수
	private int pageListLimit; // 페이지 당 표시할 페이지 번호 개수 
	private int maxPage; 
	private int startPage;
	private int endPage;
}
