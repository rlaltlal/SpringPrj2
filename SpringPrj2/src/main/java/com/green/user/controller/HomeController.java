package com.green.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.green.board2.service.BoardService2;
import com.green.board2.vo.BoardVo2;
import com.green.user.service.LoginService;
import com.green.user.service.UserService;
import com.green.user.vo.UserVo;

@Controller
public class HomeController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private  LoginService loginService;
	
	@Autowired
	private BoardService2 boardService;
   
	@RequestMapping("/")
	public ModelAndView home( @RequestParam HashMap<String,Object> map) {
		List<BoardVo2> list2 = boardService.listAll2("", "MENU03");
		List<BoardVo2> list3 = boardService.listAll2("SEOUL", "MENU03");
		List<BoardVo2> list4 = boardService.listAll2("BUSAN", "MENU03");
		List<BoardVo2> list5 = boardService.listAll2("JEJU", "MENU03");
		List<BoardVo2> list6 = boardService.listAll2("ETC", "MENU03");
		

		ModelAndView mv=new ModelAndView();
		mv.setViewName("home");
		map.put("list2", list2);		// 리스트
		map.put("list3", list3);		// 리스트
		map.put("list4", list4);		// 리스트
		map.put("list5", list5);		// 리스트
		map.put("list6", list6);		// 리스트
		mv.addObject("map",map);
		
//		if(vo==null) {
//			
//		}
//		else {
//			mv.addObject("vo",vo);
//			
//		}
		//mv.addObject("sessionScope",vo.getEmail());
		return mv; 
	}
	@RequestMapping("/login")
	public String login() {
		return "login"; //로그인 성공시 홈으로 그냥 이동
	}                   //실패시 로그인 화면 그대로&로그인 실패 팝업창
	
	@RequestMapping("/submit")
	public String submit() {
		return "submit"; 
	}
	@RequestMapping("/mypage")
	public String mypage() {
		return "mypage"; 
	}
	
	@RequestMapping("/findpassword")
	public String findpassword() {
		return "findpassword"; 
	}
		
	//로그인---------------------------------------------------------
	@RequestMapping("/loginProcess")
	public  ModelAndView  loginProcess(
			RedirectAttributes rttr,HttpServletRequest request,
		@RequestParam   HashMap<String, Object> map) {
		HttpSession     session=request.getSession();
		ModelAndView mv=new ModelAndView();
		 String returnURL = "";
		 if( session.getAttribute("login") != null ) {
			 //기존 login 이란 session 에 값이 존재한다면
			//session.removeAttribute("login");  // 기존값을 제거한다
		}
		
		// 로그인을 성공하면 UserVo 객체를 반환함
		UserVo  vo  = loginService.login( map );
		if ( vo != null ) {
			session.setAttribute("email", vo.getEmail());
			session.setAttribute("nickname", vo.getNickname());
			session.setAttribute("rate", vo.getRate());
			session.setAttribute("regdate", vo.getRegdate());
			returnURL = "redirect:/";        // 로그인 성공시
		} else {
			session.setAttribute("login", null);
			rttr.addFlashAttribute("msg",false);
			returnURL = "redirect:/login";	 // 로그인 실패시
		}	
		mv.setViewName(returnURL);
		return mv;		
	}
	
	
	// 로그아웃
	@RequestMapping("/logoutProcess") 
	public  String  logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";  // 로그아웃시 이동할 주소 -> /login
	}
	
	//회원가입---------------------------------------------------------
		@RequestMapping(value = "/submitProcess", method = RequestMethod.GET) 
		public String getSubmit(@RequestParam   HashMap<String, Object> map) {
			loginService.submit( map );
			return "redirect:/";
		}
	      
		@RequestMapping(value = "/submitProcess", method = RequestMethod.POST) 
		public String postSubmit(@RequestParam   HashMap<String, Object> map) {
			loginService.submit( map );	
			
			return "redirect:/";
		}

	@RequestMapping("/loginform")
	public String loginform() {
		return "/user/loginform";
	}
	@RequestMapping("/login2")
	public String login2(HashMap<String,Object> map) {
		List<UserVo> list=userService.getUserList();
		
		return "redirect:/";
	}
	@RequestMapping("/pwdsearch")
	public String pwdsearch() {
		return "/user/pwdsearch";
	}
	@RequestMapping("/joinform")
	public String joinform() {
		return "/user/joinform";
	}
	@RequestMapping("/join")
	public String join() {
		return "redirect:/";
	}
	@RequestMapping("/search")
	public ModelAndView trainreservform(HashMap<String,Object>map, HttpSession session) {
		ModelAndView mv=new ModelAndView();
		String email=(String)session.getAttribute("email");
		if(email==null) {
			mv.setViewName("/login");
		}
		else {
			System.out.println(map);
			mv.addObject("map",map);
			mv.setViewName("/reserv/trainreservform");
		}
		return mv;
	}
	@RequestMapping("/search2")
	public String trainreservformOnebutton(String val) {
		return "/reserv/trainreservformOnebutton";
	}
	@RequestMapping("/trainseatform")
	public ModelAndView trainseatform(HttpSession session,@RequestParam HashMap<String,Object> map) {
		ModelAndView mv=new ModelAndView();
		String email=(String)session.getAttribute("email");
		if(email==null) {
			mv.setViewName("/login");
		}
		else {
			mv.setViewName("/reserv/trainseatform");
		}
		mv.addObject("map",map);
		return mv;
	}
	@RequestMapping("/trainreservformOnebutton")
	public ModelAndView trainreservformOnebutton(@RequestParam HashMap<String,Object> map) {
		ModelAndView mv=new ModelAndView();
		mv.addObject("map",map);
		mv.setViewName("/reserv/trainreservformOnebutton");
		return mv;
	}
	@RequestMapping("/accomreservform")
	public ModelAndView accomreservform(@RequestParam HashMap<String,Object> map) {
		ModelAndView mv=new ModelAndView();
		mv.addObject("map",map);
		mv.setViewName("/reserv/accomreservform");
		return mv;
	}
	@RequestMapping("/reservconfirmform")
	public ModelAndView reservconfirmform(HttpSession session,@RequestParam HashMap<String,Object> map) {
		ModelAndView mv=new ModelAndView();
		String email=(String)session.getAttribute("email");
		if(email==null) {
			mv.setViewName("/login");
		}
		else {
			mv.addObject("map",map);
			mv.setViewName("/reserv/reservconfirmform");
		}
		return mv;
	}
	@RequestMapping("/reservpay")
	public ModelAndView reservpay(HttpSession session,@RequestParam HashMap<String,Object> map) {
		ModelAndView mv=new ModelAndView();
		String email=(String)session.getAttribute("email");
		if(email==null) {
			mv.setViewName("/email");
		}
		else {
			mv.addObject("map",map);
			mv.setViewName("/reserv/reservpay");
		}
		return mv;
	}
	@RequestMapping("/reserv")
	public ModelAndView reserv(@RequestParam HashMap<String,Object> map,HttpSession session) {
		String email=(String)session.getAttribute("email");
		map.put("email", email);
		userService.insertReserv(map);
		userService.insertAccomReserv(map);
		ModelAndView mv=new ModelAndView();
		mv.addObject("map",map);
		mv.setViewName("redirect:/");
		return mv;
	}
	
	
//	@RequestMapping("/login") // 현재 servlet xml - interceptor 주석처리 해놓음 
//	public String login() {
//		return "user/login"; // web-inf/views/user/login.jsp
//	}
	
//	@RequestMapping("/loginProcess")
//	public String loginProcess(HttpSession session,@RequestParam HashMap<String,Object> map ) {
//		if(session.getAttribute("login")!=null) {
//			// session에 login이라는 값이 존재한다면
//			session.removeAttribute("login"); //기존값 제거
//		}
//		//로그인에 성공하면 UserVo 객체 반환
//		UserVo userVo =userService.login(map);
//		String returnURL="";
//		if(userVo!=null) {//로그인 성공
//			session.setAttribute("login", userVo);
//			returnURL="redirect:/"; 
//		}else {//로그인 실패
//			returnURL="redirect:/login";
//			
//		}
//		return returnURL;
//	}
	//로그아웃
//	@RequestMapping("/logout")
//	public String logout(HttpSession session) {
//		session.invalidate();
//		return "redirect:/"; // 로그아웃시 주소 -> /login
//	}

	@RequestMapping("/User/List")
	public String list(Model model) {
		List<UserVo> userList=userService.getUserList();
		model.addAttribute("userList",userList);
		return "list";
	}
	
	@RequestMapping("/{val}")
	public String html(@PathVariable String val) {
		String loc="redirect:/static/html/";
		switch(val) {
		case "a": loc+="ajax01.html"; break;
		case "b": loc+="ajax02.html"; break;
		case "c": loc+="ajax03.html"; break;
		case "d": loc+="ajax04.html"; break;
		}
		return loc;
	}
	
	@RequestMapping("/ajax")
	public void ajax(String v,HttpServletResponse response) {
		String fmt="{\r\n"
				+ "	\"id\":\"sky\",\r\n"
				+ "	\"pass\":\"234\",\r\n"
				+ "	\"v\":\"%s\"\r\n"
				+ "}";
		String data=String.format(fmt, v);
		try{
			response.setContentType("application/json;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.print(data);
			out.flush();
			out.close();
		} catch(IOException e) {
			
		}
	}
	
	// json library 사용 : map data -> json으로 출력
	// pom.xml - jackson-databind library
	// @ResponseBody 사용 : viewresolver 거치지않고 xml,json을 
	// 출력 가능하게 한다.
	@RequestMapping("/ajax2")
	@ResponseBody
	public Map<String,Object> ajax2(String v) {
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("id","sky");
		map.put("pass","234");
		map.put("v",v);
		return map;
	}
	
	@RequestMapping("/ajaxlist")
	@ResponseBody
	public Map<Integer,Object> ajaxlist() {
		List<UserVo> list=userService.getUserList();
		Map<Integer,Object> map=new HashMap<Integer,Object>();
		//list -> map
		for (int i = 0; i < list.size(); i++) {
			map.put(i, list.get(i));
		}
		return map;
		
	}

	//반복문 없이 list를 map에 바로 put
	@RequestMapping("/ajaxlist2")
	@ResponseBody
	public Map<String,Object> ajaxlist2() {
		List<UserVo> list=userService.getUserList();
		Map<String,Object> map=new HashMap<>();
		map.put("data", list);
		return map;
		
	}


}
