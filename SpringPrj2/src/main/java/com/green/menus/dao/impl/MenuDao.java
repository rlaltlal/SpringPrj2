package com.green.menus.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.menus.vo.MenuVo;

@Repository("menuDao")
public class MenuDao implements com.green.menus.dao.MenuDao {

	@Autowired
	private SqlSession sqlSession;
	@Override
	public List<MenuVo> getMenuList() {
		List<MenuVo> list=sqlSession.selectList("Menus.getMenuList");
		return list;
	}
	@Override
	public void insertMenu(MenuVo vo) {
		sqlSession.insert("Menus.insertMenu",vo);	
	}
	@Override
	public void insertMenu2(MenuVo vo) {
		sqlSession.insert("Menus.insertMenu2",vo);	
		
	}
	@Override
	public void deleteMenu(String menu_id) {
		sqlSession.delete("Menus.deleteMenu",menu_id);	
		
	}
	@Override
	public void updateMenu(MenuVo vo) {
		sqlSession.update("Menus.updateMenu",vo);
	}
	@Override
	public MenuVo getMenuView(String menu_id) {
		MenuVo vo=sqlSession.selectOne("Menus.getMenu", menu_id);
		return vo;
	}
}
