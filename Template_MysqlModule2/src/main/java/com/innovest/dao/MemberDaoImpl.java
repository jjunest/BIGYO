package com.innovest.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;




public class MemberDaoImpl implements MemberDao {
	@Autowired
    private SqlSession sqlsession;
     
    public SqlSession getSqlsession() {
		return sqlsession;
	}


	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}


	private static final String mapper ="mappers.memberMapper.";
     

	@Override
	public int userIdCheck(String userid) throws Exception {
		System.out.println("this is userIdCheck() in MemberDaoImpl.java");
		System.out.println("this is userIdCheck() in MemberDaoImpl.java and @autowired sqlsession is " +sqlsession);
		// TODO Auto-generated method stub
		 return sqlsession.selectOne(mapper+"useridcheck",userid);

	}

}
