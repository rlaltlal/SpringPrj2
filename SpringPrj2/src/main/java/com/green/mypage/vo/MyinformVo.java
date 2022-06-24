package com.green.mypage.vo;

public class MyinformVo {
	
	private String  email;
	private String  nickname;
	private String  passwd;
	private String  rate;
	private String  regdate;
	
	
	public MyinformVo() {
	}


	public MyinformVo(String email, String nickname, String passwd, String rate, String regdate) {
		super();
		this.email = email;
		this.nickname = nickname;
		this.passwd = passwd;
		this.rate = rate;
		this.regdate = regdate;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public String getPasswd() {
		return passwd;
	}


	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}


	public String getRate() {
		return rate;
	}


	public void setRate(String rate) {
		this.rate = rate;
	}


	public String getRegdate() {
		return regdate;
	}


	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}


	@Override
	public String toString() {
		return "MyinformVo [email=" + email + ", nickname=" + nickname + ", passwd=" + passwd + ", rate=" + rate
				+ ", regdate=" + regdate + "]";
	}

	
}
