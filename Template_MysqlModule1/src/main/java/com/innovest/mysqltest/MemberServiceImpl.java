package com.innovest.mysqltest;

import org.springframework.beans.factory.annotation.Autowired;

import com.innovest.dao.MemberDao;

public class MemberServiceImpl implements MemberService {
	 @Autowired
	    private MemberDao memberdao;
	     
	@Override
	public int userIdCheck(String userid) throws Exception {
		

		// TODO Auto-generated method stub
	    return memberdao.userIdCheck(userid);

	}

}
