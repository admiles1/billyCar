package com.itwill.billycar.vo;

public class CouponIssueVO {
	private int coupon_id;
	private String member_id;
	private int issue_status;
	public int getCoupon_id() {
		return coupon_id;
	}
	public void setCoupon_id(int coupon_id) {
		this.coupon_id = coupon_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getIssue_status() {
		return issue_status;
	}
	public void setIssue_status(int issue_status) {
		this.issue_status = issue_status;
	}
	

}
