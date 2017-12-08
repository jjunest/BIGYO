package com.innovest.daos;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.innovest.dto.MemberDto;
import com.innovest.dtos.CheckUp_DTO;
import com.innovest.dtos.Chk_Hos_Serv_DTO;
import com.innovest.dtos.Hos_DTO;
import com.innovest.dtos.ServAge_DTO;
import com.innovest.dtos.ServPrice_DTO;
import com.innovest.dtos.Serv_DTO;

public interface IDao {

	public List<CheckUp_DTO> selectAll_chkDTO(int offset);

	public Chk_Hos_Serv_DTO selectOne_chk_hos_serv(int chk_rcdno);

	public List<Chk_Hos_Serv_DTO> selectAll_chk_hos_serv(int offset);
	
	public int selectAll_chk_hos_serv_totalNum();
	
	public List<Chk_Hos_Serv_DTO> selectAll_chk_hos_serv_filter(Map hashMap);
	
	public int selectAll_chk_hos_serv_filter_totalNum(Map hashMap);

	public int insert_chk_hos_serv_DTO_ByObj(CheckUp_DTO insertObj);

	public int select_rcdno_chkTable();

	public int insert_hos_DTO_ByObj(Hos_DTO insertObj);

	public int insert_serv_DTO_ByObj(Serv_DTO insertObj);

	public int select_rcdno_servTable();

	public int insert_servPrice_DTO_ByObj(ServPrice_DTO insertObj);

	public int select_rcdno_servPriceTable();

	public int insert_servAge_DTO_ByObj(ServAge_DTO insertObj);

	public int update_chk_DTO_ByObj(CheckUp_DTO updateObj);

	public int deleteByUpdate_hos_DTO(int hos_rcdno);

	public int deleteByUpdate_serv_DTO(int serv_rcdno);
	
	public int delete_servPrice_chkrcdno(int chk_rcdno);
	
	public int delete_chkTable_chkrcdno(int chk_rcdno);
	
	public int deleteByUpdate_chk_DTO(int chk_rcdno);
	
	public List<Chk_Hos_Serv_DTO> selectTop5_Price_chk_hos_serv(Map hashMap);
	
	public int update_click_num(Map hashMap);
	
	public List<Chk_Hos_Serv_DTO> selectTopSix_orderByClickNum();
	
	public List<Chk_Hos_Serv_DTO> selectTopSix_orderByCreatedDate();
	
	public List<Chk_Hos_Serv_DTO> searchHospitalInfoFromDatabase(Map hashMap);
	
	public List<Chk_Hos_Serv_DTO> searchCompanyInfoFromDatabase(Map hashMap);
	
}
