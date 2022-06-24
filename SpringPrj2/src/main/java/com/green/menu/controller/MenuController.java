package com.green.menu.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import javax.servlet.http.HttpServletRequest; 

import com.green.user.service.LoginService;
import com.green.user.vo.UserVo;

@Controller
@RequestMapping("/Menu")
public class MenuController {
	
	@Autowired
	private  LoginService loginService;
   
	@RequestMapping("/")
	public ModelAndView menu(HttpSession session,@RequestParam HashMap<String,Object> map) {
		UserVo vo=(UserVo)session.getAttribute("login");
		ModelAndView mv=new ModelAndView();
		mv.setViewName("firstpage");
		mv.addObject("map",map);
		if(vo==null) {
			
		}
		else {
			System.out.println(vo.toString());
			mv.addObject("vo",vo);
			
		}
		//mv.addObject("sessionScope",vo.getEmail());
		System.out.println(mv.toString());
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
			HttpSession     session, RedirectAttributes rttr,
		@RequestParam   HashMap<String, Object> map) {
		ModelAndView mv=new ModelAndView();
		 String returnURL = "";
		 if( session.getAttribute("login") != null ) {
			 //기존 login 이란 session 에 값이 존재한다면
			//session.removeAttribute("login");  // 기존값을 제거한다
		}
		
		// 로그인을 성공하면 UserVo 객체를 반환함
		UserVo  vo  = loginService.login( map );
		System.out.println("vo:"+ vo);
		if ( vo != null ) {
			session.setAttribute("login", vo);
			returnURL = "redirect:/";        // 로그인 성공시
		} else {
			session.setAttribute("login", null);
			rttr.addFlashAttribute("msg",false);
			returnURL = "redirect:/login";	 // 로그인 실패시
		}	
		System.out.println("login:" + session.getAttribute("login"));	
		mv.setViewName(returnURL);
		return mv;		
	}
	
	
	// 로그아웃
	@RequestMapping("/logoutProcess") 
	public  String  logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";  // 로그아웃시 이동할 주소 -> /login
	}
	
	
}
