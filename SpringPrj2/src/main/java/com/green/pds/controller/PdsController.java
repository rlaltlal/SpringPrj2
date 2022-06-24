package com.green.pds.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLConnection;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.green.menus.service.MenuService;
import com.green.menus.vo.MenuVo;
import com.green.pds.service.PdsService;
import com.green.pds.vo.FilesVo;
import com.green.pds.vo.PdsVo;

@Controller
@RequestMapping("/Pds")
public class PdsController {
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private PdsService pdsService;
	
	//Link: /Pds/List
	@RequestMapping("/List")
	public ModelAndView list(@RequestParam HashMap<String,Object> map) {
		// map {menu_id=MENU01}
		ModelAndView mv=new ModelAndView();
		List<MenuVo> list=menuService.getMenuList();
		List<PdsVo> pdsList=pdsService.getPdsList(map);
		String menu_id=(String)map.get("menu_id");
		MenuVo vo=null;
		if(menu_id!=null) {
			vo=menuService.getMenuView(menu_id);
		}
		else {
			vo=new MenuVo(null,"전체","0");
		}
		mv.addObject("menuList",list);
		mv.addObject("pdsList",pdsList);
		mv.addObject("menu_name",vo.getMenu_name());
		mv.addObject("menu_id",menu_id);
		mv.setViewName("/pds/list");
		return mv;
	}
	//Link: /Pds/WriteForm
	@RequestMapping("/WriteForm")
	public ModelAndView writeform(@RequestParam HashMap<String,Object> map) {
		ModelAndView mv=new ModelAndView();
		
		//메뉴목록조회
		List<MenuVo> list=menuService.getMenuList();
		
		mv.addObject("menuList",list);
		mv.addObject("map",map);
		mv.setViewName("/pds/writeform");
		return mv;
	}
	//Link: /Pds/Write
	@RequestMapping("/Write")
	public ModelAndView write(@RequestParam HashMap<String,Object> map,HttpServletRequest request) {
		// map: 게시글정보, request : 파일
		ModelAndView mv=new ModelAndView();
		
		//게시글 저장 : Board table (BoardDao)		
		//첨부파일 이름 저장 : Files table (PdsDao)		
		//실제파일 저장 : C:\\upload (PdsService)
		
		pdsService.setWrite(map,request);
		
		mv.setViewName("redirect:/Pds/List?menu_id="+map.get("menu_id"));
		mv.addObject("map",map);
		return mv;
	}
	// /Pds/View?menu_id=${pds.menu_id}&idx=${pds.idx}">${pds.title}
	@RequestMapping("/View")
	public ModelAndView view(@RequestParam HashMap<String,Object> map) {
		ModelAndView mv=new ModelAndView();
		List<MenuVo> list=menuService.getMenuList();
		
		//조회된 글 정보
		PdsVo pdsVo=pdsService.getPdsView(map);

		//조회된 파일 목록
		List<FilesVo> filesList=pdsService.getFilesList(map);
		
		mv.addObject("menuList",list);
		mv.addObject("pdsVo",pdsVo);
		//vo : idx=19, title=w, cont=w, writter=s, regdate=2022-05-26 12:37:29, 
		// readcount=0, bnum=19, lvl=0, step=0, nref=19, menu_id=MENU01, menu_name=null, menu_seq=0, filescount=0
		mv.addObject("filesList",filesList);
		// FilesVo : [file_num=4, idx=16, filename=21-12-01-20-45-46-950_photo.jpg, 
		// fileext=.jpg, sfilename=21-12-01-20-45-46-950_photo_4.jpg], 

		mv.addObject("map",map);
		mv.setViewName("/pds/view");
		return mv;
	}
	@RequestMapping("/Delete")
	public ModelAndView deltee(@RequestParam HashMap<String,Object> map) {
		ModelAndView mv=new ModelAndView();
		pdsService.deletePds(map);
		mv.setViewName("redirect:/Pds/List?menu_id="+map.get("menu_id"));
		return mv;
	}
	
	//Link : /download/external/손.jpg
	// /{sfile} : .jpg에서 (.) 문자를 무시해버림
	// {sfile:.+} : 정규식문법으로 (+) : 한개이상 존재해야한다 : 확장자가 한개이상 존재하는
 	@RequestMapping(value="/download/{type}/{sfile:.+}",method=RequestMethod.GET)
	public void downloadFile(@PathVariable("type") String type,
			@PathVariable("sfile") String sfile,HttpServletResponse response) throws IOException {
 		String INTERNAL_FILE=sfile; //build/classes에 저장됨
 		String EXTERNAL_FILE_PATH="c:\\upload\\"+sfile; // c:/upload/에 저장됨
 		
 		File file=null;
 		if(type.equalsIgnoreCase("internal")) { // 대소문자 무시 비교
 			ClassLoader classLoader=Thread.currentThread().getContextClassLoader(); //현재 시스템정보
 			file=new File(classLoader.getResource(INTERNAL_FILE).getFile());
 		}
 		else { // external
 			file=new File(EXTERNAL_FILE_PATH);
 		}
 		
 		if(!file.exists()) {
 			String errorMessage="파일이 없습니다.";
 			System.out.println(errorMessage);
 			OutputStream outputStream =response.getOutputStream();
 			outputStream.write(errorMessage.getBytes(Charset.forName("UTF-8"))); 
 			//write는 byte단위로 하기 때문에 String -> byte처리 + 한글처리
 			outputStream.close();
 			return;
 		}
 		
 		String mimeType =URLConnection.guessContentTypeFromName(file.getName());
 		mimeType="application/octet-stream"; //무조건 다운로드하기
 		String fname=new String(file.getName().getBytes("UTF-8"),"ISO-8859-1"); //파일이름 한글 처리
 		response.setContentType(mimeType);
 		response.setHeader("Content-Disposition", 
 				String.format("inline; filename=\""+fname+"\""));
 		response.setContentLength((int)file.length()); //크기 지정
 		InputStream inputStream =new BufferedInputStream(new FileInputStream(file));
 		FileCopyUtils.copy(inputStream, response.getOutputStream());
 		inputStream.close();
	}
 	
 	// Link:/Pds/UpdateForm?idx=${pdsVo.idx}&menu_id=${pdsVo.menu_id}
 	@RequestMapping("/UpdateForm")
 	public ModelAndView updateform(@RequestParam HashMap<String,Object> map) {
 		ModelAndView mv=new ModelAndView();
 		PdsVo pdsVo=pdsService.getPdsView(map);
 		List<MenuVo> list=menuService.getMenuList();
 		List<FilesVo> filesList=pdsService.getFilesList(map);
 		mv.addObject("pdsVo",pdsVo);
 		mv.addObject("menuList",list);
 		System.out.println(filesList);
 		mv.addObject("filesList",filesList);
 		mv.setViewName("/pds/updateform");
 		return mv;
 	}
 	
 	@RequestMapping("/Update")
 	public ModelAndView update(@RequestParam HashMap<String,Object> map,HttpServletRequest request) {
 		// 필요정보 : idx, title, cont, menu_id, file 정보
 		//map : {menu_id=MENU01, idx=20, title=ㅂㅈㄷ, cont=ㅁㄴㅇ, file0=21-12.jpg, upfile=}
 		ModelAndView mv=new ModelAndView();
 		pdsService.setUpdate(map,request);
 		System.out.println(map);
 		mv.setViewName("redirect:/Pds/List?menu_id="+map.get("menu_id"));
 		return mv;
 	}
}
