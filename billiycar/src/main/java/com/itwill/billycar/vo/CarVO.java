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
	private String car_maker;
	private String car_fuel;
	private String car_type;
	private int gear_type;
	private String car_capacity;
	private String car_img;
	private MultipartFile mfc_img;
	private Year car_year;
	private int car_price;
	private int car_canReserve;
	private LocalDateTime car_reg_date;
}
