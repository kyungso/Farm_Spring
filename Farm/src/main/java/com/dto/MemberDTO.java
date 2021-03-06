package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("MemberDTO")
public class MemberDTO {

	private String userid;
	private String passwd;
	private String username;
	private String post1;
	private String post2;
	private String addr1;
	private String addr2;
	private String phone1;
	private String phone2;
	private String phone3;
	private String email;
	private int point;
	private int buycnt;
	private String joinday;
	private int jointype;
	private String sns_id;
	private String isSeller;

	public String getSns_id() {
		return sns_id;
	}

	public String getIsSeller() {
		return isSeller;
	}

	public void setIsSeller(String isSeller) {
		this.isSeller = isSeller;
	}

	public void setSns_id(String sns_id) {
		this.sns_id = sns_id;
	}

	public MemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}





	public MemberDTO(String userid, String passwd, String username, String post1, String post2, String addr1,
			String addr2, String phone1, String phone2, String phone3, String email, int point, int buycnt,
			String joinday, int jointype, String sns_id, String isSeller) {
		super();
		this.userid = userid;
		this.passwd = passwd;
		this.username = username;
		this.post1 = post1;
		this.post2 = post2;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.phone1 = phone1;
		this.phone2 = phone2;
		this.phone3 = phone3;
		this.email = email;
		this.point = point;
		this.buycnt = buycnt;
		this.joinday = joinday;
		this.jointype = jointype;
		this.sns_id = sns_id;
		this.isSeller = isSeller;
	}

	@Override
	public String toString() {
		return "MemberDTO [userid=" + userid + ", passwd=" + passwd + ", username=" + username + ", post1=" + post1
				+ ", post2=" + post2 + ", addr1=" + addr1 + ", addr2=" + addr2 + ", phone1=" + phone1 + ", phone2="
				+ phone2 + ", phone3=" + phone3 + ", email=" + email + ", point=" + point + ", buycnt=" + buycnt
				+ ", joinday=" + joinday + " , joinType : " + jointype + "sns_id : " +sns_id;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
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

	public String getPhone1() {
		return phone1;
	}

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getPhone3() {
		return phone3;
	}

	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}

	public String getEmail() {
		return email;
	}

	public int getJointype() {
		return jointype;
	}

	public void setJointype(int jointype) {
		this.jointype = jointype;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getBuycnt() {
		return buycnt;
	}

	public void setBuycnt(int buycnt) {
		this.buycnt = buycnt;
	}

	public String getJoinday() {
		return joinday;
	}

	public void setJoinday(String joinday) {
		this.joinday = joinday;
	}

}
