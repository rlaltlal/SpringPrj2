package com.green.mypage.vo;

public class MyquestVo {
	// Quest_Board
	private String  writedate;
	private int     readcount;
	private int     qseq;
	private String  email;
	private String  title;
	private String  cont;
	private String  qstate;
	private int     bnum;
	private int     lvl;
	private int     step;
	private int     nref;
	private String  menu_id;
	
	
	// Quest_Board_Files
	private int     file_num;
//	private int     qseq;
	private String  filename;
	private String  fileext;
	private String  sfilename;
	
	
	public MyquestVo() {
	}


	public MyquestVo(String writedate, int readcount, int qseq, String email, String title, String cont, String qstate,
			int bnum, int lvl, int step, int nref, String menu_id, int file_num, String filename, String fileext,
			String sfilename) {
		super();
		this.writedate = writedate;
		this.readcount = readcount;
		this.qseq = qseq;
		this.email = email;
		this.title = title;
		this.cont = cont;
		this.qstate = qstate;
		this.bnum = bnum;
		this.lvl = lvl;
		this.step = step;
		this.nref = nref;
		this.menu_id = menu_id;
		this.file_num = file_num;
		this.filename = filename;
		this.fileext = fileext;
		this.sfilename = sfilename;
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


	public int getQseq() {
		return qseq;
	}


	public void setQseq(int qseq) {
		this.qseq = qseq;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
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


	public String getQstate() {
		return qstate;
	}


	public void setQstate(String qstate) {
		this.qstate = qstate;
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


	public int getFile_num() {
		return file_num;
	}


	public void setFile_num(int file_num) {
		this.file_num = file_num;
	}


	public String getFilename() {
		return filename;
	}


	public void setFilename(String filename) {
		this.filename = filename;
	}


	public String getFileext() {
		return fileext;
	}


	public void setFileext(String fileext) {
		this.fileext = fileext;
	}


	public String getSfilename() {
		return sfilename;
	}


	public void setSfilename(String sfilename) {
		this.sfilename = sfilename;
	}


	@Override
	public String toString() {
		return "MyquestVo [writedate=" + writedate + ", readcount=" + readcount + ", qseq=" + qseq + ", email=" + email
				+ ", title=" + title + ", cont=" + cont + ", qstate=" + qstate + ", bnum=" + bnum + ", lvl=" + lvl
				+ ", step=" + step + ", nref=" + nref + ", menu_id=" + menu_id + ", file_num=" + file_num
				+ ", filename=" + filename + ", fileext=" + fileext + ", sfilename=" + sfilename + "]";
	}
	
	
	
	
}
