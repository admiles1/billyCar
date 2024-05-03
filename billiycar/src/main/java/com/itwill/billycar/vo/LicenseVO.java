package com.itwill.billycar.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class LicenseVO {
	private String license_id;
	private String license_user_id;
	private String license_name;
	private Date license_issue_date;
	private Date license_expiration_date;
	
	
	

}
