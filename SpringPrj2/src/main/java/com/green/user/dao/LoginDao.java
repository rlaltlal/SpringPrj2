package com.green.user.dao;

import java.util.HashMap;

import com.green.user.vo.UserVo;

public interface LoginDao {

	UserVo login(HashMap<String, Object> map);
	
	void submit(HashMap<String, Object> map);
	
}
