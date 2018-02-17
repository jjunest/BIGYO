package com.innovest.dto;

import java.sql.Timestamp;
import java.util.List;

public class tvTopicReply_DTO {
	Integer sp_topic_reply_rcdno;
	Integer sp_topic_reply_topicRcdno;
	Integer sp_topic_reply_parentRcdno;
	Integer sp_topic_reply_depth;
	String sp_topic_reply_content;
	String sp_topic_reply_writer;
	String sp_topic_reply_password;
	Timestamp sp_topic_reply_datetime;
	Integer sp_topic_reply_warning;
	Integer sp_topic_reply_thumbup;

	

	public tvTopicReply_DTO(Integer sp_topic_reply_rcdno, Integer sp_topic_reply_topicRcdno,
			Integer sp_topic_reply_parentRcdno, Integer sp_topic_reply_depth,
			String sp_topic_reply_content, String sp_topic_reply_writer,
			String sp_topic_reply_password, Timestamp sp_topic_reply_datetime,
			Integer sp_topic_reply_warning, Integer sp_topic_reply_thumbup) {
		super();
		this.sp_topic_reply_rcdno = sp_topic_reply_rcdno;
		this.sp_topic_reply_topicRcdno = sp_topic_reply_topicRcdno;
		this.sp_topic_reply_parentRcdno = sp_topic_reply_parentRcdno;
		this.sp_topic_reply_depth = sp_topic_reply_depth;
		this.sp_topic_reply_content = sp_topic_reply_content;
		this.sp_topic_reply_writer = sp_topic_reply_writer;
		this.sp_topic_reply_password = sp_topic_reply_password;
		this.sp_topic_reply_datetime = sp_topic_reply_datetime;
		this.sp_topic_reply_warning = sp_topic_reply_warning;
		this.sp_topic_reply_thumbup = sp_topic_reply_thumbup;
	}

	public Integer getSp_topic_reply_rcdno() {
		return sp_topic_reply_rcdno;
	}

	public void setSp_topic_reply_rcdno(Integer sp_topic_reply_rcdno) {
		this.sp_topic_reply_rcdno = sp_topic_reply_rcdno;
	}

	public Integer getSp_topic_reply_topicRcdno() {
		return sp_topic_reply_topicRcdno;
	}

	public void setSp_topic_reply_topicRcdno(Integer sp_topic_reply_topicRcdno) {
		this.sp_topic_reply_topicRcdno = sp_topic_reply_topicRcdno;
	}

	public Integer getSp_topic_reply_parentRcdno() {
		return sp_topic_reply_parentRcdno;
	}

	public void setSp_topic_reply_parentRcdno(Integer sp_topic_reply_parentRcdno) {
		this.sp_topic_reply_parentRcdno = sp_topic_reply_parentRcdno;
	}

	public Integer getSp_topic_reply_depth() {
		return sp_topic_reply_depth;
	}

	public void setSp_topic_reply_depth(Integer sp_topic_reply_depth) {
		this.sp_topic_reply_depth = sp_topic_reply_depth;
	}

	public String getSp_topic_reply_content() {
		return sp_topic_reply_content;
	}

	public void setSp_topic_reply_content(String sp_topic_reply_content) {
		this.sp_topic_reply_content = sp_topic_reply_content;
	}

	public String getSp_topic_reply_writer() {
		return sp_topic_reply_writer;
	}

	public void setSp_topic_reply_writer(String sp_topic_reply_writer) {
		this.sp_topic_reply_writer = sp_topic_reply_writer;
	}

	public String getSp_topic_reply_password() {
		return sp_topic_reply_password;
	}

	public void setSp_topic_reply_password(String sp_topic_reply_password) {
		this.sp_topic_reply_password = sp_topic_reply_password;
	}

	public Timestamp getSp_topic_reply_datetime() {
		return sp_topic_reply_datetime;
	}

	public void setSp_topic_reply_datetime(Timestamp sp_topic_reply_datetime) {
		this.sp_topic_reply_datetime = sp_topic_reply_datetime;
	}

	public Integer getSp_topic_reply_warning() {
		return sp_topic_reply_warning;
	}

	public void setSp_topic_reply_warning(Integer sp_topic_reply_warning) {
		this.sp_topic_reply_warning = sp_topic_reply_warning;
	}

	public Integer getSp_topic_reply_thumbup() {
		return sp_topic_reply_thumbup;
	}

	public void setSp_topic_reply_thumbup(Integer sp_topic_reply_thumbup) {
		this.sp_topic_reply_thumbup = sp_topic_reply_thumbup;
	}

}
