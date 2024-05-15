package com.itwill.billycar.vo;

import lombok.Data;

@Data
public class CouponIssueVO {
	private int issue_id;
	private int coupon_id;
	private String member_id;
	private int coupon_used_status;
}
