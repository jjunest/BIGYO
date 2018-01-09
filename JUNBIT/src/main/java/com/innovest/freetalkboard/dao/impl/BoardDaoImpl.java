package com.innovest.freetalkboard.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.innovest.freetalkboard.dao.BoardDao;
import com.innovest.freetalkboard.domain.Board;
import com.innovest.freetalkboard.domain.BoardReply;

@Repository("boardDao")
public class BoardDaoImpl implements BoardDao{
	
	@Autowired
    private SqlSession sqlSession;
 
    public void setSqlSession(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }
    
	@Override
	public int regContent(Map<String, Object> paramMap) {
		return sqlSession.insert("com.innovest.freetalkboard.dao.BoardDao.insertContent", paramMap);
	}

	@Override
	public int getContentCnt(Map<String, Object> paramMap) {
		return sqlSession.selectOne("com.innovest.freetalkboard.dao.BoardDao.selectContentCnt", paramMap);
	}
	
	@Override
	public List<Board> getContentList(Map<String, Object> paramMap) {
		return sqlSession.selectList("com.innovest.freetalkboard.dao.BoardDao.selectContent", paramMap);
	}

	@Override
	public Board getContentView(Map<String, Object> paramMap) {
		return sqlSession.selectOne("com.innovest.freetalkboard.dao.BoardDao.selectContentView", paramMap);
	}

	@Override
	public int regReply(Map<String, Object> paramMap) {
		return sqlSession.insert("com.innovest.freetalkboard.dao.BoardDao.insertBoardReply", paramMap);
	}

	@Override
	public List<BoardReply> getReplyList(Map<String, Object> paramMap) {
		return sqlSession.selectList("com.innovest.freetalkboard.dao.BoardDao.selectBoardReplyList", paramMap);
	}

	@Override
	public int delReply(Map<String, Object> paramMap) {
		return sqlSession.delete("com.innovest.freetalkboard.dao.BoardDao.deleteBoardReply", paramMap);
	}

	@Override
	public int getBoardCheck(Map<String, Object> paramMap) {
		return sqlSession.selectOne("com.innovest.freetalkboard.dao.BoardDao.selectBoardCnt", paramMap);
	}

	@Override
	public int delBoard(Map<String, Object> paramMap) {
		return sqlSession.delete("com.innovest.freetalkboard.dao.BoardDao.deleteBoard", paramMap);
	}

	@Override
	public int goodPointPlusOne(Map<String, Object> paramMap) {
		return sqlSession.update("com.innovest.freetalkboard.dao.BoardDao.goodPointPlusOne", paramMap);
	}

}
