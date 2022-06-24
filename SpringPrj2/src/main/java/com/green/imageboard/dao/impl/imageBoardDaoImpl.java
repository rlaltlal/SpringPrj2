package com.green.imageboard.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.board.dao.BoardDao;
import com.green.board.vo.BoardVo;
import com.green.imageboard.dao.imageBoardDao;


@Repository("imageboardDao")
public class imageBoardDaoImpl implements imageBoardDao {

	@Autowired
	private  SqlSession   sqlSession;

	@Override
	public int countArticle(String searchOption, String keyword, HashMap<String, Object> mymap) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return sqlSession.selectOne("imageBoard.countArticleMymap", mymap);
	}

	@Override
	public List<com.green.imageboard.vo.BoardVo> listAllCommunity(int start, int end, String searchOption, String keyword,
			HashMap<String, Object> mymap) {
		Map<String, Object> map = new HashMap<String, Object> ();
		List<com.green.imageboard.vo.BoardVo> list=null;
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		map.put("menu_id", mymap.get("menu_id"));
		if(((String)mymap.get("order")).equals("recomm")) {
			list=sqlSession.selectList("imageBoard.listAllCommunitybyrecomm", map);
			map.put("order", "RECOMMEND DESC ,WRITEDATE DESC ");
		}
		else if(((String)mymap.get("order")).equals("date")) {
			list=sqlSession.selectList("imageBoard.listAllCommunity", map);
			map.put("order", "WRITEDATE DESC,RECOMMEND DESC ");
		}
		System.out.println(map);
		System.out.println("here mymap"+mymap);
		
		return list;
	}


	@Override
	public void myboardInsert(HashMap<String, Object> map) {
		System.out.println(map);
		sqlSession.insert("imageBoard.myboardInsert",map);
		sqlSession.insert("imageBoard.FileInsert",map);
	}

	@Override
	public com.green.imageboard.vo.BoardVo getBoard(HashMap<String, Object> map) {
		System.out.println(map);
		// 조회수 증가
		sqlSession.update("imageBoard.ReadCountUpdate", map );
		
		// idx 로 게시물 조회
		com.green.imageboard.vo.BoardVo  boardVo = sqlSession.selectOne("imageBoard.Board", map); 
		System.out.println("날짜확인용 입니다."+boardVo);
		map.put("totCnt", 12345);
		return   boardVo;
	}


	@Override
	public com.green.imageboard.vo.BoardVo updateRecomm(HashMap<String, Object> map) {
		System.out.println("here is imageBoardDao");
		sqlSession.update("imageBoard.updateRecomm",map);
		com.green.imageboard.vo.BoardVo boardVo=null;
		boardVo=sqlSession.selectOne("imageBoard.Board",map);
		return boardVo;
	}

	@Override
	public void deleteBoard(HashMap<String, Object> map) {
		sqlSession.delete("imageBoard.deleteBoard",map);
	}

	@Override
	public List<com.green.imageboard.vo.BoardVo> imageboardsort(HashMap<String, Object> map) {
		List<com.green.imageboard.vo.BoardVo> list=null;
		if(((String)map.get("sortby")).equals("recomm")) {
			list=sqlSession.selectList("imageBoard.sortbyrecomm",map);
			
		}
		else if(((String)map.get("sortby")).equals("date")) {
			
		}
		return list;
	}


	
	

	


	

	
	











	




	



	



	
	
	



	

}






