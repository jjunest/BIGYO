package com.innovest.dto;

public class userDTO {

	public Integer rcdno;
	public String userid;
	public String password;
	public Integer enabled;
	public String real_name;
	public String phone_number;
	public String email_address;
	
	
	
	
	public userDTO(String userid, String password, Integer enabled, String real_name, String phone_number, String email_address) {
		super();
		this.userid = userid;
		this.password = password;
		this.enabled = enabled;
		this.real_name = real_name;
		this.phone_number = phone_number;
		this.email_address = email_address;
	}


	public userDTO(Integer rcdno, String userid, String password, Integer enabled, String real_name, String phone_number, String email_address) {
		super();
		this.rcdno = rcdno;
		this.userid = userid;
		this.password = password;
		this.enabled = enabled;
		this.real_name = real_name;
		this.phone_number = phone_number;
		this.email_address = email_address;
	}
	
	
	public Integer getRcdno() {
		return rcdno;
	}
	public void setRcdno(Integer rcdno) {
		this.rcdno = rcdno;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Integer getEnabled() {
		return enabled;
	}
	public void setEnabled(Integer enabled) {
		this.enabled = enabled;
	}
	public String getReal_name() {
		return real_name;
	}
	public void setReal_name(String real_name) {
		this.real_name = real_name;
	}
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	public String getEmail_address() {
		return email_address;
	}
	public void setEmail_address(String email_address) {
		this.email_address = email_address;
	}
	
}
