package com.innovest.dtos;

import java.util.List;

public class ServPrice_DTO {
	Integer servprice_rcdno;
	Integer servprice_servinfo_rcdno;
	Integer servprice_price;
	List<ServAge_DTO> servageList;
	
	
	public ServPrice_DTO(Integer servprice_rcdno, Integer servprice_servinfo_rcdno, Integer servprice_price) {
		super();
		this.servprice_rcdno = servprice_rcdno;
		this.servprice_servinfo_rcdno = servprice_servinfo_rcdno;
		this.servprice_price = servprice_price;
	}
	public ServPrice_DTO(Integer servprice_rcdno, Integer servprice_servinfo_rcdno, Integer servprice_price,
			List<ServAge_DTO> servageList) {
		super();
		this.servprice_rcdno = servprice_rcdno;
		this.servprice_servinfo_rcdno = servprice_servinfo_rcdno;
		this.servprice_price = servprice_price;
		this.servageList = servageList;
	}
	public ServPrice_DTO(Integer servprice_servinfo_rcdno, Integer servprice_price, List<ServAge_DTO> servageList) {
		super();
		this.servprice_servinfo_rcdno = servprice_servinfo_rcdno;
		this.servprice_price = servprice_price;
		this.servageList = servageList;
	}
	public ServPrice_DTO(Integer servprice_servinfo_rcdno, Integer servprice_price) {
		super();
		this.servprice_servinfo_rcdno = servprice_servinfo_rcdno;
		this.servprice_price = servprice_price;
	}
	public Integer getServprice_rcdno() {
		return servprice_rcdno;
	}
	public void setServprice_rcdno(Integer servprice_rcdno) {
		this.servprice_rcdno = servprice_rcdno;
	}
	public Integer getServprice_servinfo_rcdno() {
		return servprice_servinfo_rcdno;
	}
	public void setServprice_servinfo_rcdno(Integer servprice_servinfo_rcdno) {
		this.servprice_servinfo_rcdno = servprice_servinfo_rcdno;
	}
	public Integer getServprice_price() {
		return servprice_price;
	}
	public void setServprice_price(Integer servprice_price) {
		this.servprice_price = servprice_price;
	}
	public List<ServAge_DTO> getServageList() {
		return servageList;
	}
	public void setServageList(List<ServAge_DTO> servageList) {
		this.servageList = servageList;
	}

	

}
