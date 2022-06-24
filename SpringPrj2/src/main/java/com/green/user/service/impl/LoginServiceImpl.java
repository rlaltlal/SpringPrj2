package com.green.user.service.impl;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.user.dao.LoginDao;
import com.green.user.service.LoginService;
import com.green.user.vo.UserVo;

@Service("loginService")
public class LoginServiceImpl implements LoginService {

	@Autowired
	private  LoginDao  loginDao;
	
	@Override
	public UserVo login(HashMap<String, Object> map) {
		UserVo    vo   =   loginDao.login( map ); 
		return    vo;
	}

	
	@Override
	public void submit(HashMap<String, Object> map) {
		loginDao.submit(map);
		
	}
	
	
	
}
