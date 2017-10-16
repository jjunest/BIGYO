package com.innovest.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDaoImpl implements MemberDao {
	@Autowired
	private SqlSession sqlsession;
	private static final String mapper = "mappers.memberMapper.";

	@Override
	public int userIdCheck(String userid) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(mapper + "useridcheck", userid);

	}

}
