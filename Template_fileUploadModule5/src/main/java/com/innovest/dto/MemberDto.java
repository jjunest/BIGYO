package com.innovest.dto;

public class MemberDto {

	public String admin_id;
	public Integer cmd;
	public String admin_pw;

	public MemberDto(String admin_id, Integer cmd, String admin_pw) {
		super();
		this.admin_id = admin_id;
		this.cmd = cmd;
		this.admin_pw = admin_pw;
	}

	public String getAdmin_id1() {
		return admin_id;
	}

	public void setAdmin_id1(String admin_id) {
		this.admin_id = admin_id;
	}

	public int getCmd1() {
		return cmd;
	}

	public void setCmd1(Integer cmd) {
		this.cmd = cmd;
	}

	public String getAdmin_pw1() {
		return admin_pw;
	}

	public void setAdmin_pw1(String admin_pw) {
		this.admin_pw = admin_pw;
	}
}
