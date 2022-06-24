package com.green.user.vo;

public class TrainInformVo {
	private String tseq             ;
	private String trainno          ;
	private String traingradename   ;
	private String depart           ;
	private String arrive           ;
	private String dep_date         ;
	private String arr_date         ;
	private String regdate          ;
	private String price            ;
	private String promotion        ;
	private String reservstate      ;
	private String email            ;
	private String seat_inform      ;
	public String getTseq() {
		return tseq;
	}
	public void setTseq(String tseq) {
		this.tseq = tseq;
	}
	public String getTrainno() {
		return trainno;
	}
	public void setTrainno(String trainno) {
		this.trainno = trainno;
	}
	public String getTraingradename() {
		return traingradename;
	}
	public void setTraingradename(String traingradename) {
		this.traingradename = traingradename;
	}
	public String getDepart() {
		return depart;
	}
	public void setDepart(String depart) {
		this.depart = depart;
	}
	public String getArrive() {
		return arrive;
	}
	public void setArrive(String arrive) {
		this.arrive = arrive;
	}
	public String getDep_date() {
		return dep_date;
	}
	public void setDep_date(String dep_date) {
		this.dep_date = dep_date;
	}
	public String getArr_date() {
		return arr_date;
	}
	public void setArr_date(String arr_date) {
		this.arr_date = arr_date;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getPromotion() {
		return promotion;
	}
	public void setPromotion(String promotion) {
		this.promotion = promotion;
	}
	public String getReservstate() {
		return reservstate;
	}
	public void setReservstate(String reservstate) {
		this.reservstate = reservstate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSeat_inform() {
		return seat_inform;
	}
	public void setSeat_inform(String seat_inform) {
		this.seat_inform = seat_inform;
	}
	public TrainInformVo(String tseq, String trainno, String traingradename, String depart, String arrive,
			String dep_date, String arr_date, String regdate, String price, String promotion, String reservstate,
			String email, String seat_inform) {
		super();
		this.tseq = tseq;
		this.trainno = trainno;
		this.traingradename = traingradename;
		this.depart = depart;
		this.arrive = arrive;
		this.dep_date = dep_date;
		this.arr_date = arr_date;
		this.regdate = regdate;
		this.price = price;
		this.promotion = promotion;
		this.reservstate = reservstate;
		this.email = email;
		this.seat_inform = seat_inform;
	}
	@Override
	public String toString() {
		return "TrainInformVo [tseq=" + tseq + ", trainno=" + trainno + ", traingradename=" + traingradename
				+ ", depart=" + depart + ", arrive=" + arrive + ", dep_date=" + dep_date + ", arr_date=" + arr_date
				+ ", regdate=" + regdate + ", price=" + price + ", promotion=" + promotion + ", reservstate="
				+ reservstate + ", email=" + email + ", seat_inform=" + seat_inform + "]";
	}
	
	public TrainInformVo() {}

}
