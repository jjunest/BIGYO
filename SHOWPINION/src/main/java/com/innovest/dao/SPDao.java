package com.innovest.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.innovest.dto.tvTopic_DTO;
import com.innovest.dto.userDTO;

public class SPDao {

	public SqlSession sqlsession;

	public SqlSession getSqlsession() {
		return sqlsession;
	}

	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	public int duplicateIdCheck(String user_inputId) {
		IDao dao = sqlsession.getMapper(IDao.class);
		int result = dao.duplicateIdCheck(user_inputId);
		return result;
	}

	public int insert_user_ByObj(userDTO userDTO) {
		IDao dao = sqlsession.getMapper(IDao.class);
		int result = dao.insert_user_ByObj(userDTO);
		return result;
	}

	public int insert_userrole_byMap(Map Map) {
		IDao dao = sqlsession.getMapper(IDao.class);
		int result = dao.insert_userrole_byMap(Map);
		return result;
	}

	public int insertTVShowTopic(Map Map) {
		IDao dao = sqlsession.getMapper(IDao.class);
		int result = dao.insertTVShowTopic(Map);
		return result;
	}

	public List<tvTopic_DTO> selectAll_TVshow_TopicDTO() {
		IDao dao = sqlsession.getMapper(IDao.class);
		List<tvTopic_DTO> result = dao.selectAll_TVshow_TopicDTO();
		return result;
	}

	public tvTopic_DTO selectOne_TvTopic(Map Map) {
		IDao dao = sqlsession.getMapper(IDao.class);
		tvTopic_DTO result = dao.selectOne_TvTopic(Map);
		return result;
	}
}
