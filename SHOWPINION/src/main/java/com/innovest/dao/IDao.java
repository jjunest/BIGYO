package com.innovest.dao;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.innovest.dto.tvTopic_DTO;
import com.innovest.dto.userDTO;


public interface IDao {

	

	public int duplicateIdCheck(String user_inputId);
	
	public int insert_user_ByObj(userDTO DTO);
	
	public int insert_userrole_byMap(Map Map);
	
	public int insertTVShowTopic(Map Map);
	
	public List<tvTopic_DTO> selectAll_TVshow_TopicDTO();
	
	public tvTopic_DTO selectOne_TvTopic(Map Map);
	
	
}
