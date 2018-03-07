package com.innovest.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.innovest.dto.BoardReply;
import com.innovest.dto.reportDTO;

public interface IDao {

	public int duplicateIdCheck(String user_inputId);

	public int insert_user_ByMap(Map Map);

	public int insert_userrole_byMap(Map Map);

	public int insert_report_ByMap(Map Map);
	
	public int update_report_ByMap(Map Map);

	public int report_delete(Map Map);
	
	public int report_thumbup_already(Map Map);
	public int report_thumbup(Map Map);
	public int report_thumbup_plusone(Map Map);
	public int report_warning_already(Map Map);
	public int report_warning(Map Map);
	public int report_warning_plusone(Map Map);
	
	
	public List<reportDTO> report_select_normallist(Map Map);
	public List<reportDTO> report_select_articlelist(Map Map);
	public List<reportDTO> report_detail(Map Map);
	
	public int report_passwordCheck(Map Map);
	

	int insertBoardReply_report(Map<String, Object> paramMap);

	List<BoardReply> selectBoardReplyList_report(Map<String, Object> paramMap);

	int deleteBoardReply_report(Map<String, Object> paramMap);

}
