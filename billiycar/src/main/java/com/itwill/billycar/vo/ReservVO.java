package com.itwill.billycar.vo;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class ReservVO {
	private LocalDateTime reserv_pickupdate;
	private LocalDateTime reserv_returndate;
	private String reserv_pickuplocation;
	private String reserv_returnlocation;
	private int reserv_insurance;
	private int reserv_status;
	private int reserv_option;
	private LocalDateTime reserv_reg_date;
	private String car_number;
	private String member_id;
	private int reserv_idx;
	private int reserv_review_status;
}
