package com.itwill.billycar.vo;

import lombok.Data;

@Data
public class FaqVO {
	private int faq_num;
	private String faq_category;
	private String faq_subject;
	private String faq_content;
	private int faq_writer;
}
