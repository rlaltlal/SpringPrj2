package com.green.pds.vo;

public class PdsVo {
	private int idx;
	private String title;
	private String cont;
	private String writter;
	private String regdate;
	private String readcount;
	
	//답글 관련
	private int bnum;
	private int lvl;
	private int step;
	private int nref;
		
	//현재 menu  정보
	private String menu_id;
	private String menu_name;
	private int menu_seq;
	
	//파일 관련
	private int filescount;

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
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

	public String getWritter() {
		return writter;
	}

	public void setWritter(String writter) {
		this.writter = writter;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getReadcount() {
		return readcount;
	}

	public void setReadcount(String readcount) {
		this.readcount = readcount;
	}

	public int getBnum() {
		return bnum;
	}

	public void setBnum(int bnum) {
		this.bnum = bnum;
	}

	public int getLvl() {
		return lvl;
	}

	public void setLvl(int lvl) {
		this.lvl = lvl;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getNref() {
		return nref;
	}

	public void setNref(int nref) {
		this.nref = nref;
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

	public int getFilescount() {
		return filescount;
	}

	public void setFilescount(int filescount) {
		this.filescount = filescount;
	}

	public PdsVo(int idx, String title, String cont, String writter, String regdate, String readcount, int bnum,
			int lvl, int step, int nref, String menu_id, String menu_name, int menu_seq, int filescount) {
		super();
		this.idx = idx;
		this.title = title;
		this.cont = cont;
		this.writter = writter;
		this.regdate = regdate;
		this.readcount = readcount;
		this.bnum = bnum;
		this.lvl = lvl;
		this.step = step;
		this.nref = nref;
		this.menu_id = menu_id;
		this.menu_name = menu_name;
		this.menu_seq = menu_seq;
		this.filescount = filescount;
	}
	public PdsVo() {}

	@Override
	public String toString() {
		return "PdsVo [idx=" + idx + ", title=" + title + ", cont=" + cont + ", writter=" + writter + ", regdate="
				+ regdate + ", readcount=" + readcount + ", bnum=" + bnum + ", lvl=" + lvl + ", step=" + step
				+ ", nref=" + nref + ", menu_id=" + menu_id + ", menu_name=" + menu_name + ", menu_seq=" + menu_seq
				+ ", filescount=" + filescount + "]";
	}
	
	
	
}
