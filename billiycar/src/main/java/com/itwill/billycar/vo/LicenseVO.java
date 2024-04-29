package com.itwill.billycar.vo;

import java.sql.Date;

public class LicenseVO {
	private String license_id;
	private String license_user_id;
	private String license_name;
	private Date license_issue_date;
	private Date license_expiration_date;
	
	public String getLicense_id() {
		return license_id;
	}
	public void setLicense_id(String license_id) {
		this.license_id = license_id;
	}
	public String getLicense_user_id() {
		return license_user_id;
	}
	public void setLicense_user_id(String license_user_id) {
		this.license_user_id = license_user_id;
	}
	public String getLicense_name() {
		return license_name;
	}
	public void setLicense_name(String license_name) {
		this.license_name = license_name;
	}
	public Date getLicense_issue_date() {
		return license_issue_date;
	}
	public void setLicense_issue_date(Date license_issue_date) {
		this.license_issue_date = license_issue_date;
	}
	public Date getLicense_expiration_date() {
		return license_expiration_date;
	}
	public void setLicense_expiration_date(Date license_expiration_date) {
		this.license_expiration_date = license_expiration_date;
	}
	

}
