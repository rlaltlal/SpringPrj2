package com.green.user.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.user.dao.UserDao;
import com.green.user.service.UserService;
import com.green.user.vo.AccomInformVo;
import com.green.user.vo.TrainInformVo;
import com.green.user.vo.UserVo;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	
	@Override
	public List<UserVo> getUserList() {
		List<UserVo> list=null;
		list=userDao.getUserList();
		return list;
	}

	@Override
	public UserVo getView(String id) {
		UserVo vo=null;
		vo=userDao.getView(id);
		return vo;
	}

	@Override
	public  List<UserVo> getViewName(String name) {
		List<UserVo> list=userDao.getViewName(name);
		return list;
	}

	@Override
	public UserVo login(HashMap<String, Object> map) {
		UserVo vo=null;
		vo=userDao.login(map);
		return vo;
	}

	@Override
	public void insertReserv(HashMap<String, Object> map) {
		userDao.insertReserv(map);
		
	}

	@Override
	public List<TrainInformVo> getTrainInform(HashMap<String, Object> map) {
		List<TrainInformVo> list=null;
		list=userDao.getTrainInform(map);
		return list;
	}

	@Override
	public List<AccomInformVo> getAccomReserv(HashMap<String, Object> map) {
		List<AccomInformVo> list=null;
		System.out.println("mlist : " + list);
		list=userDao.getAccomInfrom(map);
		return list;
	}

	@Override
	public void insertAccomReserv(HashMap<String, Object> map) {
		userDao.insertAccomReserv(map);
		
	}

}
