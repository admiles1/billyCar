package com.itwill.billycar.vo;

import java.time.LocalDateTime;

import lombok.Data;
@Data
public class PaymentVO {
	private int payment_id;
	private int payment_method;
	private int payment_status;
	private LocalDateTime payment_date;
	private int payment_result_amount;
	
	
	
	
}
