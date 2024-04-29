package com.itwill.billycar.vo;

import java.sql.Date;
import java.time.LocalDateTime;

public class ReservVO {
	private Date reserv_startdate;
	private Date reserv_enddate;
	private String reserv_startlocation;
	private String reserv_endlocation;
	private int reserv_insurance;
	private int reserv_status;
	private int reserv_option;
	private LocalDateTime reserv_reg_date;
	private int car_idx;
	private String member_id;
	
	public Date getReserv_startdate() {
		return reserv_startdate;
	}
	public void setReserv_startdate(Date reserv_startdate) {
		this.reserv_startdate = reserv_startdate;
	}
	public Date getReserv_enddate() {
		return reserv_enddate;
	}
	public void setReserv_enddate(Date reserv_enddate) {
		this.reserv_enddate = reserv_enddate;
	}
	public String getReserv_startlocation() {
		return reserv_startlocation;
	}
	public void setReserv_startlocation(String reserv_startlocation) {
		this.reserv_startlocation = reserv_startlocation;
	}
	public String getReserv_endlocation() {
		return reserv_endlocation;
	}
	public void setReserv_endlocation(String reserv_endlocation) {
		this.reserv_endlocation = reserv_endlocation;
	}
	public int getReserv_insurance() {
		return reserv_insurance;
	}
	public void setReserv_insurance(int reserv_insurance) {
		this.reserv_insurance = reserv_insurance;
	}
	public int getReserv_status() {
		return reserv_status;
	}
	public void setReserv_status(int reserv_status) {
		this.reserv_status = reserv_status;
	}
	public int getReserv_option() {
		return reserv_option;
	}
	public void setReserv_option(int reserv_option) {
		this.reserv_option = reserv_option;
	}
	public LocalDateTime getReserv_reg_date() {
		return reserv_reg_date;
	}
	public void setReserv_reg_date(LocalDateTime reserv_reg_date) {
		this.reserv_reg_date = reserv_reg_date;
	}
	public int getCar_idx() {
		return car_idx;
	}
	public void setCar_idx(int car_idx) {
		this.car_idx = car_idx;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	
}
