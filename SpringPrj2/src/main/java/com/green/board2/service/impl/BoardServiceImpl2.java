package com.green.board2.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.board2.dao.BoardDao2;
import com.green.board2.service.BoardService2;
import com.green.board2.vo.BoardVo2;
import com.green.mypage.vo.RecommendVo;

@Service("boardService2")
public class BoardServiceImpl2 implements BoardService2 {

	@Autowired
	private  BoardDao2   boardDao;

	@Override
	public int countArticle(String searchOption, String keyword, String subcate, String menu_id) {
		int count = boardDao.countArticle(searchOption, keyword, subcate, menu_id);
		return count;
	}



	@Override
	public void boardInsert(BoardVo2 boardVo) {
		boardDao.boardInsert(boardVo);

	}

	@Override
	public BoardVo2 getBoard(HashMap<String, Object> map) {
		BoardVo2 boardVo = boardDao.getBoard(map);
		return boardVo;
	}

	@Override
	public BoardVo2 getBoard2(HashMap<String, Object> map) {
		BoardVo2 boardVo = boardDao.getBoard2(map);
		return boardVo;
	}

	@Override
	public void boardDelete(HashMap<String, Object> map) {
		boardDao.boardDelete( map ) ;
		
	}

	@Override
	public void boardUpdate(HashMap<String, Object> map) {
		boardDao.boardUpdate(map);
		
	}
	@Override
	public List<BoardVo2> listAll(int start, int end, String searchOption, String keyword, String subcate, String menu_id) {
		List<BoardVo2> list = boardDao.listAll(start, end, searchOption, keyword, subcate, menu_id);
		return list;
	}
	
	@Override
	public List<BoardVo2> listAll2(String subcate, String menu_id) {
		List<BoardVo2> list2 = boardDao.listAll2(subcate, menu_id);
		return list2;
	}



	@Override
	public List<RecommendVo> getRecommend(HashMap<String, Object> map) {
		List<RecommendVo> recList = boardDao.getRecommend(map);
		return recList;
	}



	@Override
	public void insertRecommend(HashMap<String, Object> map) {
		boardDao.insertRecommend(map);
	}









	

	

}









