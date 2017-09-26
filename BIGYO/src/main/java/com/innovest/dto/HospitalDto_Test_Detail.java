package com.innovest.dto;

public class HospitalDto_Test_Detail {
	public int rcdno;
	String hmcNo;
	String buildingName;
	String buildingHo;
	String gunmulFl;
	String cityBusStopName;
	String cityBusStopInfo;
	String subwayStopName;
	String subwayInfo;
	String subwayDirect;
	String villageBusStopName;
	String villageBusInfo;

	public HospitalDto_Test_Detail(String hmcNo, String buildingName, String buildingHo, String gunmulFl,
			String cityBusStopName, String cityBusStopInfo, String subwayStopName, String subwayInfo,
			String subwayDirect, String villageBusStopName, String villageBusInfo) {
		super();
		this.hmcNo = hmcNo;
		this.buildingName = buildingName;
		this.buildingHo = buildingHo;
		this.gunmulFl = gunmulFl;
		this.cityBusStopName = cityBusStopName;
		this.cityBusStopInfo = cityBusStopInfo;
		this.subwayStopName = subwayStopName;
		this.subwayInfo = subwayInfo;
		this.subwayDirect = subwayDirect;
		this.villageBusStopName = villageBusStopName;
		this.villageBusInfo = villageBusInfo;
	}

	public int getRcdno() {
		return rcdno;
	}

	public void setRcdno(int rcdno) {
		this.rcdno = rcdno;
	}

	public String getHmcNo() {
		return hmcNo;
	}

	public void setHmcNo(String hmcNo) {
		this.hmcNo = hmcNo;
	}

	public String getBuildingName() {
		return buildingName;
	}

	public void setBuildingName(String buildingName) {
		this.buildingName = buildingName;
	}

	public String getBuildingHo() {
		return buildingHo;
	}

	public void setBuildingHo(String buildingHo) {
		this.buildingHo = buildingHo;
	}

	public String getGunmulFl() {
		return gunmulFl;
	}

	public void setGunmulFl(String gunmulFl) {
		this.gunmulFl = gunmulFl;
	}

	public String getCityBusStopName() {
		return cityBusStopName;
	}

	public void setCityBusStopName(String cityBusStopName) {
		this.cityBusStopName = cityBusStopName;
	}

	public String getCityBusStopInfo() {
		return cityBusStopInfo;
	}

	public void setCityBusStopInfo(String cityBusStopInfo) {
		this.cityBusStopInfo = cityBusStopInfo;
	}

	public String getSubwayStopName() {
		return subwayStopName;
	}

	public void setSubwayStopName(String subwayStopName) {
		this.subwayStopName = subwayStopName;
	}

	public String getSubwayInfo() {
		return subwayInfo;
	}

	public void setSubwayInfo(String subwayInfo) {
		this.subwayInfo = subwayInfo;
	}

	public String getSubwayDirect() {
		return subwayDirect;
	}

	public void setSubwayDirect(String subwayDirect) {
		this.subwayDirect = subwayDirect;
	}

	public String getVillageBusStopName() {
		return villageBusStopName;
	}

	public void setVillageBusStopName(String villageBusStopName) {
		this.villageBusStopName = villageBusStopName;
	}

	public String getVillageBusInfo() {
		return villageBusInfo;
	}

	public void setVillageBusInfo(String villageBusInfo) {
		this.villageBusInfo = villageBusInfo;
	}

}
