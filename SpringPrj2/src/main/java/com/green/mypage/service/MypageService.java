package com.green.mypage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.green.mypage.vo.Criteria;
import com.green.mypage.vo.MyinformVo;
import com.green.mypage.vo.MypageVo;
import com.green.mypage.vo.MypostVo;
import com.green.mypage.vo.MyquestVo;
import com.green.mypage.vo.UserVo;

public interface MypageService {
	
	Map<String, Object> getReservList(String email);

	MypageVo getReservCont(HashMap <String, Object> map);

	MypageVo getReservCancel(HashMap<String, Object> map);

	void reservCancel(HashMap<String, Object> map);

	List<MypostVo> getMyPostList(String email, Criteria cri);

	void myPostDelete(int bseq);

	List<MyquestVo> getMyQuestList(String email);

	MyinformVo myInform(String email);

	void myInformUpdate(MyinformVo vo);

	List<MypageVo> getMyLogList(HashMap<String, Object> map);

	List<MypageVo> getMyTripLog(HashMap<String, Object> map);

	List<UserVo> getUserList();

	int getTotalCount(String email);

	void myQuestDelete(int qseq);

	int rateCal(String email);

	void rateUpdate(String email, String rate);

	List<String> getUserEmail();






}
