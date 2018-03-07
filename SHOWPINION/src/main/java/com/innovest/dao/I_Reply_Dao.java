package com.innovest.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.innovest.dto.tvTopicReply_DTO;
import com.innovest.dto.BoardReply;
import com.innovest.dto.opinion_DTO;
import com.innovest.dto.tvTopic_DTO;
import com.innovest.dto.userDTO;

public interface I_Reply_Dao {

	// boardTest DAO
	// 토픽 주제_ 댓글 저장하기.
	int topic_reply_save(Map<String, Object> paramMap);
	// 토픽 주제_ 댓글 삭제하기
	int topicReply_delete(Map<String, Object> paramMap);
		
	// 토픽 주제_ 대댓글 저장하기
	int topic_re_reply_save(Map<String, Object> paramMap);
	
	// 토픽주제댓글_좋아요 수 세기
	int counting_thumbup(Map<String, Object> paramMap);
	
	// 토픽 주제댓글_신고하기 수 세기
	int counting_warning(Map<String, Object> paramMap);

	int getContentCnt(Map<String, Object> paramMap);

	List<tvTopicReply_DTO> getContentList(Map<String, Object> paramMap);

	// 특정 토픽 주제 댓글 모두 보기
	List<tvTopicReply_DTO> get_All_topic_reply(Map<String, Object> paramMap);

	
	// 의견_댓글 저장하기
	int opinion_reply_save(Map<String, Object> paramMap);
	
	
	// 댓글 삭제하기

	// 댓글 수정하기

	tvTopicReply_DTO getContentView(Map<String, Object> paramMap);

	int regReply(Map<String, Object> paramMap);

	List<BoardReply> getReplyList(Map<String, Object> paramMap);

	int delReply(Map<String, Object> paramMap);

	int getBoardCheck(Map<String, Object> paramMap);

	int delBoard(Map<String, Object> paramMap);
	
	//주제_댓글 추천 및 신고
	int topic_reply_recommend_process(Map<String, Object> paramMap);
	
	int topic_reply_recommend_already(Map<String, Object> paramMap);
	
	
	
	//의견_댓글 추천 및 신고
	int opinion_reply_recommend_process(Map<String, Object> paramMap);
	//의견_댓글 추천 및 신고
	int opinion_reply_recommend_already(Map<String, Object> paramMap);
	
	
	int opinionReply_delete(Map<String, Object> paramMap);
	
	
	int counting_thumbup_topicReply(Integer reply_rcdno);
	
	int counting_warning_topicReply(Integer reply_rcdno);
	
	int counting_thumbup_opinionReply(Integer reply_rcdno);
	
	int counting_warning_opinionReply(Integer reply_rcdno);
	
	
	int update_topicReply_recommend(Map<String, Object> paramMap);
	

	int update_opinionReply_recommend(Map<String, Object> paramMap);
	

}
