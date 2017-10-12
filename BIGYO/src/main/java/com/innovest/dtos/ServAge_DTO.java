package com.innovest.dtos;

public class ServAge_DTO {
	Integer servage_rcdno;
	Integer servage_servinfo_rcdno;
	String servage_age;

	public ServAge_DTO(Integer servage_rcdno, Integer servage_servinfo_rcdno, String servage_age) {
		super();
		this.servage_rcdno = servage_rcdno;
		this.servage_servinfo_rcdno = servage_servinfo_rcdno;
		this.servage_age = servage_age;
	}

	public Integer getServage_rcdno() {
		return servage_rcdno;
	}

	public void setServage_rcdno(Integer servage_rcdno) {
		this.servage_rcdno = servage_rcdno;
	}

	public Integer getServage_servinfo_rcdno() {
		return servage_servinfo_rcdno;
	}

	public void setServage_servinfo_rcdno(Integer servage_servinfo_rcdno) {
		this.servage_servinfo_rcdno = servage_servinfo_rcdno;
	}

	public String getServage_age() {
		return servage_age;
	}

	public void setServage_age(String servage_age) {
		this.servage_age = servage_age;
	}

}
