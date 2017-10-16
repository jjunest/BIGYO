package com.innovest.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.innovest.dto.MemberDto;

public class MemberDao {

	public SqlSession sqlsession;
	private static final String mapper = "mappers.memberMapper.";

	public SqlSession getSqlsession() {
		return sqlsession;
	}

	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	public int mysqlCheck(String userid) {

		int result = sqlsession.selectOne(mapper + "mysqlCheck", userid);
		return result;
	}

	public List<MemberDto> select_allList() {

		List<MemberDto> searchResult = sqlsession.selectList(mapper + "select_allList");
		return searchResult;
	}

	public void insertTest(Map<String, Object> parms) {

		int insert_result = sqlsession.insert(mapper + "insertTest", parms);
		System.out.println("insertbyMapper success and insert_result :" + insert_result);
	}

	public void insertTestbyObj(MemberDto insertNewObj) {
		int insert_result = sqlsession.insert(mapper + "insertTestbyObj", insertNewObj);
		System.out.println("insertbyObj success and insert_result :" + insert_result);
	}

	public void updateTest(Map<String, Object> parms) {
		int update_result = sqlsession.update(mapper+"updateDatabase", parms);
		System.out.println("updateTest and update_result : "+update_result);
	}

	public void deleteTest(Integer deletenum) {
		int delete_result = sqlsession.update(mapper+"deleteDatabase", deletenum);
		System.out.println("deleteTest and delete_result : "+delete_result);
	}

}
