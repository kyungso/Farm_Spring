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
	private String gCode;
	private String gName;
	private int gPrice;
	private int gAmount;
	private String gImage1;
	private String payMethod;
	private String orderDay;
	public OrderDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OrderDTO(int order_num, String userid, String orderName, String phone, String post1, String post2,
			String addr1, String addr2, String gCode, String gName, int gPrice, int gAmount, String gImage1,
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
		this.gCode = gCode;
		this.gName = gName;
		this.gPrice = gPrice;
		this.gAmount = gAmount;
		this.gImage1 = gImage1;
		this.payMethod = payMethod;
		this.orderDay = orderDay;
	}
	
	
	/*public OrderDTO(List<OrderDTO> list, int order_num, String userid, String orderName, String phone, String post1,
			String post2, String addr1, String addr2, String gCode, String gName, int gPrice, int gAmount,
			String gImage1, String payMethod, String orderDay) {
		super();
		this.list = list;
		this.order_num = order_num;
		this.userid = userid;
		this.orderName = orderName;
		this.phone = phone;
		this.post1 = post1;
		this.post2 = post2;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.gCode = gCode;
		this.gName = gName;
		this.gPrice = gPrice;
		this.gAmount = gAmount;
		this.gImage1 = gImage1;
		this.payMethod = payMethod;
		this.orderDay = orderDay;
	}*/
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
	
	/*public List<OrderDTO> getList() {
		return list;
	}

	public void setList(List<OrderDTO> list) {
		this.list = list;
	}*/

	/*@Override
	public String toString() {
		return "OrderDTO [list=" + list + ", order_num=" + order_num + ", userid=" + userid + ", orderName=" + orderName
				+ ", phone=" + phone + ", post1=" + post1 + ", post2=" + post2 + ", addr1=" + addr1 + ", addr2=" + addr2
				+ ", gCode=" + gCode + ", gName=" + gName + ", gPrice=" + gPrice + ", gAmount=" + gAmount + ", gImage1="
				+ gImage1 + ", payMethod=" + payMethod + ", orderDay=" + orderDay + "]";
	}*/

	@Override
	public String toString() {
		return "OrderDTO [order_num=" + order_num + ", userid=" + userid + ", orderName=" + orderName + ", phone="
				+ phone + ", post1=" + post1 + ", post2=" + post2 + ", addr1=" + addr1 + ", addr2=" + addr2 + ", gCode="
				+ gCode + ", gName=" + gName + ", gPrice=" + gPrice + ", gAmount=" + gAmount + ", gImage1=" + gImage1
				+ ", payMethod=" + payMethod + ", orderDay=" + orderDay + "]";
	}
	
	
	
	
}
