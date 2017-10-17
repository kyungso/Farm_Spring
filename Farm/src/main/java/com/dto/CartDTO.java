package com.dto;

public class CartDTO {

	private int cart_num;
	private String userid;
	private String gCategory;
	private String gCode;
	private String gName;
	private int gPrice;
	private int gAmount;
	private String gImage1;
	private String gSize;
	public CartDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CartDTO(int cart_num, String userid, String gCategory, String gCode, String gName, int gPrice, int gAmount,
			String gImage1, String gSize) {
		super();
		this.cart_num = cart_num;
		this.userid = userid;
		this.gCategory = gCategory;
		this.gCode = gCode;
		this.gName = gName;
		this.gPrice = gPrice;
		this.gAmount = gAmount;
		this.gImage1 = gImage1;
		this.gSize = gSize;
	}
	public int getCart_num() {
		return cart_num;
	}
	public void setCart_num(int cart_num) {
		this.cart_num = cart_num;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getgCategory() {
		return gCategory;
	}
	public void setgCategory(String gCategory) {
		this.gCategory = gCategory;
	}
	public String getgCode() {
		return gCode;
	}
	public void setgCode(String gCode) {
		this.gCode = gCode;
	}
	public String getgName() {
		return gName;
	}
	public void setgName(String gName) {
		this.gName = gName;
	}
	public int getgPrice() {
		return gPrice;
	}
	public void setgPrice(int gPrice) {
		this.gPrice = gPrice;
	}
	public int getgAmount() {
		return gAmount;
	}
	public void setgAmount(int gAmount) {
		this.gAmount = gAmount;
	}
	public String getgImage1() {
		return gImage1;
	}
	public void setgImage1(String gImage1) {
		this.gImage1 = gImage1;
	}
	public String getgSize() {
		return gSize;
	}
	public void setgSize(String gSize) {
		this.gSize = gSize;
	}
	@Override
	public String toString() {
		return "CartDTO [cart_num=" + cart_num + ", userid=" + userid + ", gCategory=" + gCategory + ", gCode=" + gCode
				+ ", gName=" + gName + ", gPrice=" + gPrice + ", gAmount=" + gAmount + ", gImage1=" + gImage1
				+ ", gSize=" + gSize + "]";
	}
	
}
