package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("AdminDTO")
public class AdminDTO {

	private String userid;
	private String passwd;
	public AdminDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AdminDTO(String userid, String passwd) {
		super();
		this.userid = userid;
		this.passwd = passwd;
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
	@Override
	public String toString() {
		return "AdminDTO [userid=" + userid + ", passwd=" + passwd + "]";
	}
	
	
}
