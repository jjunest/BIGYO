package com.innovest.dtos;

import java.util.List;

public class Serv_DTO {

	// 파일일때 저장해야 할 것들 :
	/*
	 * IDX NUMBER, -> serv_rcdno BOARD_IDX NUMBER NOT NULL, -> serv_chk_rcdno
	 * ORIGINAL_FILE_NAME VARCHAR2(260 BYTE) NOT NULL, STORED_FILE_NAME VARCHAR2(36
	 * BYTE) NOT NULL, FILE_SIZE NUMBER, CREA_DTM DATE DEFAULT SYSDATE NOT NULL, ->
	 * 날짜는 나중에 저장 CREA_ID VARCHAR2(30 BYTE) NOT NULL, DEL_GB VARCHAR2(1 BYTE)
	 * DEFAULT 'N' NOT NULL, PRIMARY KEY (IDX)
	 */

	Integer serv_rcdno;
	Integer serv_chk_rcdno;
	String serv_pic_link;
	String serv_originalpic_name;
	String serv_storedpic_name;
	Integer serv_picsize;
	Integer serv_price; // serv_price 필드 사용
	String serv_target_age; // target_age 필드 사용 안함
	String serv_picStoreId;
	String serv_ifdeleted;
	String serv_create_date;
	List<ServAge_DTO> servageList;
	List<ServPrice_DTO> servpriceList;

	public Serv_DTO(Integer serv_rcdno, Integer serv_chk_rcdno, String serv_pic_link, String serv_originalpic_name,
			String serv_storedpic_name, Integer serv_picsize, Integer serv_price, String serv_target_age,
			String serv_picStoreId, String serv_ifdeleted, String serv_create_date) {
		super();
		this.serv_rcdno = serv_rcdno;
		this.serv_chk_rcdno = serv_chk_rcdno;
		this.serv_pic_link = serv_pic_link;
		this.serv_originalpic_name = serv_originalpic_name;
		this.serv_storedpic_name = serv_storedpic_name;
		this.serv_picsize = serv_picsize;
		this.serv_price = serv_price;
		this.serv_target_age = serv_target_age;
		this.serv_picStoreId = serv_picStoreId;
		this.serv_ifdeleted = serv_ifdeleted;
		this.serv_create_date = serv_create_date;
	}

	public Serv_DTO(Integer serv_chk_rcdno, String serv_pic_link, String serv_originalpic_name,
			String serv_storedpic_name, Integer serv_picsize, Integer serv_price, String serv_target_age,
			String serv_picStoreId, String serv_ifdeleted, String serv_create_date) {
		super();
		this.serv_chk_rcdno = serv_chk_rcdno;
		this.serv_pic_link = serv_pic_link;
		this.serv_originalpic_name = serv_originalpic_name;
		this.serv_storedpic_name = serv_storedpic_name;
		this.serv_picsize = serv_picsize;
		this.serv_price = serv_price;
		this.serv_target_age = serv_target_age;
		this.serv_picStoreId = serv_picStoreId;
		this.serv_ifdeleted = serv_ifdeleted;
		this.serv_create_date = serv_create_date;
	}

	public Serv_DTO(Integer serv_rcdno, Integer serv_chk_rcdno, String serv_pic_link, String serv_originalpic_name,
			String serv_storedpic_name, Integer serv_picsize, Integer serv_price, String serv_target_age,
			String serv_picStoreId, String serv_ifdeleted, String serv_create_date, List<ServAge_DTO> servageList,
			List<ServPrice_DTO> servpriceList) {
		super();
		this.serv_rcdno = serv_rcdno;
		this.serv_chk_rcdno = serv_chk_rcdno;
		this.serv_pic_link = serv_pic_link;
		this.serv_originalpic_name = serv_originalpic_name;
		this.serv_storedpic_name = serv_storedpic_name;
		this.serv_picsize = serv_picsize;
		this.serv_price = serv_price;
		this.serv_target_age = serv_target_age;
		this.serv_picStoreId = serv_picStoreId;
		this.serv_ifdeleted = serv_ifdeleted;
		this.serv_create_date = serv_create_date;
		this.servageList = servageList;
		this.servpriceList = servpriceList;
	}

	public Serv_DTO(Integer serv_chk_rcdno, String serv_pic_link, String serv_originalpic_name,
			String serv_storedpic_name, Integer serv_picsize, Integer serv_price, String serv_target_age,
			String serv_picStoreId, String serv_ifdeleted, String serv_create_date, List<ServAge_DTO> servageList,
			List<ServPrice_DTO> servpriceList) {
		super();
		this.serv_chk_rcdno = serv_chk_rcdno;
		this.serv_pic_link = serv_pic_link;
		this.serv_originalpic_name = serv_originalpic_name;
		this.serv_storedpic_name = serv_storedpic_name;
		this.serv_picsize = serv_picsize;
		this.serv_price = serv_price;
		this.serv_target_age = serv_target_age;
		this.serv_picStoreId = serv_picStoreId;
		this.serv_ifdeleted = serv_ifdeleted;
		this.serv_create_date = serv_create_date;
		this.servageList = servageList;
		this.servpriceList = servpriceList;
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

	public String getServ_originalpic_name() {
		return serv_originalpic_name;
	}

	public void setServ_originalpic_name(String serv_originalpic_name) {
		this.serv_originalpic_name = serv_originalpic_name;
	}

	public String getServ_storedpic_name() {
		return serv_storedpic_name;
	}

	public void setServ_storedpic_name(String serv_storedpic_name) {
		this.serv_storedpic_name = serv_storedpic_name;
	}

	public Integer getServ_picsize() {
		return serv_picsize;
	}

	public void setServ_picsize(Integer serv_picsize) {
		this.serv_picsize = serv_picsize;
	}

	public Integer getServ_price() {
		return serv_price;
	}

	public void setServ_price(Integer serv_price) {
		this.serv_price = serv_price;
	}

	public String getServ_target_age() {
		return serv_target_age;
	}

	public void setServ_target_age(String serv_target_age) {
		this.serv_target_age = serv_target_age;
	}

	public String getServ_picStoreId() {
		return serv_picStoreId;
	}

	public void setServ_picStoreId(String serv_picStoreId) {
		this.serv_picStoreId = serv_picStoreId;
	}

	public String getServ_ifdeleted() {
		return serv_ifdeleted;
	}

	public void setServ_ifdeleted(String serv_ifdeleted) {
		this.serv_ifdeleted = serv_ifdeleted;
	}

	public String getServ_create_date() {
		return serv_create_date;
	}

	public void setServ_create_date(String serv_create_date) {
		this.serv_create_date = serv_create_date;
	}

	public List<ServAge_DTO> getServageList() {
		return servageList;
	}

	public void setServageList(List<ServAge_DTO> servageList) {
		this.servageList = servageList;
	}

	public List<ServPrice_DTO> getServpriceList() {
		return servpriceList;
	}

	public void setServpriceList(List<ServPrice_DTO> servpriceList) {
		this.servpriceList = servpriceList;
	}

}
