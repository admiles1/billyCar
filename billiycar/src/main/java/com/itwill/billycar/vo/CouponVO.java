package com.itwill.billycar.vo;

import lombok.Data;

@Data
public class CouponVO {
	
	private int coupon_id;
	private String coupon_code;
	private String coupon_name;
	private int coupon_discount_amount;
}
