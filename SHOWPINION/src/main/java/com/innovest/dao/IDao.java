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

	public List<tvTopic_DTO> selectAll_TVshow_TopicDTO(Map Map);

	public List<tvTopic_DTO> tvshowtopic_select_thisweek(Map Map);

	public List<tvTopic_DTO> normaltopic_select_thisweek(Map Map);

	public tvTopic_DTO selectOne_TvTopic(Map Map);

	public String topic_checkifdeleted(Map Map);

	public int update_tvtopicInfo_byMap(Map Map);

	public int deleteTVShowTopic(Map Map);

	public int update_userProfile_byMap(Map Map);

	public int update_DetailViewNumber(Map Map);

	// opinionMapper
	public int insertOpinion(Map Map);

	public int opinion_update(Map Map);

	public int opinion_delete(Map Map);

	public int ranking_opinion_update(Map Map);

	public opinion_withReply_DTO selectOpinionDetail(Map Map);

	public List<opinion_DTO> selectAll_opinion_normal(Map Map);

	public List<opinion_withReply_DTO> selectAll_opinion_show(Map Map);

	public List<opinion_withReply_DTO> selectAll_my_opinion(Map Map);

	public List<opinion_withReply_DTO> opinion_top_five(Map Map);

	public List<opinion_withReply_DTO> selectAll_my_opinion_history(Map Map);

	// 의견_ 추천 및 신고
	int opinion_recommend_process(Map<String, Object> paramMap);

	// 의견_ 추천 시 의견작성자구하기
	int opinion_select_writer(Map<String, Object> paramMap);

	// 의견_추천시 +1
	int ranking_thumbup_update(Map<String, Object> paramMap);

	// 의견_ 추천 및 신고 중복 체크
	int opinion_recommend_already(Map<String, Object> paramMap);

	int ranking_popular_already(Map<String, Object> paramMap);

	int ranking_popular_process(Map<String, Object> paramMap);

	int ranking_popular_update_userInfo(Map<String, Object> paramMap);

	public List<userDTO> user_ranking_list(Map<String, Object> paramMap);

	public List<userDTO> group_ranking_list(Map<String, Object> paramMap);

	// 의견_ 추천 및 신고 개수 세기
	int counting_thumbup_opinion(Integer reply_rcdno);

	int counting_warning_opinion(Integer reply_rcdno);

	// 의견_ 추천 및 신고 업데이트하기
	int update_opinion_recommend(Map<String, Object> paramMap);

	userDTO get_userDTO(Map<String, Object> paramMap);

	userDTO get_userDTO_byRcdno(Map<String, Object> paramMap);

	// boardTest DAO
	/*
	 * int regContent(Map<String, Object> paramMap);
	 * 
	 * int getContentCnt(Map<String, Object> paramMap);
	 * 
	 * List<Board> getContentList(Map<String, Object> paramMap);
	 * 
	 * Board getContentView(Map<String, Object> paramMap);
	 * 
	 * int regReply(Map<String, Object> paramMap);
	 * 
	 * List<BoardReply> getReplyList(Map<String, Object> paramMap);
	 * 
	 * int delReply(Map<String, Object> paramMap);
	 * 
	 * int getBoardCheck(Map<String, Object> paramMap);
	 * 
	 * int delBoard(Map<String, Object> paramMap);
	 */

}
