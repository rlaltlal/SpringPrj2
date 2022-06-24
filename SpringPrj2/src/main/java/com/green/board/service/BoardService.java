package com.green.board.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.green.board.vo.BoardVo;

public interface BoardService {

	/* List<BoardVo> getBoardList(String menu_id); */
	
	/* List<BoardVo> selectSearchList(BoardVo boardvo); */
	
	void boardInsert(BoardVo boardVo);
	void boardInsert2(BoardVo boardVo);
	
	BoardVo getBoard(HashMap<String, Object> map);
	BoardVo getBoard2(HashMap<String, Object> map);

	void boardUpdate(HashMap<String, Object> map);
	void boardUpdate2(HashMap<String, Object> map);

	void boardDelete(HashMap<String, Object> map);
	void boardDelete2(HashMap<String, Object> map);
	
	
	// 게시물 전체 목록
	public List<BoardVo> listAll(int start, int end, String searchOption, String keyword) throws Exception;
	public List<BoardVo> listAll2(int start, int end, String searchOption, String keyword) throws Exception;
	
	// 게시물 갯수
	public int countArticle(String searchOption, String keyword) throws Exception;
	
	// 게시물 갯수2
	public int countArticle2(String searchOption, String keyword) throws Exception;
	
	
	int countArticle(String searchOption, String keyword, HashMap<String, Object> mymap) throws Exception;
	List<BoardVo> listAllCommnuity(int start, int end, String searchOption, String keyword,
			HashMap<String, Object> mymap) throws Exception;
	void myboardInsert(HashMap<String, Object> map, HttpServletRequest request);
	void boardUpdate3(int qseq);
	BoardVo getBoard3(int nref);
	
	
	

}
