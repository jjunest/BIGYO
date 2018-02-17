package com.innovest.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.innovest.dto.tvTopicReply_DTO;
import com.innovest.dto.BoardReply;
import com.innovest.dto.opinion_DTO;
import com.innovest.dto.opinion_withReply_DTO;
import com.innovest.dto.tvTopic_DTO;
import com.innovest.dto.userDTO;

public interface IDao {

	// tvShopTopicMapper
	public int duplicateIdCheck(String user_inputId);

	public int insert_user_ByMap(Map Map);

	public int insert_userrole_byMap(Map Map);

	public int insertTVShowTopic(Map Map);

	public List<tvTopic_DTO> selectAll_TVshow_TopicDTO();

	public tvTopic_DTO selectOne_TvTopic(Map Map);

	public int update_DetailViewNumber(Map Map);

	// opinionMapper
	public int insertOpinion(Map Map);

	public opinion_DTO selectOpinionDetail(Map Map);

	public List<opinion_DTO> selectAll_opinion_normal(Map Map);

	public List<opinion_withReply_DTO> selectAll_opinion_show(Map Map);

	
	//의견_ 추천 및 신고
	int opinion_recommend_process(Map<String, Object> paramMap);
	
	//의견_ 추천 및 신고 개수 세기
	int counting_thumbup_opinion(Integer reply_rcdno);
	
	int counting_warning_opinion(Integer reply_rcdno);
	
	//의견_ 추천 및 신고 업데이트하기
	int update_opinion_recommend(Map<String, Object> paramMap);
	
	userDTO get_userDTO(Map<String, Object> paramMap);
	
	// boardTest DAO
/*
	int regContent(Map<String, Object> paramMap);

	int getContentCnt(Map<String, Object> paramMap);

	List<Board> getContentList(Map<String, Object> paramMap);

	Board getContentView(Map<String, Object> paramMap);

	int regReply(Map<String, Object> paramMap);

	List<BoardReply> getReplyList(Map<String, Object> paramMap);

	int delReply(Map<String, Object> paramMap);

	int getBoardCheck(Map<String, Object> paramMap);

	int delBoard(Map<String, Object> paramMap);*/

}
