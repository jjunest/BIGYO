package com.innovest.dtos;

import java.sql.Date;
import java.sql.Timestamp;

public class CheckUp_DTO {

	Integer chk_rcdno;
	String chk_hos_name;
	String chk_hos_pnum;
	String chk_price;
	String chk_loc_sido;
	String chk_loc_full;
	String chk_loc_lat;
	String chk_loc_lng;
	String chk_target_age;
	String chk_info_link;
	String chk_mid_company;
	String chk_mid_company_pnum;
	String chk_mid_company_link;
	Date chk_end_date;
	Timestamp chk_created_date;
	
	
	
	
	public CheckUp_DTO(String chk_hos_name, String chk_hos_pnum, String chk_price, String chk_loc_sido,
			String chk_loc_full, String chk_loc_lat, String chk_loc_lng, String chk_target_age, String chk_info_link,
			String chk_mid_company, String chk_mid_company_pnum, String chk_mid_company_link, Date chk_end_date,
			Timestamp chk_created_date) {
		super();
		this.chk_hos_name = chk_hos_name;
		this.chk_hos_pnum = chk_hos_pnum;
		this.chk_price = chk_price;
		this.chk_loc_sido = chk_loc_sido;
		this.chk_loc_full = chk_loc_full;
		this.chk_loc_lat = chk_loc_lat;
		this.chk_loc_lng = chk_loc_lng;
		this.chk_target_age = chk_target_age;
		this.chk_info_link = chk_info_link;
		this.chk_mid_company = chk_mid_company;
		this.chk_mid_company_pnum = chk_mid_company_pnum;
		this.chk_mid_company_link = chk_mid_company_link;
		this.chk_end_date = chk_end_date;
		this.chk_created_date = chk_created_date;
	}
	public CheckUp_DTO(Integer chk_rcdno, String chk_hos_name, String chk_hos_pnum, String chk_price,
			String chk_loc_sido, String chk_loc_full, String chk_loc_lat, String chk_loc_lng, String chk_target_age,
			String chk_info_link, String chk_mid_company, String chk_mid_company_pnum, String chk_mid_company_link,
			Date chk_end_date, Timestamp chk_created_date) {
		super();
		this.chk_rcdno = chk_rcdno;
		this.chk_hos_name = chk_hos_name;
		this.chk_hos_pnum = chk_hos_pnum;
		this.chk_price = chk_price;
		this.chk_loc_sido = chk_loc_sido;
		this.chk_loc_full = chk_loc_full;
		this.chk_loc_lat = chk_loc_lat;
		this.chk_loc_lng = chk_loc_lng;
		this.chk_target_age = chk_target_age;
		this.chk_info_link = chk_info_link;
		this.chk_mid_company = chk_mid_company;
		this.chk_mid_company_pnum = chk_mid_company_pnum;
		this.chk_mid_company_link = chk_mid_company_link;
		this.chk_end_date = chk_end_date;
		this.chk_created_date = chk_created_date;
	}
	public Integer getChk_rcdno() {
		return chk_rcdno;
	}
	public void setChk_rcdno(Integer chk_rcdno) {
		this.chk_rcdno = chk_rcdno;
	}
	public String getChk_hos_name() {
		return chk_hos_name;
	}
	public void setChk_hos_name(String chk_hos_name) {
		this.chk_hos_name = chk_hos_name;
	}
	public String getChk_hos_pnum() {
		return chk_hos_pnum;
	}
	public void setChk_hos_pnum(String chk_hos_pnum) {
		this.chk_hos_pnum = chk_hos_pnum;
	}
	public String getChk_price() {
		return chk_price;
	}
	public void setChk_price(String chk_price) {
		this.chk_price = chk_price;
	}
	public String getChk_loc_sido() {
		return chk_loc_sido;
	}
	public void setChk_loc_sido(String chk_loc_sido) {
		this.chk_loc_sido = chk_loc_sido;
	}
	public String getChk_loc_full() {
		return chk_loc_full;
	}
	public void setChk_loc_full(String chk_loc_full) {
		this.chk_loc_full = chk_loc_full;
	}
	public String getChk_loc_lat() {
		return chk_loc_lat;
	}
	public void setChk_loc_lat(String chk_loc_lat) {
		this.chk_loc_lat = chk_loc_lat;
	}
	public String getChk_loc_lng() {
		return chk_loc_lng;
	}
	public void setChk_loc_lng(String chk_loc_lng) {
		this.chk_loc_lng = chk_loc_lng;
	}
	public String getChk_target_age() {
		return chk_target_age;
	}
	public void setChk_target_age(String chk_target_age) {
		this.chk_target_age = chk_target_age;
	}
	public String getChk_info_link() {
		return chk_info_link;
	}
	public void setChk_info_link(String chk_info_link) {
		this.chk_info_link = chk_info_link;
	}
	public String getChk_mid_company() {
		return chk_mid_company;
	}
	public void setChk_mid_company(String chk_mid_company) {
		this.chk_mid_company = chk_mid_company;
	}
	public String getChk_mid_company_pnum() {
		return chk_mid_company_pnum;
	}
	public void setChk_mid_company_pnum(String chk_mid_company_pnum) {
		this.chk_mid_company_pnum = chk_mid_company_pnum;
	}
	public String getChk_mid_company_link() {
		return chk_mid_company_link;
	}
	public void setChk_mid_company_link(String chk_mid_company_link) {
		this.chk_mid_company_link = chk_mid_company_link;
	}
	public Date getChk_end_date() {
		return chk_end_date;
	}
	public void setChk_end_date(Date chk_end_date) {
		this.chk_end_date = chk_end_date;
	}
	public Timestamp getChk_created_date() {
		return chk_created_date;
	}
	public void setChk_created_date(Timestamp chk_created_date) {
		this.chk_created_date = chk_created_date;
	}
	
	
	
	
	
	
	

	
	
}
