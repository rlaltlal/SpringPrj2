package com.green.mypage.vo;

public class MypostVo {
	// My Board
	private String writedate;
	private int    readcount;
	private int    bseq;
	private String email;
	private String subcategory;
	private String title;
	private String cont;
	private int    recommend;
	private String menu_id;
	
	// MENUS
	private String menu_name;
	private int    menu_seq;
	
	
	
	public MypostVo() {
	}



	public MypostVo(String writedate, int readcount, int bseq, String email, String subcategory, String title,
			String cont, int recommend, String menu_id, String menu_name, int menu_seq) {
		super();
		this.writedate = writedate;
		this.readcount = readcount;
		this.bseq = bseq;
		this.email = email;
		this.subcategory = subcategory;
		this.title = title;
		this.cont = cont;
		this.recommend = recommend;
		this.menu_id = menu_id;
		this.menu_name = menu_name;
		this.menu_seq = menu_seq;
	}



	public String getWritedate() {
		return writedate;
	}



	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}



	public int getReadcount() {
		return readcount;
	}



	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}



	public int getBseq() {
		return bseq;
	}



	public void setBseq(int bseq) {
		this.bseq = bseq;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getSubcategory() {
		return subcategory;
	}



	public void setSubcategory(String subcategory) {
		this.subcategory = subcategory;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getCont() {
		return cont;
	}



	public void setCont(String cont) {
		this.cont = cont;
	}



	public int getRecommend() {
		return recommend;
	}



	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}



	public String getMenu_id() {
		return menu_id;
	}



	public void setMenu_id(String menu_id) {
		this.menu_id = menu_id;
	}



	public String getMenu_name() {
		return menu_name;
	}



	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}



	public int getMenu_seq() {
		return menu_seq;
	}



	public void setMenu_seq(int menu_seq) {
		this.menu_seq = menu_seq;
	}



	@Override
	public String toString() {
		return "MypostVo [writedate=" + writedate + ", readcount=" + readcount + ", bseq=" + bseq + ", email=" + email
				+ ", subcategory=" + subcategory + ", title=" + title + ", cont=" + cont + ", recommend=" + recommend
				+ ", menu_id=" + menu_id + ", menu_name=" + menu_name + ", menu_seq=" + menu_seq + "]";
	}
	
	
	
	
	
	
}
