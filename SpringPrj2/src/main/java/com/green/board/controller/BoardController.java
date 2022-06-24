package com.green.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.green.board.service.BoardService;
import com.green.board.vo.BoardPager;
import com.green.board.vo.BoardVo;
import com.green.menus.service.MenuService;
import com.green.user.vo.UserVo;

@Controller
@RequestMapping("/Board")
public class BoardController {

	@Autowired
	private MenuService menuService;

	@Autowired
	private BoardService boardService;

	

	@RequestMapping("/List")
	public ModelAndView list(@RequestParam(defaultValue="title") String searchOption,
			@RequestParam(defaultValue="") String keyword,
			@RequestParam(defaultValue="1") int curPage, HttpSession session) throws Exception{
		UserVo vo=(UserVo)session.getAttribute("login");
		// 레코드의 갯수
		int count = boardService.countArticle(searchOption, keyword);
		
		// 페이지 나누기 관련 처리
		BoardPager boardPager = new BoardPager(count, curPage);
		int start = boardPager.getPageBegin();
		int end = boardPager.getPageEnd();
		
		// 리스트 전부 
		List<BoardVo> list = boardService.listAll(start, end, searchOption, keyword);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);		// 리스트
		map.put("count", count);	// 리스트의 갯수
		map.put("searchOption", searchOption); // 검색 옵션
		map.put("keyword", keyword);	// 검색 키워드
		map.put("boardPager", boardPager);	// 페이지
		ModelAndView mv = new ModelAndView();
		mv.addObject("map", map);	    // map에 저장된 데이터 mv에 저장
		if(vo==null) {

		}
		else {
			mv.addObject("vo",vo);
		}
		mv.setViewName("board/list");   // view를 list.jsp로 설정
		
		
		return mv;	//	list.jsp -> List 전달
		
	}
	
	@RequestMapping("/List2")
	public ModelAndView list2(@RequestParam(defaultValue="title") String searchOption,
			@RequestParam(defaultValue="") String keyword,
			@RequestParam(defaultValue="1") int curPage) throws Exception{
		
		// 레코드의 갯수
		int count = boardService.countArticle2(searchOption, keyword);
		
		// 페이지 나누기 관련 처리
		BoardPager boardPager = new BoardPager(count, curPage);
		int start = boardPager.getPageBegin();
		int end = boardPager.getPageEnd();
		
		// 리스트 전부 
		List<BoardVo> list2 = boardService.listAll2(start, end, searchOption, keyword);
		System.out.println(searchOption);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list2", list2);		// 리스트
		map.put("count", count);	// 리스트의 갯수
		map.put("searchOption", searchOption); // 검색 옵션
		map.put("keyword", keyword);	// 검색 키워드
		map.put("boardPager", boardPager);	// 페이지
		ModelAndView mv = new ModelAndView();
		mv.addObject("map", map);	    // map에 저장된 데이터 mv에 저장
		mv.setViewName("board/list2");   // view를 list.jsp로 설정
		
		
		
		return mv;	//	list.jsp -> List 전달
		
	}
	
		

	@RequestMapping("/WriteForm")
//	public  ModelAndView  writeForm( String menu_id ) {
//	public  ModelAndView  writeForm( @RequestParam BoardVo vo	) { 
	// @RequestParam 사용시 BAD REQUEST 400 , @RequestParam 빼고 사용 oK
	public ModelAndView writeForm(BoardVo vo,HttpSession session) {

		if (vo.getBnum() > 0) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("qseq", vo.getQseq());
			vo = boardService.getBoard(map);
			vo.setCont(vo.getCont() + "\n====================\n");
		}

		System.out.println(vo.toString());
		String email=(String)session.getAttribute("email");
		ModelAndView mv = new ModelAndView();
		if(email==null) {
			mv.setViewName("/login");
		}
		else {
			mv.setViewName("board/write");
			mv.addObject("vo", vo);
		}
		return mv;

	}
	
	@RequestMapping("/WriteForm2")
//	public  ModelAndView  writeForm( String menu_id ) {
//	public  ModelAndView  writeForm( @RequestParam BoardVo vo	) { 
	// @RequestParam 사용시 BAD REQUEST 400 , @RequestParam 빼고 사용 oK
	public ModelAndView writeForm2(BoardVo vo) {

		if (vo.getBnum() > 0) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("qseq", vo.getQseq());
			vo = boardService.getBoard2(map);
			vo.setCont(vo.getCont() + "\n====================\n");
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", vo);
		mv.addObject("qseq", vo.getQseq());
		mv.setViewName("board/write2");
		return mv;

	}

	// /Board/Write
	// menu_id, title, writer, cont, + bnum, lvl, step, nref
	@RequestMapping("/Write")
//	public  ModelAndView  write( @RequestParam BoardVo boardVo ) {
// https://velog.io/@hellozin/RequestParamrequired-false-%EC%A3%BC%EC%9D%98%ED%95%A0-%EC%A0%90
//	https://stackoverflow.com/questions/61520572/spring-throw-bad-request-if-the-request-param-not-available-in-controller-method
	public ModelAndView write(BoardVo boardVo,HttpSession session) {
		// 새글 저장/ 답글 저장
		
		boardService.boardInsert(boardVo);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Board/List");
		return mv;
	}
	
	@RequestMapping("/Write2")
//	public  ModelAndView  write( @RequestParam BoardVo boardVo ) {
// https://velog.io/@hellozin/RequestParamrequired-false-%EC%A3%BC%EC%9D%98%ED%95%A0-%EC%A0%90
//	https://stackoverflow.com/questions/61520572/spring-throw-bad-request-if-the-request-param-not-available-in-controller-method
	public ModelAndView write2(BoardVo boardVo, int qseq) {
		System.out.println("cont write2 : " + boardVo);
		// 새글 저장/ 답글 저장
		boardService.boardInsert2(boardVo);
		boardService.boardUpdate3(qseq);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Board/List2?page=1&perPageNum=5&searchType=&keyword=");
		return mv;
	}

	@RequestMapping("/View")
//	public  ModelAndView   view(String  menu_id, int idx) {
	public ModelAndView view(@RequestParam HashMap<String, Object> map) {
		// HomeController view() map:{menu_id=MENU01, idx=4}


		// qseq 로 조회된 보여줄 항목
		BoardVo boardVo = boardService.getBoard(map);
		boardVo.setCont(boardVo.getCont().replace("\n", "<br>"));

		ModelAndView mv = new ModelAndView();
		mv.addObject("boardVo", boardVo);
		mv.setViewName("board/view");
		return mv;
	}
	
	@RequestMapping("/View2")
//	public  ModelAndView   view(String  menu_id, int idx) {
	public ModelAndView view2(@RequestParam HashMap<String, Object> map) {
		// HomeController view() map:{menu_id=MENU01, idx=4}


		// qseq 로 조회된 보여줄 항목
		BoardVo boardVo = boardService.getBoard2(map);
		boardVo.setCont(boardVo.getCont().replace("\n", "<br>"));
		ModelAndView mv = new ModelAndView();
		System.out.println(boardVo);
		mv.addObject("boardVo", boardVo);
		mv.setViewName("board/view2");
		return mv;
	}

	@RequestMapping("/View3")
	public ModelAndView view3(int nref) {

		BoardVo boardVo = boardService.getBoard3(nref);
		boardVo.setCont(boardVo.getCont().replace("\n", "<br>"));
		ModelAndView mv = new ModelAndView();
		System.out.println(boardVo);
		mv.addObject("boardVo", boardVo);
		mv.setViewName("board/view2");
		return mv;
	}
	
	// http://localhost:9090/Board/Delete?idx=7&menu_id=MENU03
	// /Board/Delete?idx=5&menu_id=MENU01"
	@RequestMapping("/Delete")
	public ModelAndView delete(@RequestParam HashMap<String, Object> map) {

		// idx 해당 글 삭제
		boardService.boardDelete(map);

		String menu_id = (String) map.get("menu_id");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Board/List?page=1&perPageNum=5&searchType=&keyword=" );
		return mv;

	}
	
	@RequestMapping("/Delete2")
	public ModelAndView delete2(@RequestParam HashMap<String, Object> map) {

		// idx 해당 글 삭제
		boardService.boardDelete2(map);

		String menu_id = (String) map.get("menu_id");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Board/List2?menu_id=" + menu_id);
		return mv;

	}

	// /Board/UpdateForm?idx=5&menu_id=MENU01
	@RequestMapping("/UpdateForm")
	public ModelAndView updateForm(@RequestParam HashMap<String, Object> map) {



		String menu_id = (String) map.get("menu_id");

		// 수정할 자료를 idx 로 조회
		BoardVo boardVo = boardService.getBoard(map);

		ModelAndView mv = new ModelAndView();
		mv.addObject("menu_id", menu_id);
		mv.addObject("boardVo", boardVo);
		mv.setViewName("board/update");
		return mv;
	}
	
	@RequestMapping("/UpdateForm2")
	public ModelAndView updateForm2(@RequestParam HashMap<String, Object> map) {


		String menu_id = (String) map.get("menu_id");

		// 수정할 자료를 idx 로 조회
		BoardVo boardVo = boardService.getBoard2(map);

		ModelAndView mv = new ModelAndView();
		mv.addObject("menu_id", menu_id);
		mv.addObject("boardVo", boardVo);
		mv.setViewName("board/update2");
		return mv;
	}

	// /Board/Update {idx, menu_id, title, cont }
	@RequestMapping("/Update")
	public ModelAndView update(@RequestParam HashMap<String, Object> map) {

		boardService.boardUpdate(map);

		String menu_id = (String) map.get("menu_id");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Board/List?page=1&perPageNum=5&searchType=&keyword=");
		return mv;

	}
	
	@RequestMapping("/Update2")
	public ModelAndView update2(@RequestParam HashMap<String, Object> map) {

		// System.out.println("map:" + map);
		// 수정
		boardService.boardUpdate2(map);

		String menu_id = (String) map.get("menu_id");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Board/List2?menu_id=" + menu_id);
		return mv;

	}


}
