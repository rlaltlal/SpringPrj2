package com.green.board.dao;

import java.util.HashMap;
import java.util.List;

import com.green.board.vo.BoardVo;


public interface BoardDao {

	
	
	void boardInsert(BoardVo boardVo);
	void boardInsert2(BoardVo boardVo);
	
	
	
	BoardVo getBoard(HashMap<String, Object> map); 
	BoardVo getBoard2(HashMap<String, Object> map); 

	void boardUpdate(HashMap<String, Object> map);
	void boardUpdate2(HashMap<String, Object> map);

	void boardDelete(HashMap<String, Object> map);
	void boardDelete2(HashMap<String, Object> map);
	
	
	// 게시물 목록 조회
	List<BoardVo> listAll(int start, int end, String searchOption, String keyword) throws Exception; 
	List<BoardVo> listAll2(int start, int end, String searchOption, String keyword) throws Exception; 
	
	//게시글 갯수
	public int countArticle(String searchOption, String keyword) throws Exception;
	public int countArticle2(String searchOption, String keyword) throws Exception;
	
	
	int countArticle(String searchOption, String keyword, HashMap<String, Object> mymap);
	List<BoardVo> listAllCommunity(int start, int end, String searchOption, String keyword,
			HashMap<String, Object> mymap);
	void myboardInsert(HashMap<String, Object> map);
	void boardUpdate3(int qseq);
	BoardVo getBoard3(int nref);
	  
	

}
