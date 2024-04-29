package com.itwill.billycar.vo;

import java.time.LocalDateTime;

public class NoticeVO {
	private String board_subject;
	private String board_content;
	private int board_writer;
	private int board_readcount;
	private LocalDateTime board_date;
	
	public String getBoard_subject() {
		return board_subject;
	}
	public void setBoard_subject(String board_subject) {
		this.board_subject = board_subject;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public int getBoard_writer() {
		return board_writer;
	}
	public void setBoard_writer(int board_writer) {
		this.board_writer = board_writer;
	}
	public int getBoard_readcount() {
		return board_readcount;
	}
	public void setBoard_readcount(int board_readcount) {
		this.board_readcount = board_readcount;
	}
	public LocalDateTime getBoard_date() {
		return board_date;
	}
	public void setBoard_date(LocalDateTime board_date) {
		this.board_date = board_date;
	}
	
	
}
