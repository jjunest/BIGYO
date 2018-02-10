package com.innovest.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.innovest.dto.Board;
import com.innovest.dto.BoardReply;
import com.innovest.dto.opinion_DTO;
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

	public int update_DetailViewNumber(Map Map) {
		IDao dao = sqlsession.getMapper(IDao.class);
		int result = dao.update_DetailViewNumber(Map);
		return result;
	}
	
	//opinion mapper 시작 
	public int insertOpinion(Map Map) {
		IDao dao = sqlsession.getMapper(IDao.class);
		int result = dao.insertOpinion(Map);
		return result;
	}

	public opinion_DTO selectOpinionDetail(Map Map) {
		IDao dao = sqlsession.getMapper(IDao.class);
		opinion_DTO result = dao.selectOpinionDetail(Map);
		return result;
	}
	
	public List<opinion_DTO> selectAll_opinion_normal(Map Map) {
		IDao dao = sqlsession.getMapper(IDao.class);
		List<opinion_DTO> result = dao.selectAll_opinion_normal(Map);
		return result;
	}
	
	public List<opinion_DTO> selectAll_opinion_show(Map Map) {
		IDao dao = sqlsession.getMapper(IDao.class);
		List<opinion_DTO> result = dao.selectAll_opinion_show(Map);
		return result;
	}
	
	//board TEST dao
	
	public int regContent(Map<String, Object> paramMap) {
		return sqlsession.insert("insertContent", paramMap);
	}

	public int getContentCnt(Map<String, Object> paramMap) {
		return sqlsession.selectOne("selectContentCnt", paramMap);
	}
	
	public List<Board> getContentList(Map<String, Object> paramMap) {
		return sqlsession.selectList("selectContent", paramMap);
	}

	public Board getContentView(Map<String, Object> paramMap) {
		return sqlsession.selectOne("selectContentView", paramMap);
	}

	public int regReply(Map<String, Object> paramMap) {
		return sqlsession.insert("insertBoardReply", paramMap);
	}

	public List<BoardReply> getReplyList(Map<String, Object> paramMap) {
		return sqlsession.selectList("selectBoardReplyList", paramMap);
	}

	public int delReply(Map<String, Object> paramMap) {
		return sqlsession.delete("deleteBoardReply", paramMap);
	}

	public int getBoardCheck(Map<String, Object> paramMap) {
		return sqlsession.selectOne("selectBoardCnt", paramMap);
	}

	public int delBoard(Map<String, Object> paramMap) {
		return sqlsession.delete("deleteBoard", paramMap);
	}

}
