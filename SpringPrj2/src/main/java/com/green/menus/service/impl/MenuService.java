package com.green.menus.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.menus.dao.MenuDao;
import com.green.menus.vo.MenuVo;

@Service("menuService")
public class MenuService implements com.green.menus.service.MenuService {

	@Autowired
	private MenuDao menuDao;
	@Override
	public List<MenuVo> getMenuList() {
		List<MenuVo> list=null;
		list=menuDao.getMenuList();
		return list;
	}
	@Override
	public void insertMenu(MenuVo vo) {
		menuDao.insertMenu(vo);
	}
	@Override
	public void insertMenu2(MenuVo vo) {
		menuDao.insertMenu2(vo);
		
	}
	@Override
	public void deleteMenu(String menu_id) {
		menuDao.deleteMenu(menu_id);
	}
	@Override
	public void updateMenu(MenuVo vo) {
		menuDao.updateMenu(vo);		
	}
	@Override
	public MenuVo getMenuView(String menu_id) {
		MenuVo vo=menuDao.getMenuView(menu_id);
		return vo;
	}

}
