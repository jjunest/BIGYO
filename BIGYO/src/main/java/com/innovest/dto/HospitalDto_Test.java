package com.innovest.dto;

public class HospitalDto_Test {

	public String hmcNm;
	public String hmcNo;
	public String hmcTelNo;
	public String locAddr;
	public String locPostNo;
	public String cxVl;
	public String cyVl;
	public String exmdrFaxNo;
	public String siDoCd;
	public String siGunGuCd;
	public String columnTest;
	
	

	public HospitalDto_Test(String hmcNm, String hmcNo, String hmcTelNo, String locAddr, String locPostNo, String cxVl,
			String cyVl, String exmdrFaxNo, String siDoCd, String siGunGuCd, String columnTest) {
		super();
		this.hmcNm = hmcNm;
		this.hmcNo = hmcNo;
		this.hmcTelNo = hmcTelNo;
		this.locAddr = locAddr;
		this.locPostNo = locPostNo;
		this.cxVl = cxVl;
		this.cyVl = cyVl;
		this.exmdrFaxNo = exmdrFaxNo;
		this.siDoCd = siDoCd;
		this.siGunGuCd = siGunGuCd;
		this.columnTest = columnTest;
	}

	public HospitalDto_Test(String hmcNm, String hmcNo, String hmcTelNo, String locAddr, String locPostNo, String cxVl,
			String cyVl, String exmdrFaxNo, String siDoCd, String siGunGuCd) {
		super();
		this.hmcNm = hmcNm;
		this.hmcNo = hmcNo;
		this.hmcTelNo = hmcTelNo;
		this.locAddr = locAddr;
		this.locPostNo = locPostNo;
		this.cxVl = cxVl;
		this.cyVl = cyVl;
		this.exmdrFaxNo = exmdrFaxNo;
		this.siDoCd = siDoCd;
		this.siGunGuCd = siGunGuCd;
	}

	public String getHmcNm() {
		return hmcNm;
	}

	public void setHmcNm(String hmcNm) {
		this.hmcNm = hmcNm;
	}

	public String gethmcNo() {
		return hmcNo;
	}

	public void sethmcNo(String hmcNo) {
		this.hmcNo = hmcNo;
	}

	public String getHmcTelNo() {
		return hmcTelNo;
	}

	public void setHmcTelNo(String hmcTelNo) {
		this.hmcTelNo = hmcTelNo;
	}

	public String getLocAddr() {
		return locAddr;
	}

	public void setLocAddr(String locAddr) {
		this.locAddr = locAddr;
	}

	public String getLocPostNo() {
		return locPostNo;
	}

	public void setLocPostNo(String locPostNo) {
		this.locPostNo = locPostNo;
	}

	public String getCxVl() {
		return cxVl;
	}

	public void setCxVl(String cxVl) {
		this.cxVl = cxVl;
	}

	public String getCyVl() {
		return cyVl;
	}

	public void setCyVl(String cyVl) {
		this.cyVl = cyVl;
	}

	public String getExmdrFaxNo() {
		return exmdrFaxNo;
	}

	public void setExmdrFaxNo(String exmdrFaxNo) {
		this.exmdrFaxNo = exmdrFaxNo;
	}

	public String getsiDoCd() {
		return siDoCd;
	}

	public void setsiDoCd(String siDoCd) {
		this.siDoCd = siDoCd;
	}

	public String getSiGunGuCd() {
		return siGunGuCd;
	}

	public void setSiGunGuCd(String siGunGuCd) {
		this.siGunGuCd = siGunGuCd;
	}

}
