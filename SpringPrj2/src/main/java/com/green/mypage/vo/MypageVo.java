package com.green.mypage.vo;


public class MypageVo {
		
		// Field1(숙소예약정보)
		private int     aseq;
		private String  accomname;
		private String  address;
		private String  phone;
		private int     price;
		private String  regdate;
		private String  email;
		private String  reservstate;
		private String  checkindate;

		// Field2(숙소상세정보)
//		private int     aseq;
//		private String  accomname;	
		private int     roomnumber;
		private String  roomtype;
		private int     adults;
		private int     kids;

		// Field3(기차예약정보)
		private int     tseq;
		private int     trainno;
		private String  traingradename;
		private String  depart;
		private String  arrive;
		private String  depdate;
		private String  arrdate;
//		private String  regdate;
//		private int     price;
		private String  promotion;
//		private String  reservstate;

		// Field4(기차상세정보)
//		private int     tseq;
//		private int     trainNo;
		private String  seatinform;

	    // Field0
		private int    seq;
		private String reservcont;
		private String reservdetail;
		private String usedate;
		private String usetime;
		private String train;
		private String trainarea;
		private String traintime;
		
		public MypageVo() {
		}		
		
		public MypageVo(int aseq, String accomname, String address, String phone, int price, String regdate,
				String email, String reservstate, String checkindate, int roomnumber, String roomtype, int adults,
				int kids, int tseq, int trainno, String traingradename, String depart, String arrive, String depdate,
				String arrdate, String promotion, String seatinform, int seq, String reservcont, String reservdetail,
				String usedate, String usetime, String train, String trainarea, String traintime) {
			super();
			this.aseq = aseq;
			this.accomname = accomname;
			this.address = address;
			this.phone = phone;
			this.price = price;
			this.regdate = regdate;
			this.email = email;
			this.reservstate = reservstate;
			this.checkindate = checkindate;
			this.roomnumber = roomnumber;
			this.roomtype = roomtype;
			this.adults = adults;
			this.kids = kids;
			this.tseq = tseq;
			this.trainno = trainno;
			this.traingradename = traingradename;
			this.depart = depart;
			this.arrive = arrive;
			this.depdate = depdate;
			this.arrdate = arrdate;
			this.promotion = promotion;
			this.seatinform = seatinform;
			this.seq = seq;
			this.reservcont = reservcont;
			this.reservdetail = reservdetail;
			this.usedate = usedate;
			this.usetime = usetime;
			this.train = train;
			this.trainarea = trainarea;
			this.traintime = traintime;
		}





		public int getAseq() {
			return aseq;
		}


		public void setAseq(int aseq) {
			this.aseq = aseq;
		}


		public String getAccomname() {
			return accomname;
		}


		public void setAccomname(String accomname) {
			this.accomname = accomname;
		}


		public String getAddress() {
			return address;
		}


		public void setAddress(String address) {
			this.address = address;
		}


		public String getPhone() {
			return phone;
		}


		public void setPhone(String phone) {
			this.phone = phone;
		}


		public int getPrice() {
			return price;
		}


		public void setPrice(int price) {
			this.price = price;
		}


		public String getRegdate() {
			return regdate;
		}


		public void setRegdate(String regdate) {
			this.regdate = regdate;
		}


		public String getEmail() {
			return email;
		}


		public void setEmail(String email) {
			this.email = email;
		}


		public String getReservstate() {
			return reservstate;
		}


		public void setReservstate(String reservstate) {
			this.reservstate = reservstate;
		}


		public String getCheckindate() {
			return checkindate;
		}


		public void setCheckindate(String checkindate) {
			this.checkindate = checkindate;
		}


		public int getRoomnumber() {
			return roomnumber;
		}


		public void setRoomnumber(int roomnumber) {
			this.roomnumber = roomnumber;
		}


		public String getRoomtype() {
			return roomtype;
		}


		public void setRoomtype(String roomtype) {
			this.roomtype = roomtype;
		}


		public int getAdults() {
			return adults;
		}


		public void setAdults(int adults) {
			this.adults = adults;
		}


		public int getKids() {
			return kids;
		}


		public void setKids(int kids) {
			this.kids = kids;
		}


		public int getTseq() {
			return tseq;
		}


		public void setTseq(int tseq) {
			this.tseq = tseq;
		}


		public int getTrainno() {
			return trainno;
		}


		public void setTrainno(int trainno) {
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


		public String getDepdate() {
			return depdate;
		}


		public void setDepdate(String depdate) {
			this.depdate = depdate;
		}


		public String getArrdate() {
			return arrdate;
		}


		public void setArrdate(String arrdate) {
			this.arrdate = arrdate;
		}


		public String getPromotion() {
			return promotion;
		}


		public void setPromotion(String promotion) {
			this.promotion = promotion;
		}


		public String getSeatinform() {
			return seatinform;
		}


		public void setSeatinform(String seatinform) {
			this.seatinform = seatinform;
		}


		public int getSeq() {
			return seq;
		}


		public void setSeq(int seq) {
			this.seq = seq;
		}


		public String getReservcont() {
			return reservcont;
		}


		public void setReservcont(String reservcont) {
			this.reservcont = reservcont;
		}


		public String getReservdetail() {
			return reservdetail;
		}


		public void setReservdetail(String reservdetail) {
			this.reservdetail = reservdetail;
		}


		public String getUsedate() {
			return usedate;
		}


		public void setUsedate(String usedate) {
			this.usedate = usedate;
		}


		public String getUsetime() {
			return usetime;
		}


		public void setUsetime(String usetime) {
			this.usetime = usetime;
		}


		public String getTrain() {
			return train;
		}


		public void setTrain(String train) {
			this.train = train;
		}


		public String getTrainarea() {
			return trainarea;
		}


		public void setTrainarea(String trainarea) {
			this.trainarea = trainarea;
		}


		public String getTraintime() {
			return traintime;
		}


		public void setTraintime(String traintime) {
			this.traintime = traintime;
		}


		@Override
		public String toString() {
			return "MypageVo [aseq=" + aseq + ", accomname=" + accomname + ", address=" + address + ", phone=" + phone
					+ ", price=" + price + ", regdate=" + regdate + ", email=" + email + ", reservstate=" + reservstate
					+ ", checkindate=" + checkindate + ", roomnumber=" + roomnumber + ", roomtype=" + roomtype
					+ ", adults=" + adults + ", kids=" + kids + ", tseq=" + tseq + ", trainno=" + trainno
					+ ", traingradename=" + traingradename + ", depart=" + depart + ", arrive=" + arrive + ", depdate="
					+ depdate + ", arrdate=" + arrdate + ", promotion=" + promotion + ", seatinform=" + seatinform
					+ ", seq=" + seq + ", reservcont=" + reservcont + ", reservdetail=" + reservdetail + ", usedate="
					+ usedate + ", usetime=" + usetime + ", train=" + train + ", trainarea=" + trainarea
					+ ", traintime=" + traintime + "]";
		}
		
		
		
}
