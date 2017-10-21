package com.innovest.dtos;

import java.sql.Timestamp;

public class Hos_DTO {
	// 파일일때 저장해야 할 것들 :
	/*
	 * IDX NUMBER, -> hos_rcdno BOARD_IDX NUMBER NOT NULL, -> hos_chk_rcdno
	 * ORIGINAL_FILE_NAME VARCHAR2(260 BYTE) NOT NULL, STORED_FILE_NAME VARCHAR2(36
	 * BYTE) NOT NULL, FILE_SIZE NUMBER, CREA_DTM DATE DEFAULT SYSDATE NOT NULL, ->
	 * 날짜는 나중에 저장 CREA_ID VARCHAR2(30 BYTE) NOT NULL, DEL_GB VARCHAR2(1 BYTE)
	 * DEFAULT 'N' NOT NULL, PRIMARY KEY (IDX)
	 */

	Integer hos_rcdno;
	Integer hos_chk_rcdno;
	String hos_pic_link;
	String hos_originalpic_name;
	String hos_storedpic_name;
	Integer hos_picsize;
	String hos_picStoreId;
	String hos_ifdeleted;
	Timestamp hos_create_datetime;

	public Hos_DTO(Integer hos_rcdno, Integer hos_chk_rcdno, String hos_pic_link, String hos_originalpic_name,
			String hos_storedpic_name, Integer hos_picsize, String hos_picStoreId, String hos_ifdeleted,
			Timestamp hos_create_datetime) {
		super();
		this.hos_rcdno = hos_rcdno;
		this.hos_chk_rcdno = hos_chk_rcdno;
		this.hos_pic_link = hos_pic_link;
		this.hos_originalpic_name = hos_originalpic_name;
		this.hos_storedpic_name = hos_storedpic_name;
		this.hos_picsize = hos_picsize;
		this.hos_picStoreId = hos_picStoreId;
		this.hos_ifdeleted = hos_ifdeleted;
		this.hos_create_datetime = hos_create_datetime;
	}

	public Hos_DTO(Integer hos_chk_rcdno, String hos_pic_link, String hos_originalpic_name, String hos_storedpic_name,
			Integer hos_picsize, String hos_picStoreId, String hos_ifdeleted, Timestamp hos_create_datetime) {
		super();
		this.hos_chk_rcdno = hos_chk_rcdno;
		this.hos_pic_link = hos_pic_link;
		this.hos_originalpic_name = hos_originalpic_name;
		this.hos_storedpic_name = hos_storedpic_name;
		this.hos_picsize = hos_picsize;
		this.hos_picStoreId = hos_picStoreId;
		this.hos_ifdeleted = hos_ifdeleted;
		this.hos_create_datetime = hos_create_datetime;
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

	public String getHos_originalpic_name() {
		return hos_originalpic_name;
	}

	public void setHos_originalpic_name(String hos_originalpic_name) {
		this.hos_originalpic_name = hos_originalpic_name;
	}

	public String getHos_storedpic_name() {
		return hos_storedpic_name;
	}

	public void setHos_storedpic_name(String hos_storedpic_name) {
		this.hos_storedpic_name = hos_storedpic_name;
	}

	public Integer getHos_picsize() {
		return hos_picsize;
	}

	public void setHos_picsize(Integer hos_picsize) {
		this.hos_picsize = hos_picsize;
	}

	public String getHos_picStoreId() {
		return hos_picStoreId;
	}

	public void setHos_picStoreId(String hos_picStoreId) {
		this.hos_picStoreId = hos_picStoreId;
	}

	public String getHos_ifdeleted() {
		return hos_ifdeleted;
	}

	public void setHos_ifdeleted(String hos_ifdeleted) {
		this.hos_ifdeleted = hos_ifdeleted;
	}

	public Timestamp getHos_create_datetime() {
		return hos_create_datetime;
	}

	public void setHos_create_datetime(Timestamp hos_create_datetime) {
		this.hos_create_datetime = hos_create_datetime;
	}

}
