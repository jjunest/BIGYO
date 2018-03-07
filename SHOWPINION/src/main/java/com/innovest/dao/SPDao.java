package com.innovest.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.innovest.dto.tvTopicReply_DTO;
import com.innovest.dto.BoardReply;
import com.innovest.dto.opinionReply_DTO;
import com.innovest.dto.opinion_DTO;
import com.innovest.dto.opinion_withReply_DTO;
import com.innovest.dto.tvTopic_DTO;
import com.innovest.dto.userDTO;

public class SPDao {

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

	public userDTO get_userDTO(Map Map) {
		IDao dao = sqlsession.getMapper(IDao.class);
		userDTO result = dao.get_userDTO(Map);
		return result;
	}

	public userDTO get_userDTO_byRcdno(Map Map) {
		IDao dao = sqlsession.getMapper(IDao.class);
		userDTO result = dao.get_userDTO_byRcdno(Map);
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

	public int insertTVShowTopic(Map Map) {
		IDao dao = sqlsession.getMapper(IDao.class);
		int result = dao.insertTVShowTopic(Map);
		return result;
	}

	public int update_userProfile_byMap(Map Map) {
		IDao dao = sqlsession.getMapper(IDao.class);
		int result = dao.update_userProfile_byMap(Map);
		return result;
	}

	public List<tvTopic_DTO> selectAll_TVshow_TopicDTO(Map Map) {
		IDao dao = sqlsession.getMapper(IDao.class);
		List<tvTopic_DTO> result = dao.selectAll_TVshow_TopicDTO(Map);
		return result;
	}
	public List<tvTopic_DTO> tvshowtopic_select_thisweek(Map Map) {
		IDao dao = sqlsession.getMapper(IDao.class);
		List<tvTopic_DTO> result = dao.tvshowtopic_select_thisweek(Map);
		return result;
	}
	
	public List<tvTopic_DTO> normaltopic_select_thisweek(Map Map) {
		IDao dao = sqlsession.getMapper(IDao.class);
		List<tvTopic_DTO> result = dao.normaltopic_select_thisweek(Map);
		return result;
	}
	

	public tvTopic_DTO selectOne_TvTopic(Map Map) {
		IDao dao = sqlsession.getMapper(IDao.class);
		tvTopic_DTO result = dao.selectOne_TvTopic(Map);
		return result;
	}
	public String topic_checkifdeleted(Map Map) {
		IDao dao = sqlsession.getMapper(IDao.class);
		String result = dao.topic_checkifdeleted(Map);
		return result;
	}
	public int update_tvtopicInfo_byMap(Map Map) {
		IDao dao = sqlsession.getMapper(IDao.class);
		int result = dao.update_tvtopicInfo_byMap(Map);
		return result;
	}

	public int deleteTVShowTopic(Map Map) {
		IDao dao = sqlsession.getMapper(IDao.class);
		int result = dao.deleteTVShowTopic(Map);
		return result;
	}

	public int update_DetailViewNumber(Map Map) {
		IDao dao = sqlsession.getMapper(IDao.class);
		int result = dao.update_DetailViewNumber(Map);
		return result;
	}

	// opinion mapper 시작
	public int insertOpinion(Map Map) {
		IDao dao = sqlsession.getMapper(IDao.class);
		int result = dao.insertOpinion(Map);
		return result;
	}

	public int opinion_update(Map Map) {
		IDao dao = sqlsession.getMapper(IDao.class);
		int result = dao.opinion_update(Map);
		return result;
	}

	public int opinion_delete(Map Map) {
		IDao dao = sqlsession.getMapper(IDao.class);
		int result = dao.opinion_delete(Map);
		return result;
	}
	public int ranking_opinion_update(Map Map) {
		IDao dao = sqlsession.getMapper(IDao.class);
		int result = dao.ranking_opinion_update(Map);
		return result;
	}
	
	

	public opinion_withReply_DTO selectOpinionDetail(Map Map) {
		IDao dao = sqlsession.getMapper(IDao.class);
		opinion_withReply_DTO originalDTO = dao.selectOpinionDetail(Map);
		List<opinionReply_DTO> originalReplys = originalDTO.getOpinionReplys();

		// originalReplys를 재배치해준다.
		// 댓글 중 가장 부모 리스트 뽑기
		List<opinionReply_DTO> boardReplyListParent = new ArrayList<opinionReply_DTO>();
		// 대댓글 리스트 뽑기
		List<opinionReply_DTO> boardReplyListChild = new ArrayList<opinionReply_DTO>();
		// 최종 정리가 된 리스트
		List<opinionReply_DTO> newBoardReplyList = new ArrayList<opinionReply_DTO>();

		// 1.모태가 되는 리플부터 구하자.
		for (opinionReply_DTO boardReply : originalReplys) {
			if (boardReply.getSp_opinion_reply_depth() == 0) {
				boardReplyListParent.add(boardReply);
			} else {
				boardReplyListChild.add(boardReply);
			}
		}

		// 2.�θ� ������.
		for (opinionReply_DTO boardReplyParent : boardReplyListParent) {
			// 2-1. 일단
			newBoardReplyList.add(boardReplyParent);
			// 3.�ڽ��� ������.
			for (opinionReply_DTO boardReplyChild : boardReplyListChild) {
				// 3-1. �θ��� �ڽ��� �͵鸸 �ִ´�.
				if (boardReplyParent.getSp_opinion_reply_rcdno() == boardReplyChild
						.getSp_opinion_reply_parentRcdno()) {
					newBoardReplyList.add(boardReplyChild);
				}
			}
		}
		originalDTO.setOpinionReplys(newBoardReplyList);

		return originalDTO;

	}

	public List<opinion_DTO> selectAll_opinion_normal(Map Map) {
		IDao dao = sqlsession.getMapper(IDao.class);
		List<opinion_DTO> result = dao.selectAll_opinion_normal(Map);
		return result;
	}

	public List<opinion_withReply_DTO> selectAll_my_opinion(Map Map) {
		IDao dao = sqlsession.getMapper(IDao.class);
		List<opinion_withReply_DTO> original_resultList = dao.selectAll_my_opinion(Map);
		for (int i = 0; i < original_resultList.size(); i++) {
			opinion_withReply_DTO originalDTO = original_resultList.get(i);
			List<opinionReply_DTO> originalReplys = originalDTO.getOpinionReplys();

			// originalReplys를 재배치해준다.
			// 댓글 중 가장 부모 리스트 뽑기
			List<opinionReply_DTO> boardReplyListParent = new ArrayList<opinionReply_DTO>();
			// 대댓글 리스트 뽑기
			List<opinionReply_DTO> boardReplyListChild = new ArrayList<opinionReply_DTO>();
			// 최종 정리가 된 리스트
			List<opinionReply_DTO> newBoardReplyList = new ArrayList<opinionReply_DTO>();

			// 1.모태가 되는 리플부터 구하자.
			for (opinionReply_DTO boardReply : originalReplys) {
				if (boardReply.getSp_opinion_reply_depth() == 0) {
					boardReplyListParent.add(boardReply);
				} else {
					boardReplyListChild.add(boardReply);
				}
			}

			// 2.�θ� ������.
			for (opinionReply_DTO boardReplyParent : boardReplyListParent) {
				// 2-1. 일단
				newBoardReplyList.add(boardReplyParent);
				// 3.�ڽ��� ������.
				for (opinionReply_DTO boardReplyChild : boardReplyListChild) {
					// 3-1. �θ��� �ڽ��� �͵鸸 �ִ´�.
					if (boardReplyParent.getSp_opinion_reply_rcdno() == boardReplyChild
							.getSp_opinion_reply_parentRcdno()) {
						newBoardReplyList.add(boardReplyChild);
					}
				}
			}
			originalDTO.setOpinionReplys(newBoardReplyList);
		}

		return original_resultList;
	}
	public List<opinion_withReply_DTO> opinion_top_five(Map Map) {
		IDao dao = sqlsession.getMapper(IDao.class);
		List<opinion_withReply_DTO> original_resultList = dao.opinion_top_five(Map);
		return original_resultList;
	}
	
	public List<opinion_withReply_DTO> selectAll_my_opinion_history(Map Map) {
		IDao dao = sqlsession.getMapper(IDao.class);
		// 어차피 의견의 댓글은 보여주지 않을 것이기 때문에, 순서 바꾸는 작업은 필요가 없다. 
		List<opinion_withReply_DTO> original_resultList = dao.selectAll_my_opinion_history(Map);
		
		return original_resultList;
	}

	public List<opinion_withReply_DTO> selectAll_opinion_show(Map Map) {
		IDao dao = sqlsession.getMapper(IDao.class);
		System.out.println("Map listOrder:" + Map.get("list_order"));
		List<opinion_withReply_DTO> original_resultList = dao.selectAll_opinion_show(Map);
		for (int i = 0; i < original_resultList.size(); i++) {
			opinion_withReply_DTO originalDTO = original_resultList.get(i);
			List<opinionReply_DTO> originalReplys = originalDTO.getOpinionReplys();

			// originalReplys를 재배치해준다.
			// 댓글 중 가장 부모 리스트 뽑기
			List<opinionReply_DTO> boardReplyListParent = new ArrayList<opinionReply_DTO>();
			// 대댓글 리스트 뽑기
			List<opinionReply_DTO> boardReplyListChild = new ArrayList<opinionReply_DTO>();
			// 최종 정리가 된 리스트
			List<opinionReply_DTO> newBoardReplyList = new ArrayList<opinionReply_DTO>();

			// 1.모태가 되는 리플부터 구하자.
			for (opinionReply_DTO boardReply : originalReplys) {
				if (boardReply.getSp_opinion_reply_depth() == 0) {
					boardReplyListParent.add(boardReply);
				} else {
					boardReplyListChild.add(boardReply);
				}
			}

			// 2.�θ� ������.
			for (opinionReply_DTO boardReplyParent : boardReplyListParent) {
				// 2-1. 일단
				newBoardReplyList.add(boardReplyParent);
				// 3.�ڽ��� ������.
				for (opinionReply_DTO boardReplyChild : boardReplyListChild) {
					// 3-1. �θ��� �ڽ��� �͵鸸 �ִ´�.
					if (boardReplyParent.getSp_opinion_reply_rcdno() == boardReplyChild
							.getSp_opinion_reply_parentRcdno()) {
						newBoardReplyList.add(boardReplyChild);
					}
				}
			}
			originalDTO.setOpinionReplys(newBoardReplyList);
		}

		return original_resultList;
	}

	
	// 주제_ 댓글 추천 및 신고기능
	public int opinion_recommend_process(Map<String, Object> paramMap) {
		IDao dao = sqlsession.getMapper(IDao.class);
		int result = dao.opinion_recommend_process(paramMap);
		return result;
	}
	public int opinion_select_writer(Map<String, Object> paramMap) {
		IDao dao = sqlsession.getMapper(IDao.class);
		int result = dao.opinion_select_writer(paramMap);
		return result;
	}
	// 의견 추천시 랭킹 +1 업데이트
	public int ranking_thumbup_update(Map<String, Object> paramMap) {
		IDao dao = sqlsession.getMapper(IDao.class);
		int result = dao.ranking_thumbup_update(paramMap);
		return result;
	}
	

	public int opinion_recommend_already(Map<String, Object> paramMap) {
		IDao dao = sqlsession.getMapper(IDao.class);
		int result = dao.opinion_recommend_already(paramMap);
		return result;
	}
	public int ranking_popular_already(Map<String, Object> paramMap) {
		IDao dao = sqlsession.getMapper(IDao.class);
		int result = dao.ranking_popular_already(paramMap);
		return result;
	}
	public int ranking_popular_process(Map<String, Object> paramMap) {
		IDao dao = sqlsession.getMapper(IDao.class);
		int result = dao.ranking_popular_process(paramMap);
		return result;
	}
	public int ranking_popular_update_userInfo(Map<String, Object> paramMap) {
		IDao dao = sqlsession.getMapper(IDao.class);
		int result = dao.ranking_popular_update_userInfo(paramMap);
		return result;
	}
	public List<userDTO> user_ranking_list(Map<String, Object> paramMap) {
		IDao dao = sqlsession.getMapper(IDao.class);
		List<userDTO> result = dao.user_ranking_list(paramMap);
		return result;
	}
	public List<userDTO> group_ranking_list(Map<String, Object> paramMap) {
		IDao dao = sqlsession.getMapper(IDao.class);
		List<userDTO> result = dao.group_ranking_list(paramMap);
		return result;
	}
	
	
	
	
	// 주제_ 댓글 추천수 세기
	public int counting_thumbup_opinion(Integer param) {
		IDao dao = sqlsession.getMapper(IDao.class);
		int result = dao.counting_thumbup_opinion(param);
		return result;
	}

	// 주제_ 댓글 신고수 세기
	public int counting_warning_opinion(Integer param) {
		IDao dao = sqlsession.getMapper(IDao.class);
		int result = dao.counting_warning_opinion(param);
		return result;
	}

	// 주제_ 댓글 추천수 및 신고수 업데이트
	public int update_opinion_recommend(Map<String, Object> paramMap) {
		IDao dao = sqlsession.getMapper(IDao.class);
		int result = dao.update_opinion_recommend(paramMap);
		return result;
	}

	/*
	 * //board TEST dao
	 * 
	 * public int regContent(Map<String, Object> paramMap) { return
	 * sqlsession.insert("insertContent", paramMap); }
	 * 
	 * public int getContentCnt(Map<String, Object> paramMap) { return
	 * sqlsession.selectOne("selectContentCnt", paramMap); }
	 * 
	 * public List<Board> getContentList(Map<String, Object> paramMap) { return
	 * sqlsession.selectList("selectContent", paramMap); }
	 * 
	 * public Board getContentView(Map<String, Object> paramMap) { return
	 * sqlsession.selectOne("selectContentView", paramMap); }
	 * 
	 * public int regReply(Map<String, Object> paramMap) { return
	 * sqlsession.insert("insertBoardReply", paramMap); }
	 * 
	 * public List<BoardReply> getReplyList(Map<String, Object> paramMap) { return
	 * sqlsession.selectList("selectBoardReplyList", paramMap); }
	 * 
	 * public int delReply(Map<String, Object> paramMap) { return
	 * sqlsession.delete("deleteBoardReply", paramMap); }
	 * 
	 * public int getBoardCheck(Map<String, Object> paramMap) { return
	 * sqlsession.selectOne("selectBoardCnt", paramMap); }
	 * 
	 * public int delBoard(Map<String, Object> paramMap) { return
	 * sqlsession.delete("deleteBoard", paramMap); }
	 */

}
