package com.itwill.billycar.vo;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.Year;

public class CarVO {
	private String car_number;
	private String car_model;
	private String car_maker;
	private String car_fuel;
	private String car_them;
	private String car_img;
	private Year car_year;
	private BigDecimal car_price;
	private int car_canReserve;
	private LocalDateTime car_reg_date;
	
	public String getCar_number() {
		return car_number;
	}
	public void setCar_number(String car_number) {
		this.car_number = car_number;
	}
	public String getCar_model() {
		return car_model;
	}
	public void setCar_model(String car_model) {
		this.car_model = car_model;
	}
	public String getCar_maker() {
		return car_maker;
	}
	public void setCar_maker(String car_maker) {
		this.car_maker = car_maker;
	}
	public String getCar_fuel() {
		return car_fuel;
	}
	public void setCar_fuel(String car_fuel) {
		this.car_fuel = car_fuel;
	}
	public String getCar_them() {
		return car_them;
	}
	public void setCar_them(String car_them) {
		this.car_them = car_them;
	}
	public String getCar_img() {
		return car_img;
	}
	public void setCar_img(String car_img) {
		this.car_img = car_img;
	}
	public Year getCar_year() {
		return car_year;
	}
	public void setCar_year(Year car_year) {
		this.car_year = car_year;
	}
	public BigDecimal getCar_price() {
		return car_price;
	}
	public void setCar_price(BigDecimal car_price) {
		this.car_price = car_price;
	}
	public int getCar_canReserve() {
		return car_canReserve;
	}
	public void setCar_canReserve(int car_canReserve) {
		this.car_canReserve = car_canReserve;
	}
	public LocalDateTime getCar_reg_date() {
		return car_reg_date;
	}
	public void setCar_reg_date(LocalDateTime car_reg_date) {
		this.car_reg_date = car_reg_date;
	}
	
	
}
