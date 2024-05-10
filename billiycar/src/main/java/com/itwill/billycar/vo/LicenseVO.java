package com.itwill.billycar.vo;


import lombok.Data;

@Data
public class LicenseVO {
	private String license_id;
	private String license_user_id;
	private String license_name;
	private String license_issue_date;
	private String license_expiration_date;
}
