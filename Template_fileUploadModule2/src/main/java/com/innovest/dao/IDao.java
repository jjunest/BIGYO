package com.innovest.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.innovest.dto.MemberDto;


public interface IDao {
	
	public int mysqlCheck(String userid);

	public List<MemberDto> selectAllList();
	
	public int deleteDatabase(Integer cmd);
	
	public int insertDatabaseByMap(Map insertMap); 
	
	public int insertDatabaseByObj(MemberDto insertObj);
	
	public int updateDatabase (Integer cmd);
	
	
	
}
