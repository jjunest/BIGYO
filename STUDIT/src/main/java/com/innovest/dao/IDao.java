package com.innovest.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.innovest.dto.questionDTO;


public interface IDao {

	public int insertQuestionByObj(questionDTO insertDTO);


	public List<questionDTO> selectAllList();


}
