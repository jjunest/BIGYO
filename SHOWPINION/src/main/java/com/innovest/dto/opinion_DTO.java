package com.innovest.dto;

import java.sql.Timestamp;

public class opinion_DTO {
	Integer sp_opinion_rcdno;
	Integer sp_opinion_topicrcdno;
	String sp_opinion_topictitle;
	Timestamp sp_opinion_datetime;
	Integer sp_opinion_writer;
	String sp_opinion_side;
	String sp_opinion_reason1;
	String sp_opinion_reason2;
	String sp_opinion_reason3;
	String sp_opinion_opreason1;
	Integer sp_opinion_opreason1_agree;
	String sp_opinion_opreason2;
	Integer sp_opinion_opreason2_agree;
	String sp_opinion_opreason3;
	Integer sp_opinion_opreason3_agree;
	String sp_opinion_detail;
	Integer sp_opinion_warning;
	Integer sp_opinion_thumbup;
	String sp_opinion_type;
	String sp_opinion_etc2;
	String sp_opinion_etc3;
	userDTO writer_infomation;
	public opinion_DTO(Integer sp_opinion_rcdno, Integer sp_opinion_topicrcdno,
			String sp_opinion_topictitle, Timestamp sp_opinion_datetime, Integer sp_opinion_writer,
			String sp_opinion_side, String sp_opinion_reason1, String sp_opinion_reason2,
			String sp_opinion_reason3, String sp_opinion_opreason1,
			Integer sp_opinion_opreason1_agree, String sp_opinion_opreason2,
			Integer sp_opinion_opreason2_agree, String sp_opinion_opreason3,
			Integer sp_opinion_opreason3_agree, String sp_opinion_detail,
			Integer sp_opinion_warning, Integer sp_opinion_thumbup, String sp_opinion_type,
			String sp_opinion_etc2, String sp_opinion_etc3) {
		super();
		this.sp_opinion_rcdno = sp_opinion_rcdno;
		this.sp_opinion_topicrcdno = sp_opinion_topicrcdno;
		this.sp_opinion_topictitle = sp_opinion_topictitle;
		this.sp_opinion_datetime = sp_opinion_datetime;
		this.sp_opinion_writer = sp_opinion_writer;
		this.sp_opinion_side = sp_opinion_side;
		this.sp_opinion_reason1 = sp_opinion_reason1;
		this.sp_opinion_reason2 = sp_opinion_reason2;
		this.sp_opinion_reason3 = sp_opinion_reason3;
		this.sp_opinion_opreason1 = sp_opinion_opreason1;
		this.sp_opinion_opreason1_agree = sp_opinion_opreason1_agree;
		this.sp_opinion_opreason2 = sp_opinion_opreason2;
		this.sp_opinion_opreason2_agree = sp_opinion_opreason2_agree;
		this.sp_opinion_opreason3 = sp_opinion_opreason3;
		this.sp_opinion_opreason3_agree = sp_opinion_opreason3_agree;
		this.sp_opinion_detail = sp_opinion_detail;
		this.sp_opinion_warning = sp_opinion_warning;
		this.sp_opinion_thumbup = sp_opinion_thumbup;
		this.sp_opinion_type = sp_opinion_type;
		this.sp_opinion_etc2 = sp_opinion_etc2;
		this.sp_opinion_etc3 = sp_opinion_etc3;
	}
	public Integer getSp_opinion_rcdno() {
		return sp_opinion_rcdno;
	}
	public void setSp_opinion_rcdno(Integer sp_opinion_rcdno) {
		this.sp_opinion_rcdno = sp_opinion_rcdno;
	}
	public Integer getSp_opinion_topicrcdno() {
		return sp_opinion_topicrcdno;
	}
	public void setSp_opinion_topicrcdno(Integer sp_opinion_topicrcdno) {
		this.sp_opinion_topicrcdno = sp_opinion_topicrcdno;
	}
	public String getSp_opinion_topictitle() {
		return sp_opinion_topictitle;
	}
	public void setSp_opinion_topictitle(String sp_opinion_topictitle) {
		this.sp_opinion_topictitle = sp_opinion_topictitle;
	}
	public Timestamp getSp_opinion_datetime() {
		return sp_opinion_datetime;
	}
	public void setSp_opinion_datetime(Timestamp sp_opinion_datetime) {
		this.sp_opinion_datetime = sp_opinion_datetime;
	}
	public Integer getSp_opinion_writer() {
		return sp_opinion_writer;
	}
	public void setSp_opinion_writer(Integer sp_opinion_writer) {
		this.sp_opinion_writer = sp_opinion_writer;
	}
	public String getSp_opinion_side() {
		return sp_opinion_side;
	}
	public void setSp_opinion_side(String sp_opinion_side) {
		this.sp_opinion_side = sp_opinion_side;
	}
	public String getSp_opinion_reason1() {
		return sp_opinion_reason1;
	}
	public void setSp_opinion_reason1(String sp_opinion_reason1) {
		this.sp_opinion_reason1 = sp_opinion_reason1;
	}
	public String getSp_opinion_reason2() {
		return sp_opinion_reason2;
	}
	public void setSp_opinion_reason2(String sp_opinion_reason2) {
		this.sp_opinion_reason2 = sp_opinion_reason2;
	}
	public String getSp_opinion_reason3() {
		return sp_opinion_reason3;
	}
	public void setSp_opinion_reason3(String sp_opinion_reason3) {
		this.sp_opinion_reason3 = sp_opinion_reason3;
	}
	public String getSp_opinion_opreason1() {
		return sp_opinion_opreason1;
	}
	public void setSp_opinion_opreason1(String sp_opinion_opreason1) {
		this.sp_opinion_opreason1 = sp_opinion_opreason1;
	}
	public Integer getSp_opinion_opreason1_agree() {
		return sp_opinion_opreason1_agree;
	}
	public void setSp_opinion_opreason1_agree(Integer sp_opinion_opreason1_agree) {
		this.sp_opinion_opreason1_agree = sp_opinion_opreason1_agree;
	}
	public String getSp_opinion_opreason2() {
		return sp_opinion_opreason2;
	}
	public void setSp_opinion_opreason2(String sp_opinion_opreason2) {
		this.sp_opinion_opreason2 = sp_opinion_opreason2;
	}
	public Integer getSp_opinion_opreason2_agree() {
		return sp_opinion_opreason2_agree;
	}
	public void setSp_opinion_opreason2_agree(Integer sp_opinion_opreason2_agree) {
		this.sp_opinion_opreason2_agree = sp_opinion_opreason2_agree;
	}
	public String getSp_opinion_opreason3() {
		return sp_opinion_opreason3;
	}
	public void setSp_opinion_opreason3(String sp_opinion_opreason3) {
		this.sp_opinion_opreason3 = sp_opinion_opreason3;
	}
	public Integer getSp_opinion_opreason3_agree() {
		return sp_opinion_opreason3_agree;
	}
	public void setSp_opinion_opreason3_agree(Integer sp_opinion_opreason3_agree) {
		this.sp_opinion_opreason3_agree = sp_opinion_opreason3_agree;
	}
	public String getSp_opinion_detail() {
		return sp_opinion_detail;
	}
	public void setSp_opinion_detail(String sp_opinion_detail) {
		this.sp_opinion_detail = sp_opinion_detail;
	}
	public Integer getSp_opinion_warning() {
		return sp_opinion_warning;
	}
	public void setSp_opinion_warning(Integer sp_opinion_warning) {
		this.sp_opinion_warning = sp_opinion_warning;
	}
	public Integer getSp_opinion_thumbup() {
		return sp_opinion_thumbup;
	}
	public void setSp_opinion_thumbup(Integer sp_opinion_thumbup) {
		this.sp_opinion_thumbup = sp_opinion_thumbup;
	}
	public String getSp_opinion_type() {
		return sp_opinion_type;
	}
	public void setSp_opinion_type(String sp_opinion_type) {
		this.sp_opinion_type = sp_opinion_type;
	}
	public String getSp_opinion_etc2() {
		return sp_opinion_etc2;
	}
	public void setSp_opinion_etc2(String sp_opinion_etc2) {
		this.sp_opinion_etc2 = sp_opinion_etc2;
	}
	public String getSp_opinion_etc3() {
		return sp_opinion_etc3;
	}
	public void setSp_opinion_etc3(String sp_opinion_etc3) {
		this.sp_opinion_etc3 = sp_opinion_etc3;
	}
	public userDTO getWriter_infomation() {
		return writer_infomation;
	}
	public void setWriter_infomation(userDTO writer_infomation) {
		this.writer_infomation = writer_infomation;
	}
	
	



}
