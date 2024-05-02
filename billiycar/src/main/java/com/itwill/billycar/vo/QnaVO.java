package com.itwill.billycar.vo;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class QnaVO {
	private int qna_idx;
	private String qna_writer;
	private String qna_subject;
	private String qna_content;
	private String qna_file;
	private LocalDateTime qna_date;
	private int admin_id;
	private String admin_content;
	private int qna_status;
	private String qna_category;
}
