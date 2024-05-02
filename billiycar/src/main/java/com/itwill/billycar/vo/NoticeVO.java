package com.itwill.billycar.vo;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class NoticeVO {
	private String board_subject;
	private String board_content;
	private int board_writer;
	private int board_readcount;
	private LocalDateTime board_date;
}
