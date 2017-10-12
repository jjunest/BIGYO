package com.innovest.daos;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;


import com.innovest.dtos.CheckUp_DTO;
import com.innovest.dtos.Chk_Hos_Serv_DTO;

public class MedicalDao {

	public SqlSession sqlsession;

	public SqlSession getSqlsession() {
		return sqlsession;
	}

	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}


	public List<CheckUp_DTO> selectAll_chkDTO(int offset) {
		IDao dao = sqlsession.getMapper(IDao.class);
		List<CheckUp_DTO> result_list = dao.selectAll_chkDTO(offset);
		return result_list;
	}
	
	public Chk_Hos_Serv_DTO selectOne_chk_hos_serv(int chk_rcdno) {
		IDao dao = sqlsession.getMapper(IDao.class);
		Chk_Hos_Serv_DTO result_one = dao.selectOne_chk_hos_serv(chk_rcdno);
		return result_one;
	}

}
