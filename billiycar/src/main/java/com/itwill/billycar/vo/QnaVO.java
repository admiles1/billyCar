package com.itwill.billycar.vo;

import java.time.LocalDateTime;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class QnaVO {
	private int qna_idx;
	private String qna_writer;
	private String qna_subject;
	private String qna_content;
	private String qna_file;
	private MultipartFile qna_file_form;
	private LocalDateTime qna_date;
	private String admin_id;
	private String admin_content;
	private int qna_status;
	private String qna_category;
}
