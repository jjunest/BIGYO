package com.innovest.dto;

import java.math.BigDecimal;

public class ranking_group_DTO {

	String groupname;
	BigDecimal ranking_user_like;
	BigDecimal ranking_opinion_show_total;
	BigDecimal ranking_opinion_normal_total;
	BigDecimal ranking_thumbup_total;
	public ranking_group_DTO(String groupname, BigDecimal ranking_user_like,
			BigDecimal ranking_opinion_show_total, BigDecimal ranking_opinion_normal_total,
			BigDecimal ranking_thumbup_total) {
		super();
		this.groupname = groupname;
		this.ranking_user_like = ranking_user_like;
		this.ranking_opinion_show_total = ranking_opinion_show_total;
		this.ranking_opinion_normal_total = ranking_opinion_normal_total;
		this.ranking_thumbup_total = ranking_thumbup_total;
	}
	public String getGroupname() {
		return groupname;
	}
	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}
	public BigDecimal getRanking_user_like() {
		return ranking_user_like;
	}
	public void setRanking_user_like(BigDecimal ranking_user_like) {
		this.ranking_user_like = ranking_user_like;
	}
	public BigDecimal getRanking_opinion_show_total() {
		return ranking_opinion_show_total;
	}
	public void setRanking_opinion_show_total(BigDecimal ranking_opinion_show_total) {
		this.ranking_opinion_show_total = ranking_opinion_show_total;
	}
	public BigDecimal getRanking_opinion_normal_total() {
		return ranking_opinion_normal_total;
	}
	public void setRanking_opinion_normal_total(BigDecimal ranking_opinion_normal_total) {
		this.ranking_opinion_normal_total = ranking_opinion_normal_total;
	}
	public BigDecimal getRanking_thumbup_total() {
		return ranking_thumbup_total;
	}
	public void setRanking_thumbup_total(BigDecimal ranking_thumbup_total) {
		this.ranking_thumbup_total = ranking_thumbup_total;
	}
	
	
	
	
	
}
