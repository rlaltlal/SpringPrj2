package com.green.imageboard.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.board.vo.BoardVo;
import com.green.imageboard.dao.imageBoardDao;
import com.green.imageboard.service.imageBoardService;
import com.green.pds.service.impl.PdsFile;

@Service("imageboardService")
public class imageBoardServiceImpl implements imageBoardService {

	@Autowired
	private  imageBoardDao   imageboardDao;

	@Override
	public int countArticle(String searchOption, String keyword, HashMap<String, Object> mymap) throws Exception {
		return imageboardDao.countArticle(searchOption, keyword,mymap);
	}

	@Override
	public List<com.green.imageboard.vo.BoardVo> listAllCommnuity(int start, int end, String searchOption, String keyword,
			HashMap<String, Object> mymap) throws Exception {
		return imageboardDao.listAllCommunity(start, end, searchOption, keyword,mymap);
	}


	@Override
	public void myboardInsert(HashMap<String, Object> map, HttpServletRequest request) {
		//파일 저장
		com.green.imageboard.service.impl.PdsFile.save(map, request);
		System.out.println("file added");
		//글 저장
		imageboardDao.myboardInsert(map);
	}

	@Override
	public com.green.imageboard.vo.BoardVo getBoard(HashMap<String, Object> map) {
		com.green.imageboard.vo.BoardVo boardVo = imageboardDao.getBoard( map ); 
		return boardVo;
	}



	@Override
	public com.green.imageboard.vo.BoardVo updateRecomm(HashMap<String, Object> map) {
		com.green.imageboard.vo.BoardVo boardVo=null;
		boardVo=imageboardDao.updateRecomm(map);
		return boardVo;
	}

	@Override
	public void deleteBoard(HashMap<String, Object> map) {
		imageboardDao.deleteBoard(map);
		
	}

	@Override
	public List<com.green.imageboard.vo.BoardVo> imageboardsort(HashMap<String, Object> map) {
		List<com.green.imageboard.vo.BoardVo> list=null;
		list=imageboardDao.imageboardsort(map);
		return list;
	}

	


	











}






