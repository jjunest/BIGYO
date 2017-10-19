package com.innovest.daos;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.innovest.daos.IDao;
import com.innovest.dtos.CheckUp_DTO;
import com.innovest.dtos.Chk_Hos_Serv_DTO;
import com.innovest.dtos.Hos_DTO;
import com.innovest.dtos.Serv_DTO;

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

	public List<Chk_Hos_Serv_DTO> selectAll_chk_hos_serv(int offset) {
		IDao dao = sqlsession.getMapper(IDao.class);
		List<Chk_Hos_Serv_DTO> result_list = dao.selectAll_chk_hos_serv(offset);
		return result_list;
	}

	public int insert_chk_hos_serv_DTO_ByObj(CheckUp_DTO targetObj) {
		System.out.println("this is insert_chk_hos_serv_DTO_ByObj() Started");
		IDao dao = sqlsession.getMapper(IDao.class);
		int insertByObj_result = dao.insert_chk_hos_serv_DTO_ByObj(targetObj);
		return insertByObj_result;
	}

	public int select_rcdno_chkTable() {
		IDao dao = sqlsession.getMapper(IDao.class);
		int chkrcdno = dao.select_rcdno_chkTable();
		return chkrcdno;
	}

	public int insert_hos_DTO_ByObj(Hos_DTO targetObj) {
		System.out.println("this is insert_chk_hos_serv_DTO_ByObj() Started");
		IDao dao = sqlsession.getMapper(IDao.class);
		int insertByObj_result = dao.insert_hos_DTO_ByObj(targetObj);
		return insertByObj_result;
	}

	public int insert_serv_DTO_ByObj(Serv_DTO targetObj) {
		System.out.println("this is insert_chk_hos_serv_DTO_ByObj() Started");
		IDao dao = sqlsession.getMapper(IDao.class);
		int insertByObj_result = dao.insert_serv_DTO_ByObj(targetObj);
		return insertByObj_result;
	}

}
