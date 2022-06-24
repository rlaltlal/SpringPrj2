package com.green.user.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.user.dao.UserDao;
import com.green.user.vo.AccomInformVo;
import com.green.user.vo.TrainInformVo;
import com.green.user.vo.UserVo;

@Repository("userDao")
public class UserDaoImpl implements UserDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<UserVo> getUserList() {
		List<UserVo> list=sqlSession.selectList("User.UserList");
		return list;
	}

	@Override
	public UserVo getView(String id) {
		UserVo vo=null;
		vo=sqlSession.selectOne("User.getView", id);
		return vo;
	}

	@Override
	public List<UserVo> getViewName(String name) {
		List<UserVo> list=null;
		list=sqlSession.selectList("User.getViewName", name);
		return list;
	}

	@Override
	public UserVo login(HashMap<String,Object> map) {
		UserVo vo=null;
		vo=sqlSession.selectOne("User.login",map);
		return vo;		
	}

	@Override
	public void insertReserv(HashMap<String, Object> map) {
		//왕복 편도 확인 & 날짜 String 처리
		String round=(String)map.get("onewayorround");
		String arrdate=(String)map.get("arrdate");
		String list2depPlandTime=(String)map.get("list2depPlandTime");
		arrdate+=' ';
		arrdate+=list2depPlandTime;
		map.put("arrdate", arrdate);
		String depdate=(String)map.get("depdate");
		String list1depPlandTime=(String)map.get("list1depPlandTime");
		depdate+=' ';
		depdate+=list1depPlandTime;
		map.put("depdate", depdate);		
		
		//사람수만큼 seat insert & trainseat split
		String seatcount=(String)map.get("formlist1seatcount");
		String trainseat=(String)map.get("list1trainseat");
		String[] trainseats=trainseat.split(",");
		System.out.println("map :" + map);
		sqlSession.insert("User.insertReserv",map);
		for(int i=0;i<Integer.parseInt(seatcount);i++) {
			map.put("list1trainseat", trainseats[i]);
			sqlSession.insert("User.insertReservseat",map);
			if(i!=(Integer.parseInt(seatcount)-1)) {
				map.put("list1trainseat", trainseats[i+1]);
			}
		}
		
		if(round.equals("왕복")) {

			//사람수만큼 seat insert & trainseat split
			String trainseatround=(String)map.get("list2trainseat");
			String[] trainseatsround=trainseatround.split(",");
			sqlSession.insert("User.insertReservRound",map);
			for(int i=0;i<Integer.parseInt(seatcount);i++) {
				map.put("list2trainseat", trainseatsround[i]);
				sqlSession.insert("User.insertReservseatRound",map);
				if(i!=(Integer.parseInt(seatcount)-1)) {
					map.put("list2trainseat", trainseatsround[i+1]);
				}
			}
		}
	}

	@Override
	public List<TrainInformVo> getTrainInform(HashMap<String, Object> map) {
		List<TrainInformVo> list=null;
		list=sqlSession.selectList("User.getTrainInform",map);
		return list;
	}


	@Override
	public void insertAccomReserv(HashMap<String, Object> map) {		
		String str = (String)map.get("room");
		str.trim();
		map.put("room", str);
		System.out.println("map : " + map);
		sqlSession.insert("User.insertAccomReserv", map);
		sqlSession.insert("User.insertAccomReservroom", map);
	}

	
	@Override
	public List<AccomInformVo> getAccomInfrom(HashMap<String, Object> map) {
		List<AccomInformVo> list = null;
		list = sqlSession.selectList("User.getAccomInform", map);
		return list;
	}

}
