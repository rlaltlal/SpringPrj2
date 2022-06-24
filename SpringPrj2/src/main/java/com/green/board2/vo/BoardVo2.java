package com.green.board2.vo;

public class BoardVo2 {
	// Fields
	
    private String writedate;
    private int readcount;
    private int bseq;
    private String email;
    private String subcategory;
    private String title;
    private String cont;
    private String recommend;
    private String menu_id;

    
    // 검색 필터
    private String type;
    private String keyword;
    
    // 닉네임
    private String nickname;
    
    
    public BoardVo2() {
    	
    }


	public BoardVo2(String writedate, int readcount, int bseq, String email, String subcategory, String title,
			String cont, String recommend, String menu_id, String type, String keyword, String nickname) {
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
		this.type = type;
		this.keyword = keyword;
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


	public String getRecommend() {
		return recommend;
	}


	public void setRecommend(String recommend) {
		this.recommend = recommend;
	}


	public String getMenu_id() {
		return menu_id;
	}


	public void setMenu_id(String menu_id) {
		this.menu_id = menu_id;
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


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	@Override
	public String toString() {
		return "BoardVo2 [writedate=" + writedate + ", readcount=" + readcount + ", bseq=" + bseq + ", email=" + email
				+ ", subcategory=" + subcategory + ", title=" + title + ", cont=" + cont + ", recommend=" + recommend
				+ ", menu_id=" + menu_id + ", type=" + type + ", keyword=" + keyword + ", nickname=" + nickname + "]";
	}


	
}
