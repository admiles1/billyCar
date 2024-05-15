package com.itwill.billycar.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class EventVO {
	private int event_idx;
	private String event_title;
	private String event_content;
	private String event_image;
	private MultipartFile event_image_form;
}
