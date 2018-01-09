package com.innovest.freetalkboard.service;

import java.util.List;
import java.util.Map;

import com.innovest.freetalkboard.domain.Board;
import com.innovest.freetalkboard.domain.BoardReply;

public interface BoardService {
	
	int regContent(Map<String, Object> paramMap);
	
	int getContentCnt(Map<String, Object> paramMap);
	
	List<Board> getContentList(Map<String, Object> paramMap);
	
	Board getContentView(Map<String, Object> paramMap);
	
	int regReply(Map<String, Object> paramMap);
	
	List<BoardReply> getReplyList(Map<String, Object> paramMap);
	
	int delReply(Map<String, Object> paramMap);
	
	int getBoardCheck(Map<String, Object> paramMap);
	
	int delBoard(Map<String, Object> paramMap);
	
	int test();
	
	int goodPointPlusOne(Map<String, Object> paramMap);
	
}
