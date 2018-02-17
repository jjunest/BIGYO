package com.innovest.dto;

import java.sql.Timestamp;
import java.util.List;

public class opinionReply_DTO {
	Integer sp_opinion_reply_rcdno;
	Integer sp_opinion_reply_opinionRcdno;
	Integer sp_opinion_reply_parentRcdno;
	Integer sp_opinion_reply_depth;
	String sp_opinion_reply_content;
	String sp_opinion_reply_writer;
	String sp_opinion_reply_password;
	Timestamp sp_opinion_reply_datetime;
	Integer sp_opinion_reply_warning;
	Integer sp_opinion_reply_thumbup;
	
	
	public opinionReply_DTO(Integer sp_opinion_reply_rcdno, Integer sp_opinion_reply_opinionRcdno,
			Integer sp_opinion_reply_parentRcdno, Integer sp_opinion_reply_depth,
			String sp_opinion_reply_content, String sp_opinion_reply_writer,
			String sp_opinion_reply_password, Timestamp sp_opinion_reply_datetime,
			Integer sp_opinion_reply_warning, Integer sp_opinion_reply_thumbup) {
		super();
		this.sp_opinion_reply_rcdno = sp_opinion_reply_rcdno;
		this.sp_opinion_reply_opinionRcdno = sp_opinion_reply_opinionRcdno;
		this.sp_opinion_reply_parentRcdno = sp_opinion_reply_parentRcdno;
		this.sp_opinion_reply_depth = sp_opinion_reply_depth;
		this.sp_opinion_reply_content = sp_opinion_reply_content;
		this.sp_opinion_reply_writer = sp_opinion_reply_writer;
		this.sp_opinion_reply_password = sp_opinion_reply_password;
		this.sp_opinion_reply_datetime = sp_opinion_reply_datetime;
		this.sp_opinion_reply_warning = sp_opinion_reply_warning;
		this.sp_opinion_reply_thumbup = sp_opinion_reply_thumbup;
	}
	
	public Integer getSp_opinion_reply_rcdno() {
		return sp_opinion_reply_rcdno;
	}
	public void setSp_opinion_reply_rcdno(Integer sp_opinion_reply_rcdno) {
		this.sp_opinion_reply_rcdno = sp_opinion_reply_rcdno;
	}
	public Integer getSp_opinion_reply_opinionRcdno() {
		return sp_opinion_reply_opinionRcdno;
	}
	public void setSp_opinion_reply_opinionRcdno(Integer sp_opinion_reply_opinionRcdno) {
		this.sp_opinion_reply_opinionRcdno = sp_opinion_reply_opinionRcdno;
	}
	public Integer getSp_opinion_reply_parentRcdno() {
		return sp_opinion_reply_parentRcdno;
	}
	public void setSp_opinion_reply_parentRcdno(Integer sp_opinion_reply_parentRcdno) {
		this.sp_opinion_reply_parentRcdno = sp_opinion_reply_parentRcdno;
	}
	public Integer getSp_opinion_reply_depth() {
		return sp_opinion_reply_depth;
	}
	public void setSp_opinion_reply_depth(Integer sp_opinion_reply_depth) {
		this.sp_opinion_reply_depth = sp_opinion_reply_depth;
	}
	public String getSp_opinion_reply_content() {
		return sp_opinion_reply_content;
	}
	public void setSp_opinion_reply_content(String sp_opinion_reply_content) {
		this.sp_opinion_reply_content = sp_opinion_reply_content;
	}
	public String getSp_opinion_reply_writer() {
		return sp_opinion_reply_writer;
	}
	public void setSp_opinion_reply_writer(String sp_opinion_reply_writer) {
		this.sp_opinion_reply_writer = sp_opinion_reply_writer;
	}
	public String getSp_opinion_reply_password() {
		return sp_opinion_reply_password;
	}
	public void setSp_opinion_reply_password(String sp_opinion_reply_password) {
		this.sp_opinion_reply_password = sp_opinion_reply_password;
	}
	public Timestamp getSp_opinion_reply_datetime() {
		return sp_opinion_reply_datetime;
	}
	public void setSp_opinion_reply_datetime(Timestamp sp_opinion_reply_datetime) {
		this.sp_opinion_reply_datetime = sp_opinion_reply_datetime;
	}
	public Integer getSp_opinion_reply_warning() {
		return sp_opinion_reply_warning;
	}
	public void setSp_opinion_reply_warning(Integer sp_opinion_reply_warning) {
		this.sp_opinion_reply_warning = sp_opinion_reply_warning;
	}
	public Integer getSp_opinion_reply_thumbup() {
		return sp_opinion_reply_thumbup;
	}
	public void setSp_opinion_reply_thumbup(Integer sp_opinion_reply_thumbup) {
		this.sp_opinion_reply_thumbup = sp_opinion_reply_thumbup;
	}

	

}
