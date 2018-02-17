package com.innovest.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.innovest.dto.tvTopicReply_DTO;
import com.innovest.dto.BoardReply;
import com.innovest.dto.opinion_DTO;
import com.innovest.dto.tvTopic_DTO;
import com.innovest.dto.userDTO;

public class Reply_Dao {

	public SqlSession sqlsession;

	public SqlSession getSqlsession() {
		return sqlsession;
	}

	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	// 주제_ 댓글 저장하기
	public int topic_reply_save(Map<String, Object> paramMap) {
		I_Reply_Dao dao = sqlsession.getMapper(I_Reply_Dao.class);
		int result = dao.topic_reply_save(paramMap);
		return result;
	}
	
	// 주제_ 댓글 추천 및 신고기능
	public int topic_reply_recommend_process(Map<String, Object> paramMap) {
		I_Reply_Dao dao = sqlsession.getMapper(I_Reply_Dao.class);
		int result = dao.topic_reply_recommend_process(paramMap);
		return result;
	}
	// 주제_ 댓글 추천수 세기
	public int counting_thumbup_topicReply(Integer param) {
		I_Reply_Dao dao = sqlsession.getMapper(I_Reply_Dao.class);
		int result = dao.counting_thumbup_topicReply(param);
		return result;
	}
	// 주제_ 댓글 신고수 세기
	public int counting_warning_topicReply(Integer param) {
		I_Reply_Dao dao = sqlsession.getMapper(I_Reply_Dao.class);
		int result = dao.counting_warning_topicReply(param);
		return result;
	}
	// 주제_ 댓글 추천수 및 신고수 업데이트
	public int update_topicReply_recommend(Map<String, Object> paramMap) {
		I_Reply_Dao dao = sqlsession.getMapper(I_Reply_Dao.class);
		int result = dao.update_topicReply_recommend(paramMap);
		return result;
	}
	
	// 의견_ 댓글 신고수 세기
	public int counting_thumbup_opinionReply(Integer param) {
		I_Reply_Dao dao = sqlsession.getMapper(I_Reply_Dao.class);
		int result = dao.counting_thumbup_opinionReply(param);
		return result;
	}
	
	// 의견_ 댓글 신고수 세기
	public int counting_warning_opinionReply(Integer param) {
		I_Reply_Dao dao = sqlsession.getMapper(I_Reply_Dao.class);
		int result = dao.counting_warning_opinionReply(param);
		return result;
	}
	
	// 의견_ 댓글 추천수 및 신고수 업데이트
	public int update_opinionReply_recommend(Map<String, Object> paramMap) {
		I_Reply_Dao dao = sqlsession.getMapper(I_Reply_Dao.class);
		int result = dao.update_opinionReply_recommend(paramMap);
		return result;
	}
	
	
	

	// 특정 토픽 주제 댓글 + 대댓글 모두 보기
	public List<tvTopicReply_DTO> get_All_topic_reply(Map<String, Object> paramMap) {
		I_Reply_Dao dao = sqlsession.getMapper(I_Reply_Dao.class);
		List<tvTopicReply_DTO> boardReplyList = dao.get_All_topic_reply(paramMap);
		System.out.println("this is boardReplyList size():"+boardReplyList.size());
		//댓글 중 가장 부모 리스트 뽑기
		List<tvTopicReply_DTO> boardReplyListParent = new ArrayList<tvTopicReply_DTO>();
		//대댓글 리스트 뽑기
		List<tvTopicReply_DTO> boardReplyListChild = new ArrayList<tvTopicReply_DTO>();
		//최종 정리가 된 리스트
		List<tvTopicReply_DTO> newBoardReplyList = new ArrayList<tvTopicReply_DTO>();

		//1.모태가 되는 리플부터 구하자. 
		for(tvTopicReply_DTO boardReply: boardReplyList){
			if(boardReply.getSp_topic_reply_depth()==0){
				boardReplyListParent.add(boardReply);
			}else{
				boardReplyListChild.add(boardReply);
			}
		}
		//대댓글은 역순으로 저장하자. 대댓글은 최신댓글이 가장 밑에,,,,
		 Collections.reverse(boardReplyListChild);
		//2.�θ� ������.
		for(tvTopicReply_DTO boardReplyParent: boardReplyListParent){
			//2-1.  일단 
			newBoardReplyList.add(boardReplyParent);
			//3.�ڽ��� ������.
			for(tvTopicReply_DTO boardReplyChild: boardReplyListChild){
				//3-1. �θ��� �ڽ��� �͵鸸 �ִ´�.
				if(boardReplyParent.getSp_topic_reply_rcdno()==boardReplyChild.getSp_topic_reply_parentRcdno()){
					newBoardReplyList.add(boardReplyChild);
				}
			}
		}
		return newBoardReplyList;
		
	}
	
	// 의견_ 댓글 저장하기
	public int opinion_reply_save(Map<String, Object> paramMap) {
		I_Reply_Dao dao = sqlsession.getMapper(I_Reply_Dao.class);
		int result = dao.opinion_reply_save(paramMap);
		return result;
	}
	
	// 의견_ 댓글 추천 및 신고기능
	public int opinion_reply_recommend_process(Map<String, Object> paramMap) {
		I_Reply_Dao dao = sqlsession.getMapper(I_Reply_Dao.class);
		int result = dao.opinion_reply_recommend_process(paramMap);
		return result;
	}
	
	public int getContentCnt(Map<String, Object> paramMap) {
		return sqlsession.selectOne("selectContentCnt", paramMap);
	}

	public List<tvTopicReply_DTO> getContentList(Map<String, Object> paramMap) {
		return sqlsession.selectList("selectContent", paramMap);
	}

	public tvTopicReply_DTO getContentView(Map<String, Object> paramMap) {
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
