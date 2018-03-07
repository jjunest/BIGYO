package com.innovest.dao;

import java.util.List;
import java.util.Map;

import com.innovest.dto.Board;
import com.innovest.dto.BoardReply;

public interface BoardDao {
	
	int regContent(Map<String, Object> paramMap);
	
	int getContentCnt(Map<String, Object> paramMap);
	
	List<Board> getContentList(Map<String, Object> paramMap);
	
	Board getContentView(Map<String, Object> paramMap);
	
	int regReply(Map<String, Object> paramMap);
	
	List<BoardReply> getReplyList(Map<String, Object> paramMap);
	
	int delReply(Map<String, Object> paramMap);
	
	int getBoardCheck(Map<String, Object> paramMap);
	
	int delBoard(Map<String, Object> paramMap);
	
}
