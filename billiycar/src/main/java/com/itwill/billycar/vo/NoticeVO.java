package com.itwill.billycar.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class NoticeVO {
	private int board_idx;
	private String board_subject;
	private String board_content;
	private String board_writer;
	private int board_readcount;
	private Timestamp board_date;
}
