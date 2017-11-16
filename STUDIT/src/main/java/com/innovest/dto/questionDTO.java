package com.innovest.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class questionDTO {

	Integer rcdno;
	String user_name;
	String user_phone;
	String user_phone_extra;
	String question_title;
	String question_body;
	Date question_date;
	public questionDTO(Integer rcdno, String user_name, String user_phone, String user_phone_extra,
			String question_title, String question_body, Date question_date) {
		super();
		this.rcdno = rcdno;
		this.user_name = user_name;
		this.user_phone = user_phone;
		this.user_phone_extra = user_phone_extra;
		this.question_title = question_title;
		this.question_body = question_body;
		this.question_date = question_date;
	}
	public questionDTO(String user_name, String user_phone, String user_phone_extra, String question_title,
			String question_body, Date question_date) {
		super();
		this.user_name = user_name;
		this.user_phone = user_phone;
		this.user_phone_extra = user_phone_extra;
		this.question_title = question_title;
		this.question_body = question_body;
		this.question_date = question_date;
	}
	public Integer getRcdno() {
		return rcdno;
	}
	public void setRcdno(Integer rcdno) {
		this.rcdno = rcdno;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_phone_extra() {
		return user_phone_extra;
	}
	public void setUser_phone_extra(String user_phone_extra) {
		this.user_phone_extra = user_phone_extra;
	}
	public String getQuestion_title() {
		return question_title;
	}
	public void setQuestion_title(String question_title) {
		this.question_title = question_title;
	}
	public String getQuestion_body() {
		return question_body;
	}
	public void setQuestion_body(String question_body) {
		this.question_body = question_body;
	}
	public Date getQuestion_date() {
		return question_date;
	}
	public void setQuestion_date(Date question_date) {
		this.question_date = question_date;
	}

}
