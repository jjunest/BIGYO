package com.innovest.dtos;

public class Hos_DTO {
	Integer hos_rcdno;
	Integer hos_chk_rcdno;
	String hos_pic_link;
	public Hos_DTO(Integer hos_rcdno, Integer hos_chk_rcdno, String hos_pic_link) {
		super();
		this.hos_rcdno = hos_rcdno;
		this.hos_chk_rcdno = hos_chk_rcdno;
		this.hos_pic_link = hos_pic_link;
	}
	public Integer getHos_rcdno() {
		return hos_rcdno;
	}
	public void setHos_rcdno(Integer hos_rcdno) {
		this.hos_rcdno = hos_rcdno;
	}
	public Integer getHos_chk_rcdno() {
		return hos_chk_rcdno;
	}
	public void setHos_chk_rcdno(Integer hos_chk_rcdno) {
		this.hos_chk_rcdno = hos_chk_rcdno;
	}
	public String getHos_pic_link() {
		return hos_pic_link;
	}
	public void setHos_pic_link(String hos_pic_link) {
		this.hos_pic_link = hos_pic_link;
	}
	
	
}
