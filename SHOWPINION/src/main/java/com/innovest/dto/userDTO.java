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
	Integer ranking_user_like;
	Integer ranking_opinion_show_total;
	Integer ranking_opinion_normal_total;
	Integer ranking_thumbup_total;
	Integer ranking_reply_total;
	String user_self_intro;
	String sp_users_etc1;
	String sp_users_etc2;
	String sp_users_etc3;
	public userDTO(Integer rcdno, String userid, String password, Integer enabled, String realname,
			String nickname, String openname, String groupname, String groupname_open, String sns,
			String sns_open, Integer ranking_user_like, Integer ranking_opinion_show_total,
			Integer ranking_opinion_normal_total, Integer ranking_thumbup_total,
			Integer ranking_reply_total, String user_self_intro, String sp_users_etc1,
			String sp_users_etc2, String sp_users_etc3) {
		super();
		this.rcdno = rcdno;
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
		this.ranking_user_like = ranking_user_like;
		this.ranking_opinion_show_total = ranking_opinion_show_total;
		this.ranking_opinion_normal_total = ranking_opinion_normal_total;
		this.ranking_thumbup_total = ranking_thumbup_total;
		this.ranking_reply_total = ranking_reply_total;
		this.user_self_intro = user_self_intro;
		this.sp_users_etc1 = sp_users_etc1;
		this.sp_users_etc2 = sp_users_etc2;
		this.sp_users_etc3 = sp_users_etc3;
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
	public Integer getRanking_user_like() {
		return ranking_user_like;
	}
	public void setRanking_user_like(Integer ranking_user_like) {
		this.ranking_user_like = ranking_user_like;
	}
	public Integer getRanking_opinion_show_total() {
		return ranking_opinion_show_total;
	}
	public void setRanking_opinion_show_total(Integer ranking_opinion_show_total) {
		this.ranking_opinion_show_total = ranking_opinion_show_total;
	}
	public Integer getRanking_opinion_normal_total() {
		return ranking_opinion_normal_total;
	}
	public void setRanking_opinion_normal_total(Integer ranking_opinion_normal_total) {
		this.ranking_opinion_normal_total = ranking_opinion_normal_total;
	}
	public Integer getRanking_thumbup_total() {
		return ranking_thumbup_total;
	}
	public void setRanking_thumbup_total(Integer ranking_thumbup_total) {
		this.ranking_thumbup_total = ranking_thumbup_total;
	}
	public Integer getRanking_reply_total() {
		return ranking_reply_total;
	}
	public void setRanking_reply_total(Integer ranking_reply_total) {
		this.ranking_reply_total = ranking_reply_total;
	}
	public String getUser_self_intro() {
		return user_self_intro;
	}
	public void setUser_self_intro(String user_self_intro) {
		this.user_self_intro = user_self_intro;
	}
	public String getSp_users_etc1() {
		return sp_users_etc1;
	}
	public void setSp_users_etc1(String sp_users_etc1) {
		this.sp_users_etc1 = sp_users_etc1;
	}
	public String getSp_users_etc2() {
		return sp_users_etc2;
	}
	public void setSp_users_etc2(String sp_users_etc2) {
		this.sp_users_etc2 = sp_users_etc2;
	}
	public String getSp_users_etc3() {
		return sp_users_etc3;
	}
	public void setSp_users_etc3(String sp_users_etc3) {
		this.sp_users_etc3 = sp_users_etc3;
	}


}
