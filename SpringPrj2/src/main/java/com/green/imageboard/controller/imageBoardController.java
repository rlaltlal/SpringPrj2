package com.green.imageboard.controller;

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
import com.green.imageboard.vo.BoardPager;
import com.green.board.vo.BoardVo;
import com.green.imageboard.service.imageBoardService;
import com.green.menus.service.MenuService;
import com.green.user.vo.UserVo;

@Controller
@RequestMapping("/Board/Community")
public class imageBoardController {

	@Autowired
	private MenuService menuService;

	@Autowired
	private imageBoardService imageboardService;
	
	@RequestMapping("/View")
	public ModelAndView commnuity(@RequestParam(defaultValue="title") String searchOption,
			@RequestParam(defaultValue="") String keyword,
			@RequestParam(defaultValue="1") int curPage,@RequestParam HashMap<String,Object> mymap) throws Exception{
		// 레코드의 갯수
		System.out.println(mymap);
		int count = imageboardService.countArticle(searchOption, keyword,mymap);
		System.out.println(count);
		
		// 페이지 나누기 관련 처리
		BoardPager boardPager = new BoardPager(count, curPage);
		int start = boardPager.getPageBegin();
		int end = boardPager.getPageEnd();
		
		// 리스트 전부 
		List<com.green.imageboard.vo.BoardVo> list = imageboardService.listAllCommnuity(start, end, searchOption, keyword,mymap);
		System.out.println(list);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("count", count);		// 리스트
		map.put("list", list);		// 리스트
		map.put("count", count);	// 리스트의 갯수
		map.put("searchOption", searchOption); // 검색 옵션
		map.put("keyword", keyword);	// 검색 키워드
		map.put("boardPager", boardPager);	// 페이지
		map.put("order", mymap.get("order"));	// 페이지
		ModelAndView mv = new ModelAndView();
		mv.addObject("map", map);	    // map에 저장된 데이터 mv에 저장
		mv.setViewName("imageboard/community");   // view를 list.jsp로 설정
		
		
		
		return mv;	//	list.jsp -> List 전달
		
	}

	@RequestMapping("/ImageWriteForm")
//	public  ModelAndView  writeForm( String menu_id ) {
//	public  ModelAndView  writeForm( @RequestParam BoardVo vo	) { 
	// @RequestParam 사용시 BAD REQUEST 400 , @RequestParam 빼고 사용 oK
	public ModelAndView ImagewriteForm(com.green.imageboard.vo.BoardVo vo,HttpSession session) {
		//로그인시에만 가능
		String email=(String)session.getAttribute("email");
		ModelAndView mv = new ModelAndView();
		if(email==null) {
			mv.setViewName("/login");
		}
		else {
			mv.setViewName("imageboard/imagewriteform");
		}
		
		
		if (vo.getBnum() > 0) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("qseq", vo.getQseq());
			vo = imageboardService.getBoard(map);
			vo.setCont(vo.getCont() + "\n====================\n");
		}

		mv.addObject("vo", vo);
		return mv;

	}
	
//	public  ModelAndView  write( @RequestParam BoardVo boardVo ) {
// https://velog.io/@hellozin/RequestParamrequired-false-%EC%A3%BC%EC%9D%98%ED%95%A0-%EC%A0%90
//	https://stackoverflow.com/questions/61520572/spring-throw-bad-request-if-the-request-param-not-available-in-controller-method
	@RequestMapping("/ImageWrite")
	public ModelAndView imagewrite(@RequestParam HashMap<String,Object> map,HttpServletRequest request) {
		// 새글 저장/ 답글 저장
		System.out.println(request);
		imageboardService.myboardInsert(map,request);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Board/Community/View?menu_id=MENU13&order=date");
		return mv;
	}
	
	@RequestMapping("/BoardView")
//	public  ModelAndView   view(String  menu_id, int idx) {
	public ModelAndView view(@RequestParam HashMap<String, Object> map) {
		// HomeController view() map:{menu_id=MENU01, idx=4}


		// qseq 로 조회된 보여줄 항목
		com.green.imageboard.vo.BoardVo boardVo = imageboardService.getBoard(map);
		boardVo.setCont(boardVo.getCont().replace("\n", "<br>"));

		ModelAndView mv = new ModelAndView();
		switch(boardVo.getSubcategory()) {
		case "0": boardVo.setSubcategory("일반"); break;
		case "1": boardVo.setSubcategory("관광 명소"); break;
		case "2": boardVo.setSubcategory("풍경 사진"); break;
		case "3": boardVo.setSubcategory("숙박 시설 사진"); break;
		}                                
		//cont에 cont + 장소가 ","로 묶여있음 split[0] : cont, split[1] : 장소
		
		String []splits=boardVo.getCont().split(",");
		mv.addObject("boardVo", boardVo);
		mv.addObject("cont", splits[0]);
		mv.addObject("spot", splits[1]);
		mv.addObject("map", map);
		System.out.println(boardVo);
		mv.setViewName("imageboard/imageview");
		return mv;
	}
	
	@RequestMapping("/Delete")
	public ModelAndView delete(@RequestParam HashMap<String, Object> map) {
		ModelAndView mv=new ModelAndView();
		imageboardService.deleteBoard(map);
		mv.setViewName("redirect:/Board/Community/View?menu_id=MENU13");
		return mv;
	}

}
