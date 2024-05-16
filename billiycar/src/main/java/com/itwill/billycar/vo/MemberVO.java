package com.itwill.billycar.vo;

import java.time.LocalDateTime;

import lombok.Data;


@Data
public class MemberVO {
	private int member_idx;
	private String member_id;
	private String member_name;
	private String member_passwd;
	private String member_email;
	private String member_birth;
	private String member_phone;
	private LocalDateTime member_reg_date;
	private int member_license_checked;
	private String member_inviter;
	private int member_status;
	
	
	
	
	
	
}
