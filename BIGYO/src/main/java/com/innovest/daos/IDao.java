package com.innovest.daos;


import java.util.HashMap;
import java.util.List;


import com.innovest.dtos.CheckUp_DTO;
import com.innovest.dtos.Chk_Hos_Serv_DTO;



public interface IDao {


	public List<CheckUp_DTO> selectAll_chkDTO(int offset);

	public Chk_Hos_Serv_DTO selectOne_chk_hos_serv(int chk_rcdno);
}
