package com.itwill.billycar.vo;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class ReviewVO {
	private int review_idx;
	private String review_id;
	private String review_subject;
	private String review_content;
	private int review_score;
	private int review_readcount;
	private String car_number;
	private LocalDateTime reg_date;
}
