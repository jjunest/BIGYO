package com.innovest.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.innovest.dto.MemberDto;
import com.innovest.dto.calendarDTO;
import com.innovest.dto.userDTO;

public class CalendarDao {

	public SqlSession sqlsession;

	public SqlSession getSqlsession() {
		return sqlsession;
	}

	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	public int insertCalendarByObj(calendarDTO targetObj) {
		System.out.println("this is insertDatabaseByObjMethod() Started");
		IDao dao = sqlsession.getMapper(IDao.class);
		int insertByObj_result = dao.insertCalendarByObj(targetObj);
		return insertByObj_result;
	}
	
	public List<calendarDTO> selectAllCalendar(){
		System.out.println("this is selectAllCalendar() Started");
		IDao dao = sqlsession.getMapper(IDao.class);
		List<calendarDTO> result = dao.selectAllCalendar();
		return result;
	}

}
