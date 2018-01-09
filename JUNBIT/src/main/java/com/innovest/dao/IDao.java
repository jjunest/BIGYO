package com.innovest.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import com.innovest.dto.MemberDto;
import com.innovest.dto.calendarDTO;
import com.innovest.dto.userDTO;

public interface IDao {

	public int mysqlCheck(String userid);

	public List<MemberDto> selectAllList();

	public int deleteDatabase(Integer cmd);

	public int insertDatabaseByMap(Map insertMap);

	public int insertDatabaseByObj(MemberDto insertObj);

	public int updateDatabase(Integer cmd);

	public int duplicateIdCheck(String user_inputId);

	public int insertNewUserIntoDatabaseByObj(userDTO insertObj);
	
	public int insertUserRoleIntoDatabaseByMap(Map insertMap);
	
	public userDTO passwordCheck(Map insertMap);
	
	public int insertCalendarByObj(calendarDTO targetObj);

	public List<calendarDTO> selectAllCalendar();
}
