package com.green.board.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.board.dao.BoardDao;
import com.green.board.vo.BoardVo;


@Repository("boardDao")
public class BoardDaoImpl implements BoardDao {

	@Autowired
	private  SqlSession   sqlSession;
	
	// 검색옵션, 키워드 맵에 저장
	@Override
	public List<BoardVo> listAll(int start, int end, String searchOption, String keyword) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object> ();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		System.out.println(map);
		return sqlSession.selectList("Board.listAll", map);
	}
	
	// 검색옵션, 키워드 맵에 저장
		@Override
		public List<BoardVo> listAll2(int start, int end, String searchOption, String keyword) throws Exception {
			
			Map<String, Object> map = new HashMap<String, Object> ();
			map.put("searchOption", searchOption);
			map.put("keyword", keyword);
			map.put("start", start);
			map.put("end", end);
			return sqlSession.selectList("Board.listAll2", map);
		}
	
	// 게시물 갯수
	@Override
	public int countArticle(String searchOption, String keyword) throws Exception {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return sqlSession.selectOne("Board.countArticle", map);
	}
	
	// 게시물 갯수2
		@Override
		public int countArticle2(String searchOption, String keyword) throws Exception {
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("searchOption", searchOption);
			map.put("keyword", keyword);
			return sqlSession.selectOne("Board.countArticle2", map);
		}
	
	@Override
	public void boardInsert(BoardVo boardVo) {
		int bnum = boardVo.getBnum();
		if(bnum == 0) { // 새글쓰기
			sqlSession.insert("Board.BoardInsert", boardVo);
		} 
		
	}
	
	@Override
	public void boardInsert2(BoardVo boardVo) {
		System.out.println("boardVo : " + boardVo);
		int bnum = boardVo.getBnum();
		if(bnum == 0) { // 새글쓰기
			sqlSession.insert("Board.BoardInsert2", boardVo);
		} else {        // 답글 쓰기
			sqlSession.update("Board.UpdateRef",   boardVo);
			sqlSession.insert("Board.BoardReply",  boardVo);
		}
		
	}

	
	@Override
	public BoardVo getBoard(HashMap<String, Object> map) {
		// 조회수 증가
		sqlSession.update("Board.ReadCountUpdate", map );
		
		// idx 로 게시물 조회
		BoardVo  boardVo = sqlSession.selectOne("Board.Board", map); 
		map.put("totCnt", 12345);
		return   boardVo;
		
	}
	
	@Override
	public BoardVo getBoard2(HashMap<String, Object> map) {
		// 조회수 증가
		sqlSession.update("Board.ReadCountUpdate", map );
		
		// idx 로 게시물 조회
		BoardVo  boardVo = sqlSession.selectOne("Board.Board2", map); 
		map.put("totCnt", 12345);
		return   boardVo;
		
	}
	 

	@Override
	public void boardUpdate(HashMap<String, Object> map) {
		
		sqlSession.update("Board.BoardUpdate", map );
		
	}
	
	@Override
	public void boardUpdate2(HashMap<String, Object> map) {
		
		sqlSession.update("Board.BoardUpdate2", map );
		
	}

	@Override
	public void boardDelete(HashMap<String, Object> map) {
		
		sqlSession.delete("Board.BoardDelete", map);
		
	}
	
	@Override
	public void boardDelete2(HashMap<String, Object> map) {
		
		sqlSession.delete("Board.BoardDelete2", map);
		
	}

	@Override
	public int countArticle(String searchOption, String keyword, HashMap<String, Object> mymap) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return sqlSession.selectOne("Board.countArticleMymap", mymap);
	}

	@Override
	public List<BoardVo> listAllCommunity(int start, int end, String searchOption, String keyword,
			HashMap<String, Object> mymap) {
		Map<String, Object> map = new HashMap<String, Object> ();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		System.out.println(map);
		return sqlSession.selectList("Board.listAllCommunity", mymap);
	}


	@Override
	public void myboardInsert(HashMap<String, Object> map) {
		sqlSession.insert("Board.myboardInsert",map);
	}

	@Override
	public void boardUpdate3(int qseq) {
		sqlSession.insert("Board.BoardUpdate3", qseq);
		
	}

	@Override
	public BoardVo getBoard3(int nref) {
		BoardVo boardVo = sqlSession.selectOne("Board.Board3", nref);
		return boardVo;
	}


	
	

	


	

	
	











	




	



	



	
	
	



	

}






