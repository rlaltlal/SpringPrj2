package com.green.imageboard.vo;

public class BoardVo {
	// Fields
	
    private String writedate;
    private int readcount;
    private int ccseq;
    private String email;
    private String title;
    private String cont;
    private String qstate;
    private int bnum;
    private int lvl;
    private int step;
    private int nref;
    private String menu_id;
    private int qseq;
    private int recnt;
    private String nickname;
    private String subcategory;
    private int recommend;
    private String sfilename;
    
    
    public BoardVo(String writedate, int readcount, int ccseq, String email, String title, String cont, String qstate,
			int bnum, int lvl, int step, int nref, String menu_id, int qseq, int recnt, String nickname,
			String subcategory, int recommend, String sfilename, String type, String keyword) {
		super();
		this.writedate = writedate;
		this.readcount = readcount;
		this.ccseq = ccseq;
		this.email = email;
		this.title = title;
		this.cont = cont;
		this.qstate = qstate;
		this.bnum = bnum;
		this.lvl = lvl;
		this.step = step;
		this.nref = nref;
		this.menu_id = menu_id;
		this.qseq = qseq;
		this.recnt = recnt;
		this.nickname = nickname;
		this.subcategory = subcategory;
		this.recommend = recommend;
		this.sfilename = sfilename;
		this.type = type;
		this.keyword = keyword;
	}

	public String getSfilename() {
		return sfilename;
	}

	public void setSfilename(String sfilename) {
		this.sfilename = sfilename;
	}

	public int getRecommend() {
		return recommend;
	}

	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}

	public String getSubcategory() {
		return subcategory;
	}

	public void setSubcategory(String subcategory) {
		this.subcategory = subcategory;
	}

	// 검색 필터
    private String type;
    private String keyword;
    
    
    public BoardVo() {
    	
    }

	public BoardVo(String writedate, int readcount, int ccseq, String email, String title, String cont, String qstate,
			int bnum, int lvl, int step, int nref, String menu_id, int qseq, String type, String keyword, int recnt) {
		super();
		this.writedate = writedate;
		this.readcount = readcount;
		this.ccseq = ccseq;
		this.email = email;
		this.title = title;
		this.cont = cont;
		this.qstate = qstate;
		this.bnum = bnum;
		this.lvl = lvl;
		this.step = step;
		this.nref = nref;
		this.menu_id = menu_id;
		this.qseq = qseq;
		this.type = type;
		this.keyword = keyword;
		this.recnt = recnt;
		
	}
	public BoardVo(String writedate, int readcount, int ccseq, String email, String title, String cont, String qstate,
			int bnum, int lvl, int step, int nref, String menu_id, int qseq, String type, String keyword, int recnt,String nickname) {
		super();
		this.writedate = writedate;
		this.readcount = readcount;
		this.ccseq = ccseq;
		this.email = email;
		this.title = title;
		this.cont = cont;
		this.qstate = qstate;
		this.bnum = bnum;
		this.lvl = lvl;
		this.step = step;
		this.nref = nref;
		this.menu_id = menu_id;
		this.qseq = qseq;
		this.type = type;
		this.keyword = keyword;
		this.recnt = recnt;
		this.nickname = nickname;
		
	}

	public BoardVo(String writedate, int readcount, int ccseq, String email, String title, String cont, String qstate,
			int bnum, int lvl, int step, int nref, String menu_id, int qseq, int recnt, String nickname,
			String subcategory, String type, String keyword) {
		super();
		this.writedate = writedate;
		this.readcount = readcount;
		this.ccseq = ccseq;
		this.email = email;
		this.title = title;
		this.cont = cont;
		this.qstate = qstate;
		this.bnum = bnum;
		this.lvl = lvl;
		this.step = step;
		this.nref = nref;
		this.menu_id = menu_id;
		this.qseq = qseq;
		this.recnt = recnt;
		this.nickname = nickname;
		this.subcategory = subcategory;
		this.type = type;
		this.keyword = keyword;
	}

	public BoardVo(String writedate, int readcount, int ccseq, String email, String title, String cont, String qstate,
			int bnum, int lvl, int step, int nref, String menu_id, int qseq, int recnt, String nickname,
			String subcategory, int recommend, String type, String keyword) {
		super();
		this.writedate = writedate;
		this.readcount = readcount;
		this.ccseq = ccseq;
		this.email = email;
		this.title = title;
		this.cont = cont;
		this.qstate = qstate;
		this.bnum = bnum;
		this.lvl = lvl;
		this.step = step;
		this.nref = nref;
		this.menu_id = menu_id;
		this.qseq = qseq;
		this.recnt = recnt;
		this.nickname = nickname;
		this.subcategory = subcategory;
		this.recommend = recommend;
		this.type = type;
		this.keyword = keyword;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
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

	public int getCcseq() {
		return ccseq;
	}

	public void setCcseq(int ccseq) {
		this.ccseq = ccseq;
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

	public int getQseq() {
		return qseq;
	}

	public void setQseq(int qseq) {
		this.qseq = qseq;
	}
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public int getRecnt() {
		return recnt;
	}

	public void setRecnt(int recnt) {
		this.recnt = recnt;
	}

	@Override
	public String toString() {
		return "BoardVo [writedate=" + writedate + ", readcount=" + readcount + ", ccseq=" + ccseq + ", email=" + email
				+ ", title=" + title + ", cont=" + cont + ", qstate=" + qstate + ", bnum=" + bnum + ", lvl=" + lvl
				+ ", step=" + step + ", nref=" + nref + ", menu_id=" + menu_id + ", qseq=" + qseq + ", recnt=" + recnt
				+ ", nickname=" + nickname + ", subcategory=" + subcategory + ", recommend=" + recommend
				+ ", sfilename=" + sfilename + ", type=" + type + ", keyword=" + keyword + "]";
	}
	
	

	
}
