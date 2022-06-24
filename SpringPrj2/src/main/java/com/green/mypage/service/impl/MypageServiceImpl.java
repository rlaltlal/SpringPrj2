package com.green.mypage.service.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.mypage.dao.MypageDao;
import com.green.mypage.service.MypageService;
import com.green.mypage.vo.Criteria;
import com.green.mypage.vo.MyinformVo;
import com.green.mypage.vo.MypageVo;
import com.green.mypage.vo.MypostVo;
import com.green.mypage.vo.MyquestVo;
import com.green.mypage.vo.UserVo;

@Service("mypageService")
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	private MypageDao mypageDao;
	
	@Override
	public Map<String, Object> getReservList(String email) {
		Map<String, Object>  reservMap =  mypageDao.getReservList( email );		
		return   reservMap;
	}

	@Override
	public MypageVo getReservCont(HashMap <String, Object> map) {
		MypageVo  reservCont =  mypageDao.getReservCont( map );		
		return reservCont;
	}

	@Override
	public MypageVo getReservCancel(HashMap<String, Object> map) {
		MypageVo cancelVo = mypageDao.getReservCancel(map);
		return cancelVo;
	}
	
	@Override
	public void reservCancel(HashMap<String, Object> map) {
		mypageDao.reservCancel(map);
		
	}

	@Override
	public List<MypostVo> getMyPostList(String email, Criteria cri) {
		List<MypostVo> myPostList = mypageDao.getMyPostList(email, cri);
		return myPostList;
	}

	@Override
	public void myPostDelete(int bseq) {
		mypageDao.myPostDelete(bseq);
	}

	@Override
	public List<MyquestVo> getMyQuestList(String email) {
		List<MyquestVo> myQuestList = mypageDao.getMyQuestList(email);
		return myQuestList;
	}

	@Override
	public MyinformVo myInform(String email) {
		MyinformVo vo = mypageDao.getMyInform(email);
		return vo;
	}

	@Override
	public void myInformUpdate(MyinformVo vo) {
		mypageDao.myInformUpdate(vo);
	}

	@Override
	public List<MypageVo> getMyLogList(HashMap<String, Object> map) {
		List<MypageVo> myLogList = mypageDao.getMyLogList(map);
		return myLogList;
	}

	@Override
	public List<MypageVo> getMyTripLog(HashMap<String, Object> map) {
		List<MypageVo> myTripLog = mypageDao.getMyTripLog(map);
		return myTripLog;
	}

	@Override
	public List<UserVo> getUserList() {
		List<UserVo> userList = mypageDao.getUserList(); 		
		return userList;
	}

	@Override
	public int getTotalCount(String email) {
		int total = mypageDao.getTotalCount(email);
		return total;
	}

	@Override
	public void myQuestDelete(int qseq) {
		mypageDao.myQuestDelete(qseq);
		
	}

	@Override
	public int rateCal(String email) {
		int rate = mypageDao.rateCal(email);
		return rate;
	}

	@Override
	public void rateUpdate(String email, String rate) {
		mypageDao.rateUpdate(email, rate);
	}

	@Override
	public List<String> getUserEmail() {
		List<String> userEmail = mypageDao.getUserEmail(); 
		return userEmail;
	}







}
