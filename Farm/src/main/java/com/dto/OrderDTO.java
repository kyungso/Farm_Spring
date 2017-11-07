package com.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;

@Alias("OrderDTO")
public class OrderDTO {
	
	//List<OrderDTO> list;
	
	private int order_num;
	private String userid;
	private String orderName;
	private String phone;
	private String post1;
	private String post2;
	private String addr1;
	private String addr2;
	private String gcode;
	private String gname;
	private int gprice;
	private int gamount;
	private String gimage1;
	private String payMethod;
	private String orderDay;
	public OrderDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OrderDTO(int order_num, String userid, String orderName, String phone, String post1, String post2,
			String addr1, String addr2, String gcode, String gname, int gprice, int gamount, String gimage1,
			String payMethod, String orderDay) {
		super();
		this.order_num = order_num;
		this.userid = userid;
		this.orderName = orderName;
		this.phone = phone;
		this.post1 = post1;
		this.post2 = post2;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.gcode = gcode;
		this.gname = gname;
		this.gprice = gprice;
		this.gamount = gamount;
		this.gimage1 = gimage1;
		this.payMethod = payMethod;
		this.orderDay = orderDay;
	}
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPost1() {
		return post1;
	}
	public void setPost1(String post1) {
		this.post1 = post1;
	}
	public String getPost2() {
		return post2;
	}
	public void setPost2(String post2) {
		this.post2 = post2;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
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
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public String getOrderDay() {
		return orderDay;
	}
	public void setOrderDay(String orderDay) {
		this.orderDay = orderDay;
	}
	@Override
	public String toString() {
		return "OrderDTO [order_num=" + order_num + ", userid=" + userid + ", orderName=" + orderName + ", phone="
				+ phone + ", post1=" + post1 + ", post2=" + post2 + ", addr1=" + addr1 + ", addr2=" + addr2 + ", gcode="
				+ gcode + ", gname=" + gname + ", gprice=" + gprice + ", gamount=" + gamount + ", gimage1=" + gimage1
				+ ", payMethod=" + payMethod + ", orderDay=" + orderDay + "]";
	}
	
	
	
}
