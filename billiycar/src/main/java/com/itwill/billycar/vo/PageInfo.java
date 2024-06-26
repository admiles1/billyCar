package com.itwill.billycar.vo;

import lombok.Data;

@Data
public class PageInfo {
	private int listCount; // 총 게시물 수
	private int pageListLimit; // 페이지 당 표시할 페이지 번호 개수 
	private int maxPage; 
	private int startPage;
	private int endPage;
	
	public PageInfo(int listCount, int pageListLimit, int maxPage, int startPage, int endPage) {
		this.listCount = listCount;
		this.pageListLimit = pageListLimit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}
	
	
	
}
