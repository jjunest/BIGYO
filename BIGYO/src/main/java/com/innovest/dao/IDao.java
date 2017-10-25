package com.innovest.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.innovest.dto.HospitalDto_Test;
import com.innovest.dto.HospitalDto_Test_Detail;
import com.innovest.dto.MemberDto;

public interface IDao {

	public int mysqlCheck(String userid);

	public List<MemberDto> selectAllList();

	public int deleteDatabase(Integer cmd);

	public int insertDatabaseByMap(Map insertMap);

	public int insertDatabaseByObj(MemberDto insertObj);

	public int updateDatabase(Integer cmd);

	public int insertPublicData_Test(HospitalDto_Test public_insertObj);

	public int insertPublicData_Test_Detail(HospitalDto_Test_Detail public_insertObj);

	public List<HospitalDto_Test> selectAllhosDTO(int offset);
	
	public HospitalDto_Test_Detail selectDetailHosInfo(String hmcNo);
	
	public HospitalDto_Test selectBasicInfo(String hmcNo);
	


}
