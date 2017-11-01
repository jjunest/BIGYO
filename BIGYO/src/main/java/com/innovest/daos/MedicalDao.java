package com.innovest.daos;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.innovest.daos.IDao;
import com.innovest.dtos.CheckUp_DTO;
import com.innovest.dtos.Chk_Hos_Serv_DTO;
import com.innovest.dtos.Hos_DTO;
import com.innovest.dtos.ServAge_DTO;
import com.innovest.dtos.ServPrice_DTO;
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
	
	public int selectAll_chk_hos_serv_totalNum() {
		IDao dao = sqlsession.getMapper(IDao.class);
		int result = dao.selectAll_chk_hos_serv_totalNum();
		return result;
	}
	
	public List<Chk_Hos_Serv_DTO> selectAll_chk_hos_serv_filter(Map hashMap) {
		IDao dao = sqlsession.getMapper(IDao.class);
		List<Chk_Hos_Serv_DTO> result_list = dao.selectAll_chk_hos_serv_filter(hashMap);
		return result_list;
	}
	
	public int selectAll_chk_hos_serv_filter_totalNum(Map hashMap) {
		IDao dao = sqlsession.getMapper(IDao.class);
		int result = dao.selectAll_chk_hos_serv_filter_totalNum(hashMap);
		return result;
	}

	public int insert_chk_hos_serv_DTO_ByObj(CheckUp_DTO targetObj) {
		System.out.println("this is insert_chk_hos_serv_DTO_ByObj() Started");
		IDao dao = sqlsession.getMapper(IDao.class);
		int insertByObj_result = dao.insert_chk_hos_serv_DTO_ByObj(targetObj);
		return insertByObj_result;
	}

	public int select_rcdno_chkTable() {
		IDao dao = sqlsession.getMapper(IDao.class);
		int maxRcdno = dao.select_rcdno_chkTable();
		return maxRcdno;
	}

	public int insert_hos_DTO_ByObj(Hos_DTO targetObj) {
		IDao dao = sqlsession.getMapper(IDao.class);
		int insertByObj_result = dao.insert_hos_DTO_ByObj(targetObj);
		return insertByObj_result;
	}

	public int insert_serv_DTO_ByObj(Serv_DTO targetObj) {
		IDao dao = sqlsession.getMapper(IDao.class);
		int insertByObj_result = dao.insert_serv_DTO_ByObj(targetObj);
		return insertByObj_result;
	}
	
	
	public int select_rcdno_servTable() {
		IDao dao = sqlsession.getMapper(IDao.class);
		int maxRcdno = dao.select_rcdno_servTable();
		return maxRcdno;
	}

	public int insert_servPrice_DTO_ByObj(ServPrice_DTO targetObj) {
		IDao dao = sqlsession.getMapper(IDao.class);
		int insertByObj_result = dao.insert_servPrice_DTO_ByObj(targetObj);
		return insertByObj_result;
	}
	
	public int select_rcdno_servPriceTable() {
		IDao dao = sqlsession.getMapper(IDao.class);
		int maxRcdno = dao.select_rcdno_servPriceTable();
		return maxRcdno;
	}
	
	public int insert_servAge_DTO_ByObj(ServAge_DTO targetObj) {
		IDao dao = sqlsession.getMapper(IDao.class);
		int insertByObj_result = dao.insert_servAge_DTO_ByObj(targetObj);
		return insertByObj_result;
	}
	
	public int update_chk_DTO_ByObj(CheckUp_DTO targetObj) {
		IDao dao = sqlsession.getMapper(IDao.class);
		int updateByObj_result = dao.update_chk_DTO_ByObj(targetObj);
		return updateByObj_result;
	}
	
	public int deleteByUpdate_hos_DTO(int hos_rcdno) {
		IDao dao = sqlsession.getMapper(IDao.class);
		int updateByObj_result = dao.deleteByUpdate_hos_DTO(hos_rcdno);
		return updateByObj_result;
	}
	public int deleteByUpdate_serv_DTO(int serv_rcdno) {
		IDao dao = sqlsession.getMapper(IDao.class);
		int updateByObj_result = dao.deleteByUpdate_serv_DTO(serv_rcdno);
		return updateByObj_result;
	}
	
	public int delete_servPrice_chkrcdno(int chk_rcdno) {
		IDao dao = sqlsession.getMapper(IDao.class);
		int db_result = dao.delete_servPrice_chkrcdno(chk_rcdno);
		return db_result;
	}
	
	public int delete_chkTable_chkrcdno(int chk_rcdno) {
		IDao dao = sqlsession.getMapper(IDao.class);
		int db_result = dao.delete_chkTable_chkrcdno(chk_rcdno);
		return db_result;
	}
	public int deleteByUpdate_chk_DTO(int chk_rcdno) {
		IDao dao = sqlsession.getMapper(IDao.class);
		int db_result = dao.deleteByUpdate_chk_DTO(chk_rcdno);
		return db_result;
	}
	
	public List<Chk_Hos_Serv_DTO> selectTop5_Pricew_chk_hos_serv(Map hashMap) {
		IDao dao = sqlsession.getMapper(IDao.class);
		List<Chk_Hos_Serv_DTO> result_list = dao.selectTop5_Price_chk_hos_serv(hashMap);
		return result_list;
	}
	
}
