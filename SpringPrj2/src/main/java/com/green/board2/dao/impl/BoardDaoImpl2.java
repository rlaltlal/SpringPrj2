package com.green.board2.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.board2.dao.BoardDao2;
import com.green.board2.vo.BoardVo2;
import com.green.mypage.vo.RecommendVo;


@Repository("boardDao2")
public class BoardDaoImpl2 implements BoardDao2 {

	@Autowired
	private  SqlSession   sqlSession;

	@Override
	public int countArticle(String searchOption, String keyword, String subcate, String menu_id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("subcate", subcate);
		map.put("menu_id", menu_id);
		return sqlSession.selectOne("Board2.countArticle", map);
	}

	@Override
	public List<BoardVo2> listAll(int start, int end, String searchOption, String keyword, String subcate, String menu_id) {
		Map<String, Object> map = new HashMap<String, Object> ();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		map.put("menu_id", menu_id);
		map.put("subcate", subcate);
		return sqlSession.selectList("Board2.listAll", map);
	}

	@Override
	public void boardInsert(BoardVo2 boardVo) {
		sqlSession.insert("Board2.BoardInsert", boardVo);
	}

	@Override
	public BoardVo2 getBoard(HashMap<String, Object> map) {
		// 조회수 증가
		sqlSession.update("Board2.ReadCountUpdate", map );
		
		// idx 로 게시물 조회
		BoardVo2  boardVo = sqlSession.selectOne("Board2.Board", map); 
		map.put("totCnt", 12345);
		return boardVo;
	}

	@Override
	public BoardVo2 getBoard2(HashMap<String, Object> map) {
		// 추천수 증가
		sqlSession.update("Board2.RecommendUpdate", map );
		
		// idx 로 게시물 조회
		BoardVo2  boardVo = sqlSession.selectOne("Board2.Board", map); 
		map.put("totCnt", 12345);
		return boardVo;
	}

	@Override
	public void boardDelete(HashMap<String, Object> map) {
		sqlSession.delete("Board2.BoardDelete", map);
		
	}

	@Override
	public void boardUpdate(HashMap<String, Object> map) {
		sqlSession.update("Board2.BoardUpdate", map );
		
	}

	@Override
	public List<BoardVo2> listAll2(String subcate, String menu_id) {
		Map<String, Object> map = new HashMap<String, Object> ();
		map.put("menu_id", menu_id);
		map.put("subcate", subcate);
		return sqlSession.selectList("Board2.listAll2", map);
	}

	@Override
	public List<RecommendVo> getRecommend(HashMap<String, Object> map) {
		List<RecommendVo> recList = sqlSession.selectList("Board2.recList", map);
		return recList;
	}

	@Override
	public void insertRecommend(HashMap<String, Object> map) {
		sqlSession.insert("Board2.Recommend", map);
	}
	
		



	

}






