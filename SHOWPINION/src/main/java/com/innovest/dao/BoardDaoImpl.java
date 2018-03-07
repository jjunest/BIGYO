package com.innovest.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.innovest.dto.Board;
import com.innovest.dto.BoardReply;


@Repository("boardDao")
public class BoardDaoImpl implements BoardDao{
	
	public SqlSession sqlSession;

	public SqlSession getSqlsession() {
		return sqlSession;
	}

	public void setSqlsession(SqlSession sqlsession) {
		this.sqlSession = sqlsession;
	}
    
	@Override
	public int regContent(Map<String, Object> paramMap) {
		return sqlSession.insert("insertContent", paramMap);
	}

	@Override
	public int getContentCnt(Map<String, Object> paramMap) {
		return sqlSession.selectOne("selectContentCnt", paramMap);
	}
	
	@Override
	public List<Board> getContentList(Map<String, Object> paramMap) {
		return sqlSession.selectList("selectContent", paramMap);
	}

	@Override
	public Board getContentView(Map<String, Object> paramMap) {
		return sqlSession.selectOne("selectContentView", paramMap);
	}

	@Override
	public int regReply(Map<String, Object> paramMap) {
		return sqlSession.insert("insertBoardReply", paramMap);
	}

	@Override
	public List<BoardReply> getReplyList(Map<String, Object> paramMap) {
		List<BoardReply> boardReplyList = sqlSession.selectList("selectBoardReplyList", paramMap);

		//msyql ���� ������ ������ ������ ���⼭ �׳� �ذ�����

		//�θ�
		List<BoardReply> boardReplyListParent = new ArrayList<BoardReply>();
		//�ڽ�
		List<BoardReply> boardReplyListChild = new ArrayList<BoardReply>();
		//����
		List<BoardReply> newBoardReplyList = new ArrayList<BoardReply>();

		//1.�θ�� �ڽ� �и�
		for(BoardReply boardReply: boardReplyList){
			if(boardReply.getDepth().equals("0")){
				boardReplyListParent.add(boardReply);
			}else{
				boardReplyListChild.add(boardReply);
			}
		}

		//2.�θ� ������.
		for(BoardReply boardReplyParent: boardReplyListParent){
			//2-1. �θ�� ������ �ִ´�.
			newBoardReplyList.add(boardReplyParent);
			//3.�ڽ��� ������.
			for(BoardReply boardReplyChild: boardReplyListChild){
				//3-1. �θ��� �ڽ��� �͵鸸 �ִ´�.
				if(boardReplyParent.getReply_id().equals(boardReplyChild.getParent_id())){
					newBoardReplyList.add(boardReplyChild);
				}

			}

		}

		
		return newBoardReplyList;
	}

	@Override
	public int delReply(Map<String, Object> paramMap) {
		return sqlSession.delete("deleteBoardReply", paramMap);
	}

	@Override
	public int getBoardCheck(Map<String, Object> paramMap) {
		return sqlSession.selectOne("selectBoardCnt", paramMap);
	}

	@Override
	public int delBoard(Map<String, Object> paramMap) {
		return sqlSession.update("deleteBoard", paramMap);
	}

}
