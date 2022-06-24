package com.green.board.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.board.dao.BoardDao;
import com.green.board.service.BoardService;
import com.green.board.vo.BoardVo;
import com.green.pds.service.impl.PdsFile;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private  BoardDao   boardDao;

	@Override
	public List<BoardVo> listAll(int start, int end, String searchOption, String keyword) throws Exception {
		
		return boardDao.listAll(start, end, searchOption, keyword);
	}
	
	@Override
	public List<BoardVo> listAll2(int start, int end, String searchOption, String keyword) throws Exception {
		
		return boardDao.listAll2(start, end, searchOption, keyword);
	}

	@Override
	public int countArticle(String searchOption, String keyword) throws Exception {
		
		return boardDao.countArticle(searchOption, keyword);
	}
	
	@Override
	public int countArticle2(String searchOption, String keyword) throws Exception {
		
		return boardDao.countArticle2(searchOption, keyword);
	}
	
	
	@Override
	public void boardInsert(BoardVo boardVo) {

		boardDao.boardInsert( boardVo );

	}

	@Override
	public void boardInsert2(BoardVo boardVo) {
		System.out.println("boardVo2 : " + boardVo);
		boardDao.boardInsert2( boardVo );

	}


	@Override public BoardVo getBoard(HashMap<String, Object> map) {

		BoardVo boardVo = boardDao.getBoard( map ); return boardVo;

	}

	@Override public BoardVo getBoard2(HashMap<String, Object> map) {

		BoardVo boardVo = boardDao.getBoard2( map ); return boardVo;

	}


	@Override
	public void boardUpdate(HashMap<String, Object> map) {

		boardDao.boardUpdate( map );

	}

	@Override
	public void boardUpdate2(HashMap<String, Object> map) {

		boardDao.boardUpdate2( map );

	}

	@Override
	public void boardDelete(HashMap<String, Object> map) {

		boardDao.boardDelete( map ) ;

	}

	@Override
	public void boardDelete2(HashMap<String, Object> map) {

		boardDao.boardDelete2( map ) ;

	}

	@Override
	public int countArticle(String searchOption, String keyword, HashMap<String, Object> mymap) throws Exception {
		return boardDao.countArticle(searchOption, keyword,mymap);
	}

	@Override
	public List<BoardVo> listAllCommnuity(int start, int end, String searchOption, String keyword,
			HashMap<String, Object> mymap) throws Exception {
		return boardDao.listAllCommunity(start, end, searchOption, keyword,mymap);
	}


	@Override
	public void myboardInsert(HashMap<String, Object> map, HttpServletRequest request) {
		//파일 저장
		PdsFile.save(map, request);
		//글 저장
		boardDao.myboardInsert(map);
	}

	@Override
	public void boardUpdate3(int qseq) {
		boardDao.boardUpdate3(qseq);
	}

	@Override
	public BoardVo getBoard3(int nref) {
		BoardVo boardVo = boardDao.getBoard3(nref);
		return boardVo;
	}

	


	











}






