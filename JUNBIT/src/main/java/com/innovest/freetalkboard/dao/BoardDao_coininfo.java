package com.innovest.freetalkboard.dao;

import java.util.List;
import java.util.Map;

import com.innovest.freetalkboard.domain.Board;
import com.innovest.freetalkboard.domain.BoardReply;
import com.innovest.freetalkboard.domain.BoardReply_coininfo;
import com.innovest.freetalkboard.domain.Board_coininfo;

public interface BoardDao_coininfo {
	
	int regContent(Map<String, Object> paramMap);
	
	int getContentCnt(Map<String, Object> paramMap);
	
	List<Board_coininfo> getContentList(Map<String, Object> paramMap);
	
	Board_coininfo getContentView(Map<String, Object> paramMap);
	
	int regReply(Map<String, Object> paramMap);
	
	List<BoardReply_coininfo> getReplyList(Map<String, Object> paramMap);
	
	int delReply(Map<String, Object> paramMap);
	
	int getBoardCheck(Map<String, Object> paramMap);
	
	int delBoard(Map<String, Object> paramMap);
	
	int goodPointPlusOne(Map<String, Object> paramMap);
}
