package com.green.board2.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.green.board2.service.BoardService2;
import com.green.board2.vo.BoardPager2;
import com.green.board2.vo.BoardVo2;
import com.green.mypage.vo.RecommendVo;


@Controller
@RequestMapping("/Board2")
public class BoardController2 {

	@Autowired
	private BoardService2 boardService;

	
	@RequestMapping("/WriteForm")
	public ModelAndView writeForm(String email, String menu_id) {

		ModelAndView mv = new ModelAndView();
		mv.addObject("email", email);
		mv.addObject("menu_id", menu_id);
		mv.setViewName("board2/write");
		return mv;

	}

	@RequestMapping("/Write")
	public String write(BoardVo2 boardVo) {
	//	System.out.println(boardVo);
		boardService.boardInsert(boardVo);
		String  re = "redirect:/";
		if(boardVo.getMenu_id().equals("MENU03") ) {
			re = "redirect:/Board2/Trlist?menu_id=MENU03";
		}
		if(boardVo.getMenu_id().equals("MENU04") ) {
			re = "redirect:/Board2/Trlist?menu_id=MENU04";
		}
		if(boardVo.getMenu_id().equals("MENU05") ) {
			re = "redirect:/Board2/Trlist?menu_id=MENU05";
		}
		
		return re;
	}	

	
	@RequestMapping("/View")
	public ModelAndView view(@RequestParam HashMap<String, Object> map) {
		BoardVo2 boardVo = boardService.getBoard(map);
		List<RecommendVo> recList = boardService.getRecommend(map);
		boardVo.setCont(boardVo.getCont().replace("\n", "<br>"));
		ModelAndView mv = new ModelAndView();
		mv.addObject("boardVo", boardVo);
		mv.addObject("recList", recList);
		mv.setViewName("board2/view");
		return mv;
	}
	
	@RequestMapping("/Recommend")
	public ModelAndView recommend(@RequestParam HashMap<String, Object> map) {
		BoardVo2 boardVo = boardService.getBoard2(map);
		boardService.insertRecommend(map);
		List<RecommendVo> recList = boardService.getRecommend(map);
		boardVo.setCont(boardVo.getCont().replace("\n", "<br>"));
		ModelAndView mv = new ModelAndView();
		mv.addObject("boardVo", boardVo);
		mv.addObject("recList", recList);
		mv.setViewName("board2/view");
		return mv;
	}
	
	@RequestMapping("/Delete")
	public String delete(@RequestParam HashMap<String, Object> map) {

		// idx 해당 글 삭제
		boardService.boardDelete(map);

		String menu_id = (String) map.get("menu_id");
		String  re = "redirect:/";
		if(menu_id.equals("MENU03") ) {
			re = "redirect:/Board2/Trlist?menu_id=MENU03";
		}
		if(menu_id.equals("MENU04") ) {
			re = "redirect:/Board2/Trlist?menu_id=MENU04";
		}
		if(menu_id.equals("MENU05") ) {
			re = "redirect:/Board2/Trlist?menu_id=MENU05";
		}
		return re;

	}
	
	@RequestMapping("/UpdateForm")
	public ModelAndView updateForm(@RequestParam HashMap<String, Object> map) {
		String menu_id = (String) map.get("menu_id");

		// 수정할 자료를 idx 로 조회
		BoardVo2 boardVo = boardService.getBoard(map);

		ModelAndView mv = new ModelAndView();
		mv.addObject("menu_id", menu_id);
		mv.addObject("boardVo", boardVo);
		mv.setViewName("board2/update");
		return mv;
	}
	
	@RequestMapping("/Update")
	public ModelAndView update(@RequestParam HashMap<String, Object> map) {

		boardService.boardUpdate(map);
		
		BoardVo2 boardVo = boardService.getBoard(map);
		boardVo.setCont(boardVo.getCont().replace("\n", "<br>"));
		System.out.println(boardVo);

		ModelAndView mv = new ModelAndView();
		mv.addObject("boardVo", boardVo);
		mv.setViewName("board2/view");
		return mv;

	}	
	
	@RequestMapping("/Trlist")
	public ModelAndView list(@RequestParam(defaultValue="title") String searchOption,
			@RequestParam(defaultValue="") String keyword, String menu_id,
			@RequestParam(defaultValue="1") int curPage, String subcate) throws Exception{
		
		// 레코드의 갯수
		int count = boardService.countArticle(searchOption, keyword, subcate, menu_id);
		
		// 페이지 나누기 관련 처리
		BoardPager2 boardPager = new BoardPager2(count, curPage);
		int start = boardPager.getPageBegin();
		int end = boardPager.getPageEnd();
		
		// 리스트 전부 
		List<BoardVo2> list = boardService.listAll(start, end, searchOption, keyword, subcate, menu_id);
		List<BoardVo2> list2 = boardService.listAll2(subcate, menu_id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("menu_id", menu_id);
		map.put("subcate", subcate);
		map.put("list", list);		// 리스트
		map.put("list2", list2);		// 리스트
		map.put("count", count);	// 리스트의 갯수
		map.put("searchOption", searchOption); // 검색 옵션
		map.put("keyword", keyword);	// 검색 키워드
		map.put("boardPager", boardPager);	// 페이지
		ModelAndView mv = new ModelAndView();
		mv.addObject("map", map);	    // map에 저장된 데이터 mv에 저장
		if (menu_id.equals("MENU03")) {
			  mv.setViewName("board2/trboard"); }
		if (menu_id.equals("MENU04")) {
			  mv.setViewName("board2/tipboard"); }
		if (menu_id.equals("MENU05")) {
			  mv.setViewName("board2/freeboard"); }		
		
		
		
		return mv;	
	}
	
}
