package com.innovest.dto;

public class userDTO {

	public Integer rcdno;
	public String userid;
	public String password;
	public Integer enabled;
	public String realname;
	public String nickname;
	public String openname;
	public String groupname;
	public String groupname_open;
	public String sns;
	public String sns_open;
	public String etc1;
	public String etc2;
	public String etc3;

	public userDTO(String userid, String password, Integer enabled, String realname,
			String nickname, String openname, String groupname, String groupname_open, String sns,
			String sns_open) {
		super();
		this.userid = userid;
		this.password = password;
		this.enabled = enabled;
		this.realname = realname;
		this.nickname = nickname;
		this.openname = openname;
		this.groupname = groupname;
		this.groupname_open = groupname_open;
		this.sns = sns;
		this.sns_open = sns_open;
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

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getOpenname() {
		return openname;
	}

	public void setOpenname(String openname) {
		this.openname = openname;
	}

	public String getGroupname() {
		return groupname;
	}

	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}

	public String getGroupname_open() {
		return groupname_open;
	}

	public void setGroupname_open(String groupname_open) {
		this.groupname_open = groupname_open;
	}

	public String getSns() {
		return sns;
	}

	public void setSns(String sns) {
		this.sns = sns;
	}

	public String getSns_open() {
		return sns_open;
	}

	public void setSns_open(String sns_open) {
		this.sns_open = sns_open;
	}

	public String getEtc1() {
		return etc1;
	}

	public void setEtc1(String etc1) {
		this.etc1 = etc1;
	}

	public String getEtc2() {
		return etc2;
	}

	public void setEtc2(String etc2) {
		this.etc2 = etc2;
	}

	public String getEtc3() {
		return etc3;
	}

	public void setEtc3(String etc3) {
		this.etc3 = etc3;
	}

}
