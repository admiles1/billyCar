package com.itwill.billycar.vo;

import java.time.LocalDateTime;

public class PaymentVO {
	private int payment_id;
	private int payment_method;
	private int payment_status;
	private LocalDateTime payment_date;
	private int payment_result_amount;
	
	public int getPayment_id() {
		return payment_id;
	}
	public void setPayment_id(int payment_id) {
		this.payment_id = payment_id;
	}
	public int getPayment_method() {
		return payment_method;
	}
	public void setPayment_method(int payment_method) {
		this.payment_method = payment_method;
	}
	public int getPayment_status() {
		return payment_status;
	}
	public void setPayment_status(int payment_status) {
		this.payment_status = payment_status;
	}
	public LocalDateTime getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(LocalDateTime payment_date) {
		this.payment_date = payment_date;
	}
	public int getPayment_result_amount() {
		return payment_result_amount;
	}
	public void setPayment_result_amount(int payment_result_amount) {
		this.payment_result_amount = payment_result_amount;
	}
	
	
}
