package com.green.imageboard.dao;

import java.util.HashMap;
import java.util.List;

import com.green.board.vo.BoardVo;


public interface imageBoardDao {
	int countArticle(String searchOption, String keyword, HashMap<String, Object> mymap);
	List<com.green.imageboard.vo.BoardVo> listAllCommunity(int start, int end, String searchOption, String keyword,
			HashMap<String, Object> mymap);
	void myboardInsert(HashMap<String, Object> map);
	com.green.imageboard.vo.BoardVo getBoard(HashMap<String, Object> map);
	com.green.imageboard.vo.BoardVo updateRecomm(HashMap<String, Object> map);
	void deleteBoard(HashMap<String, Object> map);
	List<com.green.imageboard.vo.BoardVo> imageboardsort(HashMap<String, Object> map);
	
}
