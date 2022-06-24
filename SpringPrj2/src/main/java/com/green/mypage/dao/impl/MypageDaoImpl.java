package com.green.mypage.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.mypage.dao.MypageDao;
import com.green.mypage.vo.Criteria;
import com.green.mypage.vo.MyinformVo;
import com.green.mypage.vo.MypageVo;
import com.green.mypage.vo.MypostVo;
import com.green.mypage.vo.MyquestVo;
import com.green.mypage.vo.UserVo;

@Repository("mypageDao")
public class MypageDaoImpl implements MypageDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public Map<String, Object> getReservList(String email) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<MypageVo>  accomReservList  
		   =  sqlSession.selectList("Mypage.AccomReservList", email);
		List<MypageVo>  trainReservList  
		   =  sqlSession.selectList("Mypage.TrainReservList", email);
		List<MypageVo>  reservDateList = sqlSession.selectList("Mypage.ReservDateList", email);
		map.put("accomReservList", accomReservList);
		map.put("trainReservList", trainReservList);
		map.put("reservDateList", reservDateList);
		return         map;
	}

	@Override
	public MypageVo getReservCont(HashMap <String, Object> map) {

		MypageVo  reservCont  =  sqlSession.selectOne("Mypage.ReservCont", map);
		return         reservCont;
	}
	
	@Override
	public MypageVo getReservCancel(HashMap<String, Object> map) {
		MypageVo  reservVo  =  sqlSession.selectOne("Mypage.CancelCont", map);
		return reservVo;
	}

	@Override
	public void reservCancel(HashMap<String, Object> map) {
		sqlSession.update("Mypage.ReservCancel", map );
		
	}

	@Override
	public List<MypostVo> getMyPostList(String email, Criteria cri) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("email", email);
		map.put("pageNum", cri.getPageNum());
		map.put("amount", cri.getAmount());
		List<MypostVo> myPostList = sqlSession.selectList("Mypage.PostList", map);
		return myPostList;
	}

	@Override
	public void myPostDelete(int bseq) {
		sqlSession.delete("Mypage.PostDelete", bseq);
		
	}

	@Override
	public List<MyquestVo> getMyQuestList(String email) {
		List<MyquestVo> myQuestList = sqlSession.selectList("Mypage.QuestList", email);
		return myQuestList;
	}

	@Override
	public MyinformVo getMyInform(String email) {
		MyinformVo vo = sqlSession.selectOne("Mypage.MyInform", email);
		return vo;
	}

	@Override
	public void myInformUpdate(MyinformVo vo) {
		sqlSession.update("Mypage.InformUpdate", vo);
	}

	@Override
	public List<MypageVo> getMyLogList(HashMap<String, Object> map) {
		List<MypageVo> myLogList = sqlSession.selectList("Mypage.ADateList", map);
		List<MypageVo> myTLogList = sqlSession.selectList("Mypage.TDateList", map);
		myLogList.addAll(myTLogList);
		return myLogList;
	}

	@Override
	public List<MypageVo> getMyTripLog(HashMap<String, Object> map) {
		
		List<MypageVo> myTripLog = sqlSession.selectList("Mypage.ALogList", map);
		List<MypageVo> myTripLogT = sqlSession.selectList("Mypage.TLogList", map);
		myTripLog.addAll(myTripLogT);
		return myTripLog;
	}

	@Override
	public List<UserVo> getUserList() {
		List<UserVo> userList = sqlSession.selectList("Mypage.UserList");
		return userList;
	}

	@Override
	public int getTotalCount(String email) {
		int total = sqlSession.selectOne("Mypage.GetTotalCount", email);
		return total;
	}

	@Override
	public void myQuestDelete(int qseq) {
		sqlSession.delete("Mypage.QuestDelete", qseq);
		
	}

	@Override
	public int rateCal(String email) {
		int rate = sqlSession.selectOne("Mypage.RateCal", email);
		return rate;
	}

	@Override
	public void rateUpdate(String email, String rate) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("email", email);
		map.put("rate", rate);
		sqlSession.update("Mypage.RateUpdate", map);
		
	}

	@Override
	public List<String> getUserEmail() {
		List<String> userEmail = sqlSession.selectList("Mypage.UserEmail");
		return userEmail;
	}







}
