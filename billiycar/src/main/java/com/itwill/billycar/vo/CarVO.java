package com.itwill.billycar.vo;

import java.time.LocalDateTime;
import java.time.Year;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class CarVO {
	private int car_idx;
	private String car_number;
	private String car_model;
	private String car_brand;
	private String car_fuel;
	private String car_type;
	private String gear_type;
	private String car_capacity;
	private String car_img;
	private MultipartFile mfc_img;
	private Year car_year;
	private int car_dayprice;
	private int car_hourprice;
	private int car_status;
	private int car_canReserve;
	private LocalDateTime car_reg_date;
}
