package com.green.user.dao.impl;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.user.dao.LoginDao;
import com.green.user.vo.UserVo;

@Repository("loginDao")
public class LoginDaoImpl implements LoginDao {

	@Autowired
	private SqlSession  sqlSession;
	
	@Override
	public UserVo login(HashMap<String, Object> map) {	
		System.out.println("logindao map:" + map);
		UserVo  vo  =  sqlSession.selectOne("User.login", map); 
		return  vo;
		
	}

	@Override
	public void submit(HashMap<String, Object> map) {
		sqlSession.insert("User.submit", map);
		
	}



}
