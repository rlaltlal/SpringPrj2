package com.green.imageboard.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.green.imageboard.vo.BoardVo;

public interface imageBoardService {

	/* List<BoardVo> getBoardList(String menu_id); */
	
	/* List<BoardVo> selectSearchList(BoardVo boardvo); */
	
	
	int countArticle(String searchOption, String keyword, HashMap<String, Object> mymap) throws Exception;
	List<BoardVo> listAllCommnuity(int start, int end, String searchOption, String keyword,
			HashMap<String, Object> mymap) throws Exception;
	void myboardInsert(HashMap<String, Object> map, HttpServletRequest request);
	BoardVo getBoard(HashMap<String, Object> map);
	BoardVo updateRecomm(HashMap<String, Object> map);
	void deleteBoard(HashMap<String, Object> map);
	List<BoardVo> imageboardsort(HashMap<String, Object> map);

	
	
	

}
