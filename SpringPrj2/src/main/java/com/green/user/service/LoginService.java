package com.green.user.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.green.user.vo.UserVo;

public interface LoginService {
	
	UserVo login(HashMap<String, Object> map);
	
	void submit(HashMap<String, Object> map);
}
