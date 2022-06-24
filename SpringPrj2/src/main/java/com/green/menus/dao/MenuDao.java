package com.green.menus.dao;

import java.util.List;

import com.green.menus.vo.MenuVo;

public interface MenuDao {

	List<MenuVo> getMenuList();

	void insertMenu(MenuVo vo);

	void insertMenu2(MenuVo vo);

	void deleteMenu(String menu_id);

	void updateMenu(MenuVo vo);

	MenuVo getMenuView(String menu_id);

}
