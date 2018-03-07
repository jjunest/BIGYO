package com.innovest.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.innovest.dto.BoardReply;
import com.innovest.dto.reportDTO;

public class meDao {

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

	public int insert_user_ByMap(Map Map) {
		IDao dao = sqlsession.getMapper(IDao.class);
		int result = dao.insert_user_ByMap(Map);
		return result;
	}

	public int insert_userrole_byMap(Map Map) {
		IDao dao = sqlsession.getMapper(IDao.class);
		int result = dao.insert_userrole_byMap(Map);
		return result;
	}

	public int insert_report_ByMap(Map Map) {
		IDao dao = sqlsession.getMapper(IDao.class);
		int result = dao.insert_report_ByMap(Map);
		return result;
	}
	public int update_report_ByMap(Map Map) {
		IDao dao = sqlsession.getMapper(IDao.class);
		int result = dao.update_report_ByMap(Map);
		return result;
	}
	public int report_delete(Map Map) {
		IDao dao = sqlsession.getMapper(IDao.class);
		int result = dao.report_delete(Map);
		return result;
	}
	
	public int report_thumbup_already(Map Map){
		IDao dao = sqlsession.getMapper(IDao.class);
		int result = dao.report_thumbup_already(Map);
		return result;
	}
	public int report_thumbup(Map Map){
		IDao dao = sqlsession.getMapper(IDao.class);
		int result = dao.report_thumbup(Map);
		return result;
	}
	public int report_thumbup_plusone(Map Map){
		IDao dao = sqlsession.getMapper(IDao.class);
		int result = dao.report_thumbup_plusone(Map);
		return result;
	}
	public int report_warning_already(Map Map){
		IDao dao = sqlsession.getMapper(IDao.class);
		int result = dao.report_warning_already(Map);
		return result;
	}
	public int report_warning(Map Map){
		IDao dao = sqlsession.getMapper(IDao.class);
		int result = dao.report_warning(Map);
		return result;
	}
	public int report_warning_plusone(Map Map){
		IDao dao = sqlsession.getMapper(IDao.class);
		int result = dao.report_warning_plusone(Map);
		return result;
	}
	
	public List<reportDTO> report_select_articlelist(Map Map) {
		IDao dao = sqlsession.getMapper(IDao.class);
		List<reportDTO> result = dao.report_select_articlelist(Map);
		return result;
	}
	
	public List<reportDTO> report_select_normallist(Map Map) {
		IDao dao = sqlsession.getMapper(IDao.class);
		List<reportDTO> result = dao.report_select_normallist(Map);
		return result;
	}

	public List<reportDTO> report_detail(Map Map) {
		IDao dao = sqlsession.getMapper(IDao.class);
		List<reportDTO> result = dao.report_detail(Map);
		return result;
	}
	
	public int report_passwordCheck(Map Map){
		IDao dao = sqlsession.getMapper(IDao.class);
		int result = dao.report_passwordCheck(Map);
		return result;
	}

	public int insertBoardReply_report(Map<String, Object> paramMap) {
		IDao dao = sqlsession.getMapper(IDao.class);
		int result = dao.insertBoardReply_report(paramMap);
		
		return result;
	}

	public List<BoardReply> selectBoardReplyList_report(Map<String, Object> paramMap) {
		IDao dao = sqlsession.getMapper(IDao.class);
		List<BoardReply> boardReplyList  = dao.selectBoardReplyList_report(paramMap);
		// �θ�
		List<BoardReply> boardReplyListParent = new ArrayList<BoardReply>();
		// �ڽ�
		List<BoardReply> boardReplyListChild = new ArrayList<BoardReply>();
		// ����
		List<BoardReply> newBoardReplyList = new ArrayList<BoardReply>();

		// 1.�θ�� �ڽ� �и�
		for (BoardReply boardReply : boardReplyList) {
			if (boardReply.getDepth().equals("0")) {
				boardReplyListParent.add(boardReply);
			} else {
				boardReplyListChild.add(boardReply);
			}
		}

		// 2.�θ� ������.
		for (BoardReply boardReplyParent : boardReplyListParent) {
			// 2-1. �θ�� ������ �ִ´�.
			newBoardReplyList.add(boardReplyParent);
			// 3.�ڽ��� ������.
			for (BoardReply boardReplyChild : boardReplyListChild) {
				// 3-1. �θ��� �ڽ��� �͵鸸 �ִ´�.
				if (boardReplyParent.getReply_id().equals(boardReplyChild.getParent_id())) {
					newBoardReplyList.add(boardReplyChild);
				}

			}

		}

		return newBoardReplyList;
	}

	public int deleteBoardReply_report(Map<String, Object> paramMap) {
		IDao dao = sqlsession.getMapper(IDao.class);
		int result = dao.deleteBoardReply_report(paramMap);
		return result;
	}

}
