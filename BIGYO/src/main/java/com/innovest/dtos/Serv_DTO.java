package com.innovest.dtos;

import java.util.List;

public class Serv_DTO {
	Integer serv_rcdno;
	Integer serv_chk_rcdno;
	String serv_pic_link;
	String serv_price;
	String serv_target_age;
	List<ServAge_DTO> servageList;

	public Serv_DTO(Integer serv_rcdno, Integer serv_chk_rcdno, String serv_pic_link, String serv_price,
			String serv_target_age, List<ServAge_DTO> servageList) {
		super();
		this.serv_rcdno = serv_rcdno;
		this.serv_chk_rcdno = serv_chk_rcdno;
		this.serv_pic_link = serv_pic_link;
		this.serv_price = serv_price;
		this.serv_target_age = serv_target_age;
		this.servageList = servageList;
	}

	public Serv_DTO(Integer serv_rcdno, Integer serv_chk_rcdno, String serv_pic_link, String serv_price,
			String serv_target_age) {
		super();
		this.serv_rcdno = serv_rcdno;
		this.serv_chk_rcdno = serv_chk_rcdno;
		this.serv_pic_link = serv_pic_link;
		this.serv_price = serv_price;
		this.serv_target_age = serv_target_age;
	}

	public Integer getServ_rcdno() {
		return serv_rcdno;
	}

	public void setServ_rcdno(Integer serv_rcdno) {
		this.serv_rcdno = serv_rcdno;
	}

	public Integer getServ_chk_rcdno() {
		return serv_chk_rcdno;
	}

	public void setServ_chk_rcdno(Integer serv_chk_rcdno) {
		this.serv_chk_rcdno = serv_chk_rcdno;
	}

	public String getServ_pic_link() {
		return serv_pic_link;
	}

	public void setServ_pic_link(String serv_pic_link) {
		this.serv_pic_link = serv_pic_link;
	}

	public String getServ_price() {
		return serv_price;
	}

	public void setServ_price(String serv_price) {
		this.serv_price = serv_price;
	}

	public String getServ_target_age() {
		return serv_target_age;
	}

	public void setServ_target_age(String serv_target_age) {
		this.serv_target_age = serv_target_age;
	}

	public List<ServAge_DTO> getServageList() {
		return servageList;
	}

	public void setServageList(List<ServAge_DTO> servageList) {
		this.servageList = servageList;
	}

}
