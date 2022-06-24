package com.green.user.vo;

public class AccomInformVo {
	private String accom_name;
	private String address;
	private String phone;
	private int     price;
	private String regdate;
	private int    room_number;
	private String room_type;
	private String adults;
	private String kids;
	
	public AccomInformVo() {}

	public AccomInformVo(String accom_name, String address, String phone, int price, String regdate, int room_number,
			String room_type, String adults, String kids) {
		super();
		this.accom_name = accom_name;
		this.address = address;
		this.phone = phone;
		this.price = price;
		this.regdate = regdate;
		this.room_number = room_number;
		this.room_type = room_type;
		this.adults = adults;
		this.kids = kids;
	}

	public String getAccom_name() {
		return accom_name;
	}

	public void setAccom_name(String accom_name) {
		this.accom_name = accom_name;
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

	public int getRoom_number() {
		return room_number;
	}

	public void setRoom_number(int room_number) {
		this.room_number = room_number;
	}

	public String getRoom_type() {
		return room_type;
	}

	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}

	public String getAdults() {
		return adults;
	}

	public void setAdults(String adults) {
		this.adults = adults;
	}

	public String getKids() {
		return kids;
	}

	public void setKids(String kids) {
		this.kids = kids;
	}

	@Override
	public String toString() {
		return "AccomInformVo [accom_name=" + accom_name + ", address=" + address + ", phone=" + phone + ", price="
				+ price + ", regdate=" + regdate + ", room_number=" + room_number + ", room_type=" + room_type
				+ ", adults=" + adults + ", kids=" + kids + "]";
	}

	

	

	
	
	
}
