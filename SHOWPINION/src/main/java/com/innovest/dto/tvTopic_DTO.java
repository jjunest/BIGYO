package com.innovest.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class tvTopic_DTO {
	Integer sp_tvtopics_rcdno;
	String sp_tvtopics_title;
	Integer sp_tvtopics_writer;
	Timestamp sp_tvtopics_write_date;
	Integer sp_tvtopics_view;
	String sp_tvtopics_situation_desc;
	String sp_tvtopics_tvshow_name;
	String sp_tvtopics_tvshow_imgurl;
	String sp_tvtopics_tvshow_imgOriname;
	Integer sp_tvtopics_tvshow_imgbyte;
	Date sp_tvtopics_tvshow_date;
	String sp_tvtopics_tvshow_desc;
	String sp_tvtopics_etc1;
	String sp_tvtopics_etc2;
	String sp_tvtopics_etc3;
	String sp_tvtopics_pro1;
	String sp_tvtopics_pro2;
	String sp_tvtopics_pro3;
	String sp_tvtopics_pro4;
	String sp_tvtopics_pro5;
	String sp_tvtopics_con1;
	String sp_tvtopics_con2;
	String sp_tvtopics_con3;
	String sp_tvtopics_con4;
	String sp_tvtopics_con5;
	String sp_tvtopics_delete;
	String sp_tvtopics_type;
	userDTO writer_infomation;
	
	
	public tvTopic_DTO(Integer sp_tvtopics_rcdno, String sp_tvtopics_title,
			Integer sp_tvtopics_writer, Timestamp sp_tvtopics_write_date, Integer sp_tvtopics_view,
			String sp_tvtopics_situation_desc, String sp_tvtopics_tvshow_name,
			String sp_tvtopics_tvshow_imgurl, String sp_tvtopics_tvshow_imgOriname,
			Integer sp_tvtopics_tvshow_imgbyte, Date sp_tvtopics_tvshow_date,
			String sp_tvtopics_tvshow_desc, String sp_tvtopics_etc1, String sp_tvtopics_etc2,
			String sp_tvtopics_etc3, String sp_tvtopics_pro1, String sp_tvtopics_pro2,
			String sp_tvtopics_pro3, String sp_tvtopics_pro4, String sp_tvtopics_pro5,
			String sp_tvtopics_con1, String sp_tvtopics_con2, String sp_tvtopics_con3,
			String sp_tvtopics_con4, String sp_tvtopics_con5, String sp_tvtopics_delete,
			String sp_tvtopics_type) {
		super();
		this.sp_tvtopics_rcdno = sp_tvtopics_rcdno;
		this.sp_tvtopics_title = sp_tvtopics_title;
		this.sp_tvtopics_writer = sp_tvtopics_writer;
		this.sp_tvtopics_write_date = sp_tvtopics_write_date;
		this.sp_tvtopics_view = sp_tvtopics_view;
		this.sp_tvtopics_situation_desc = sp_tvtopics_situation_desc;
		this.sp_tvtopics_tvshow_name = sp_tvtopics_tvshow_name;
		this.sp_tvtopics_tvshow_imgurl = sp_tvtopics_tvshow_imgurl;
		this.sp_tvtopics_tvshow_imgOriname = sp_tvtopics_tvshow_imgOriname;
		this.sp_tvtopics_tvshow_imgbyte = sp_tvtopics_tvshow_imgbyte;
		this.sp_tvtopics_tvshow_date = sp_tvtopics_tvshow_date;
		this.sp_tvtopics_tvshow_desc = sp_tvtopics_tvshow_desc;
		this.sp_tvtopics_etc1 = sp_tvtopics_etc1;
		this.sp_tvtopics_etc2 = sp_tvtopics_etc2;
		this.sp_tvtopics_etc3 = sp_tvtopics_etc3;
		this.sp_tvtopics_pro1 = sp_tvtopics_pro1;
		this.sp_tvtopics_pro2 = sp_tvtopics_pro2;
		this.sp_tvtopics_pro3 = sp_tvtopics_pro3;
		this.sp_tvtopics_pro4 = sp_tvtopics_pro4;
		this.sp_tvtopics_pro5 = sp_tvtopics_pro5;
		this.sp_tvtopics_con1 = sp_tvtopics_con1;
		this.sp_tvtopics_con2 = sp_tvtopics_con2;
		this.sp_tvtopics_con3 = sp_tvtopics_con3;
		this.sp_tvtopics_con4 = sp_tvtopics_con4;
		this.sp_tvtopics_con5 = sp_tvtopics_con5;
		this.sp_tvtopics_delete = sp_tvtopics_delete;
		this.sp_tvtopics_type = sp_tvtopics_type;
	}
	public Integer getSp_tvtopics_rcdno() {
		return sp_tvtopics_rcdno;
	}
	public void setSp_tvtopics_rcdno(Integer sp_tvtopics_rcdno) {
		this.sp_tvtopics_rcdno = sp_tvtopics_rcdno;
	}
	public String getSp_tvtopics_title() {
		return sp_tvtopics_title;
	}
	public void setSp_tvtopics_title(String sp_tvtopics_title) {
		this.sp_tvtopics_title = sp_tvtopics_title;
	}
	public Integer getSp_tvtopics_writer() {
		return sp_tvtopics_writer;
	}
	public void setSp_tvtopics_writer(Integer sp_tvtopics_writer) {
		this.sp_tvtopics_writer = sp_tvtopics_writer;
	}
	public Timestamp getSp_tvtopics_write_date() {
		return sp_tvtopics_write_date;
	}
	public void setSp_tvtopics_write_date(Timestamp sp_tvtopics_write_date) {
		this.sp_tvtopics_write_date = sp_tvtopics_write_date;
	}
	public Integer getSp_tvtopics_view() {
		return sp_tvtopics_view;
	}
	public void setSp_tvtopics_view(Integer sp_tvtopics_view) {
		this.sp_tvtopics_view = sp_tvtopics_view;
	}
	public String getSp_tvtopics_situation_desc() {
		return sp_tvtopics_situation_desc;
	}
	public void setSp_tvtopics_situation_desc(String sp_tvtopics_situation_desc) {
		this.sp_tvtopics_situation_desc = sp_tvtopics_situation_desc;
	}
	public String getSp_tvtopics_tvshow_name() {
		return sp_tvtopics_tvshow_name;
	}
	public void setSp_tvtopics_tvshow_name(String sp_tvtopics_tvshow_name) {
		this.sp_tvtopics_tvshow_name = sp_tvtopics_tvshow_name;
	}
	public String getSp_tvtopics_tvshow_imgurl() {
		return sp_tvtopics_tvshow_imgurl;
	}
	public void setSp_tvtopics_tvshow_imgurl(String sp_tvtopics_tvshow_imgurl) {
		this.sp_tvtopics_tvshow_imgurl = sp_tvtopics_tvshow_imgurl;
	}
	public String getSp_tvtopics_tvshow_imgOriname() {
		return sp_tvtopics_tvshow_imgOriname;
	}
	public void setSp_tvtopics_tvshow_imgOriname(String sp_tvtopics_tvshow_imgOriname) {
		this.sp_tvtopics_tvshow_imgOriname = sp_tvtopics_tvshow_imgOriname;
	}
	public Integer getSp_tvtopics_tvshow_imgbyte() {
		return sp_tvtopics_tvshow_imgbyte;
	}
	public void setSp_tvtopics_tvshow_imgbyte(Integer sp_tvtopics_tvshow_imgbyte) {
		this.sp_tvtopics_tvshow_imgbyte = sp_tvtopics_tvshow_imgbyte;
	}
	public Date getSp_tvtopics_tvshow_date() {
		return sp_tvtopics_tvshow_date;
	}
	public void setSp_tvtopics_tvshow_date(Date sp_tvtopics_tvshow_date) {
		this.sp_tvtopics_tvshow_date = sp_tvtopics_tvshow_date;
	}
	public String getSp_tvtopics_tvshow_desc() {
		return sp_tvtopics_tvshow_desc;
	}
	public void setSp_tvtopics_tvshow_desc(String sp_tvtopics_tvshow_desc) {
		this.sp_tvtopics_tvshow_desc = sp_tvtopics_tvshow_desc;
	}
	public String getSp_tvtopics_etc1() {
		return sp_tvtopics_etc1;
	}
	public void setSp_tvtopics_etc1(String sp_tvtopics_etc1) {
		this.sp_tvtopics_etc1 = sp_tvtopics_etc1;
	}
	public String getSp_tvtopics_etc2() {
		return sp_tvtopics_etc2;
	}
	public void setSp_tvtopics_etc2(String sp_tvtopics_etc2) {
		this.sp_tvtopics_etc2 = sp_tvtopics_etc2;
	}
	public String getSp_tvtopics_etc3() {
		return sp_tvtopics_etc3;
	}
	public void setSp_tvtopics_etc3(String sp_tvtopics_etc3) {
		this.sp_tvtopics_etc3 = sp_tvtopics_etc3;
	}
	public String getSp_tvtopics_pro1() {
		return sp_tvtopics_pro1;
	}
	public void setSp_tvtopics_pro1(String sp_tvtopics_pro1) {
		this.sp_tvtopics_pro1 = sp_tvtopics_pro1;
	}
	public String getSp_tvtopics_pro2() {
		return sp_tvtopics_pro2;
	}
	public void setSp_tvtopics_pro2(String sp_tvtopics_pro2) {
		this.sp_tvtopics_pro2 = sp_tvtopics_pro2;
	}
	public String getSp_tvtopics_pro3() {
		return sp_tvtopics_pro3;
	}
	public void setSp_tvtopics_pro3(String sp_tvtopics_pro3) {
		this.sp_tvtopics_pro3 = sp_tvtopics_pro3;
	}
	public String getSp_tvtopics_pro4() {
		return sp_tvtopics_pro4;
	}
	public void setSp_tvtopics_pro4(String sp_tvtopics_pro4) {
		this.sp_tvtopics_pro4 = sp_tvtopics_pro4;
	}
	public String getSp_tvtopics_pro5() {
		return sp_tvtopics_pro5;
	}
	public void setSp_tvtopics_pro5(String sp_tvtopics_pro5) {
		this.sp_tvtopics_pro5 = sp_tvtopics_pro5;
	}
	public String getSp_tvtopics_con1() {
		return sp_tvtopics_con1;
	}
	public void setSp_tvtopics_con1(String sp_tvtopics_con1) {
		this.sp_tvtopics_con1 = sp_tvtopics_con1;
	}
	public String getSp_tvtopics_con2() {
		return sp_tvtopics_con2;
	}
	public void setSp_tvtopics_con2(String sp_tvtopics_con2) {
		this.sp_tvtopics_con2 = sp_tvtopics_con2;
	}
	public String getSp_tvtopics_con3() {
		return sp_tvtopics_con3;
	}
	public void setSp_tvtopics_con3(String sp_tvtopics_con3) {
		this.sp_tvtopics_con3 = sp_tvtopics_con3;
	}
	public String getSp_tvtopics_con4() {
		return sp_tvtopics_con4;
	}
	public void setSp_tvtopics_con4(String sp_tvtopics_con4) {
		this.sp_tvtopics_con4 = sp_tvtopics_con4;
	}
	public String getSp_tvtopics_con5() {
		return sp_tvtopics_con5;
	}
	public void setSp_tvtopics_con5(String sp_tvtopics_con5) {
		this.sp_tvtopics_con5 = sp_tvtopics_con5;
	}
	public String getSp_tvtopics_delete() {
		return sp_tvtopics_delete;
	}
	public void setSp_tvtopics_delete(String sp_tvtopics_delete) {
		this.sp_tvtopics_delete = sp_tvtopics_delete;
	}
	public String getSp_tvtopics_type() {
		return sp_tvtopics_type;
	}
	public void setSp_tvtopics_type(String sp_tvtopics_type) {
		this.sp_tvtopics_type = sp_tvtopics_type;
	}
	public userDTO getWriter_infomation() {
		return writer_infomation;
	}
	public void setWriter_infomation(userDTO writer_infomation) {
		this.writer_infomation = writer_infomation;
	}
	
	

}
