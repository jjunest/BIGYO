package com.innovest.dtos;

public class ServAge_DTO {
	Integer servage_rcdno;
	Integer servage_servprice_rcdno;
	String servage_age;
	

	public ServAge_DTO(Integer servage_servprice_rcdno, String servage_age) {
		super();
		this.servage_servprice_rcdno = servage_servprice_rcdno;
		this.servage_age = servage_age;
	}

	public ServAge_DTO(Integer servage_rcdno, Integer servage_servprice_rcdno, String servage_age) {
		super();
		this.servage_rcdno = servage_rcdno;
		this.servage_servprice_rcdno = servage_servprice_rcdno;
		this.servage_age = servage_age;
	}

	public Integer getServage_rcdno() {
		return servage_rcdno;
	}

	public void setServage_rcdno(Integer servage_rcdno) {
		this.servage_rcdno = servage_rcdno;
	}

	public Integer getservage_servprice_rcdno() {
		return servage_servprice_rcdno;
	}

	public void setservage_servprice_rcdno(Integer servage_servprice_rcdno) {
		this.servage_servprice_rcdno = servage_servprice_rcdno;
	}

	public String getServage_age() {
		return servage_age;
	}

	public void setServage_age(String servage_age) {
		this.servage_age = servage_age;
	}

}
