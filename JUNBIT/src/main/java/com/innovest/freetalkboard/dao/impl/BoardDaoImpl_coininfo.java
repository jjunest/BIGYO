package com.innovest.freetalkboard.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.innovest.freetalkboard.dao.BoardDao;
import com.innovest.freetalkboard.dao.BoardDao_coininfo;
import com.innovest.freetalkboard.domain.Board;
import com.innovest.freetalkboard.domain.BoardReply;
import com.innovest.freetalkboard.domain.BoardReply_coininfo;
import com.innovest.freetalkboard.domain.Board_coininfo;

@Repository("boardDao_coininfo")
public class BoardDaoImpl_coininfo implements BoardDao_coininfo{
	
	@Autowired
    private SqlSession sqlSession;
 
    public void setSqlSession(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }
    
	@Override
	public int regContent(Map<String, Object> paramMap) {
		return sqlSession.insert("com.innovest.freetalkboard.dao.BoardDao_coininfo.insertContent", paramMap);
	}

	@Override
	public int getContentCnt(Map<String, Object> paramMap) {
		return sqlSession.selectOne("com.innovest.freetalkboard.dao.BoardDao_coininfo.selectContentCnt", paramMap);
	}
	
	@Override
	public List<Board_coininfo> getContentList(Map<String, Object> paramMap) {
		return sqlSession.selectList("com.innovest.freetalkboard.dao.BoardDao_coininfo.selectContent", paramMap);
	}

	@Override
	public Board_coininfo getContentView(Map<String, Object> paramMap) {
		return sqlSession.selectOne("com.innovest.freetalkboard.dao.BoardDao_coininfo.selectContentView", paramMap);
	}

	@Override
	public int regReply(Map<String, Object> paramMap) {
		return sqlSession.insert("com.innovest.freetalkboard.dao.BoardDao_coininfo.insertBoardReply", paramMap);
	}

	@Override
	public List<BoardReply_coininfo> getReplyList(Map<String, Object> paramMap) {
		return sqlSession.selectList("com.innovest.freetalkboard.dao.BoardDao_coininfo.selectBoardReplyList", paramMap);
	}

	@Override
	public int delReply(Map<String, Object> paramMap) {
		return sqlSession.delete("com.innovest.freetalkboard.dao.BoardDao_coininfo.deleteBoardReply", paramMap);
	}

	@Override
	public int getBoardCheck(Map<String, Object> paramMap) {
		return sqlSession.selectOne("com.innovest.freetalkboard.dao.BoardDao_coininfo.selectBoardCnt", paramMap);
	}

	@Override
	public int delBoard(Map<String, Object> paramMap) {
		return sqlSession.delete("com.innovest.freetalkboard.dao.BoardDao_coininfo.deleteBoard", paramMap);
	}

	@Override
	public int goodPointPlusOne(Map<String, Object> paramMap) {
		return sqlSession.update("com.innovest.freetalkboard.dao.BoardDao_coininfo.goodPointPlusOne", paramMap);
	}

}
