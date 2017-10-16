package com.innovest.mysqltest2;

import org.springframework.beans.factory.annotation.Autowired;

import com.innovest.dao.MemberDao;


public class MemberServiceImpl implements MemberService {

	
	private MemberDao memberdao;

	@Override
	public int userIdCheck(String userid) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("this is userIdCheck() in MemberServiceImpl.java");
		System.out.println("this is userIdCheck() in MemberServiceImpl.java and memberdao is :" + memberdao);
		return memberdao.userIdCheck(userid);

	}

	public MemberDao getMemberdao() {
		return memberdao;
	}

	public void setMemberdao(MemberDao memberdao) {
		this.memberdao = memberdao;
	}

}
