package com.green.board2.service;

import java.util.HashMap;
import java.util.List;

import com.green.board2.vo.BoardVo2;
import com.green.mypage.vo.RecommendVo;

public interface BoardService2 {

	int countArticle(String searchOption, String keyword, String subcate, String menu_id);

	List<BoardVo2> listAll(int start, int end, String searchOption, String keyword, String subcate, String menu_id);

	void boardInsert(BoardVo2 boardVo);

	BoardVo2 getBoard(HashMap<String, Object> map);

	BoardVo2 getBoard2(HashMap<String, Object> map);

	void boardDelete(HashMap<String, Object> map);

	void boardUpdate(HashMap<String, Object> map);


	List<BoardVo2> listAll2(String subcate, String menu_id);

	List<RecommendVo> getRecommend(HashMap<String, Object> map);

	void insertRecommend(HashMap<String, Object> map);



	
	
	
	
	

}
