package com.itwill.billycar.vo;

import java.sql.Date;
import java.time.LocalDateTime;

public class MemberVO {
	private int member_idx;
	private String member_id;
	private String member_name;
	private String member_passwd;
	private String member_email;
	private String member_birth;
	private String member_phone;
	private LocalDateTime reg_date;
	private int member_license;
	private String inviter;
	
	
	
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_passwd() {
		return member_passwd;
	}
	public void setMember_passwd(String member_passwd) {
		this.member_passwd = member_passwd;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_birth() {
		return member_birth;
	}
	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public LocalDateTime getReg_date() {
		return reg_date;
	}
	public void setReg_date(LocalDateTime reg_date) {
		this.reg_date = reg_date;
	}
	public int getMember_license() {
		return member_license;
	}
	public void setMember_license(int member_license) {
		this.member_license = member_license;
	}
	public String getInviter() {
		return inviter;
	}
	public void setInviter(String inviter) {
		this.inviter = inviter;
	}
	
	@Override
	public String toString() {
		return "MemberVO [member_id=" + member_id + ", member_name=" + member_name + ", member_passwd=" + member_passwd
				+ ", member_email=" + member_email + ", member_birth=" + member_birth + ", member_phone=" + member_phone
				+ ", reg_date=" + reg_date + ", member_license=" + member_license + ", inviter=" + inviter + "]";
	}
}