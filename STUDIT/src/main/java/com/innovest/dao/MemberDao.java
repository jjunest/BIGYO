package com.innovest.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.innovest.dto.questionDTO;

public class MemberDao {

	public SqlSession sqlsession;

	public SqlSession getSqlsession() {
		return sqlsession;
	}

	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	public int insertQuestionByObj(questionDTO insertDTO) {
		IDao dao = sqlsession.getMapper(IDao.class);
		int result = dao.insertQuestionByObj(insertDTO);
		return result;
	}

	public List<questionDTO> selectAllList() {
		IDao dao = sqlsession.getMapper(IDao.class);
		List<questionDTO> resultList = dao.selectAllList();
		return resultList;
	}

}
