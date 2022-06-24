package com.green.mypage.vo;

public class RecommendVo {
	private int    bseq;
	private String email;
	
	
	public RecommendVo() {
	}


	public RecommendVo(int bseq, String email) {
		super();
		this.bseq = bseq;
		this.email = email;
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


	@Override
	public String toString() {
		return "RecommendVo [bseq=" + bseq + ", email=" + email + "]";
	}
	
	
	
}
