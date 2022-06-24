package com.green.menus.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.menus.service.MenuService;
import com.green.menus.vo.MenuVo;

@Controller
@RequestMapping("/Menus")
public class MenusController {
	@Autowired
	private MenuService menuService;
	
	@RequestMapping("/List")
	public String menuList(Model model) {
		//메뉴목록 조회
		List<MenuVo> list=menuService.getMenuList();
		model.addAttribute("menuList",list);
		return "menus/list";
		// path : /WEB-INF/views/menus/list.jsp
	}
	
	//link: Menus/WriteForm
	@RequestMapping("WriteForm")
	public String writeform() {
		
		return "menus/write";
	}

	//link: Menus/
	@RequestMapping("Write")
	public String writeform(MenuVo vo) {
		menuService.insertMenu(vo);
		return "redirect:/Menus/List";
	}

	//link: Menus/WriteForm2
	@RequestMapping("WriteForm2")
	public String writeform2() {
		
		return "menus/write2";
	}

	@RequestMapping("Write2")
	public String writeform2(MenuVo vo) {
		menuService.insertMenu2(vo);
		return "redirect:/Menus/List";
	}

	//link: Menus/MenuDelete/${menu.menuid}
	@RequestMapping("/MenuDelete/{menu_id}")
	public String menuDelete(@PathVariable String menu_id) {
		menuService.deleteMenu(menu_id);
		return "redirect:/Menus/List";
	}

	//link: Menus/MenuUpdate/${menu.menuid}
	@RequestMapping("/MenuUpdateForm/{menu_id}")
	public String menuUpdate(@PathVariable String menu_id,Model model) {
		MenuVo vo=menuService.getMenuView(menu_id);
		model.addAttribute("menu",vo);
		return "menus/update";
	}
	
	//link : Menus/MenuUpdate
	@RequestMapping("MenuUpdate")
	public String menuUpdate(MenuVo vo) {
		menuService.updateMenu(vo);
		return "redirect:/Menus/List";
	}
	
	
}
