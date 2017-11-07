package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("CartDTO")
public class CartDTO {

	private int cart_num;
	private String userid;
	private String gcategory;
	private String gcode;
	private String gname;
	private int gprice;
	private int gamount;
	private String gimage1;
	public CartDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CartDTO(int cart_num, String userid, String gcategory, String gcode, String gname, int gprice, int gamount,
			String gimage1) {
		super();
		this.cart_num = cart_num;
		this.userid = userid;
		this.gcategory = gcategory;
		this.gcode = gcode;
		this.gname = gname;
		this.gprice = gprice;
		this.gamount = gamount;
		this.gimage1 = gimage1;
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
	public String getGcategory() {
		return gcategory;
	}
	public void setGcategory(String gcategory) {
		this.gcategory = gcategory;
	}
	public String getGcode() {
		return gcode;
	}
	public void setGcode(String gcode) {
		this.gcode = gcode;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public int getGprice() {
		return gprice;
	}
	public void setGprice(int gprice) {
		this.gprice = gprice;
	}
	public int getGamount() {
		return gamount;
	}
	public void setGamount(int gamount) {
		this.gamount = gamount;
	}
	public String getGimage1() {
		return gimage1;
	}
	public void setGimage1(String gimage1) {
		this.gimage1 = gimage1;
	}
	@Override
	public String toString() {
		return "CartDTO [cart_num=" + cart_num + ", userid=" + userid + ", gcategory=" + gcategory + ", gcode=" + gcode
				+ ", gname=" + gname + ", gprice=" + gprice + ", gamount=" + gamount + ", gimage1=" + gimage1 + "]";
	}
	
}
