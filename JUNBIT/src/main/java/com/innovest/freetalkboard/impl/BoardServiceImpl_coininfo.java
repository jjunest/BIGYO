package com.innovest.freetalkboard.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.innovest.freetalkboard.dao.BoardDao;
import com.innovest.freetalkboard.dao.BoardDao_coininfo;
import com.innovest.freetalkboard.domain.Board;
import com.innovest.freetalkboard.domain.BoardReply;
import com.innovest.freetalkboard.domain.BoardReply_coininfo;
import com.innovest.freetalkboard.domain.Board_coininfo;
import com.innovest.freetalkboard.service.BoardService;
import com.innovest.freetalkboard.service.BoardService_coininfo;

@Service("boardService_coininfo")
public class BoardServiceImpl_coininfo implements BoardService_coininfo {

	@Resource(name="boardDao_coininfo")
	private BoardDao_coininfo boardDao;

	@Override
	public int regContent(Map<String, Object> paramMap) {
		return boardDao.regContent(paramMap);
	}

	@Override
	public int getContentCnt(Map<String, Object> paramMap) {
		return boardDao.getContentCnt(paramMap);
	}

	@Override
	public List<Board_coininfo> getContentList(Map<String, Object> paramMap) {
		return boardDao.getContentList(paramMap);
	}

	@Override
	public Board_coininfo getContentView(Map<String, Object> paramMap) {
		return boardDao.getContentView(paramMap);
	}

	@Override
	public int regReply(Map<String, Object> paramMap) {
		return boardDao.regReply(paramMap);
	}

	@Override
	public List<BoardReply_coininfo> getReplyList(Map<String, Object> paramMap) {

		List<BoardReply_coininfo> boardReplyList = boardDao.getReplyList(paramMap);

		//msyql ���� ������ ������ ������ ���⼭ �׳� �ذ�����

		//�θ�
		List<BoardReply_coininfo> boardReplyListParent = new ArrayList<BoardReply_coininfo>();
		//�ڽ�
		List<BoardReply_coininfo> boardReplyListChild = new ArrayList<BoardReply_coininfo>();
		//����
		List<BoardReply_coininfo> newBoardReplyList = new ArrayList<BoardReply_coininfo>();

		//1.�θ�� �ڽ� �и�
		for(BoardReply_coininfo boardReply: boardReplyList){
			if(boardReply.getDepth().equals("0")){
				boardReplyListParent.add(boardReply);
			}else{
				boardReplyListChild.add(boardReply);
			}
		}

		//2.�θ� ������.
		for(BoardReply_coininfo boardReplyParent: boardReplyListParent){
			//2-1. �θ�� ������ �ִ´�.
			newBoardReplyList.add(boardReplyParent);
			//3.�ڽ��� ������.
			for(BoardReply_coininfo boardReplyChild: boardReplyListChild){
				//3-1. �θ��� �ڽ��� �͵鸸 �ִ´�.
				if(boardReplyParent.getReply_id().equals(boardReplyChild.getParent_id())){
					newBoardReplyList.add(boardReplyChild);
				}

			}

		}

		//������ list return
		return newBoardReplyList;
	}

	@Override
	public int delReply(Map<String, Object> paramMap) {
		return boardDao.delReply(paramMap);
	}

	@Override
	public int getBoardCheck(Map<String, Object> paramMap) {
		return boardDao.getBoardCheck(paramMap);
	}

	@Override
	public int delBoard(Map<String, Object> paramMap) {
		return boardDao.delBoard(paramMap);
	}

	@Override
	public int test() {
		return 10;
	}
	@Override
	public int goodPointPlusOne(Map<String, Object> paramMap) {
		return boardDao.goodPointPlusOne(paramMap);
	}
	

}
