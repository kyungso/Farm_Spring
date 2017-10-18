package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("QnaDTO")
public class QnaDTO {

	private String userid;
	private String username;
	private int phone1;
	private int phone2;
	private int phone3;
	private String email;
	private String title;
	private String content;
	private String qna_num;
	private String writeday;
	private String state;
	private String match;
	public QnaDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public String getMatch() {
		return match;
	}


	public void setMatch(String match) {
		this.match = match;
	}


	public QnaDTO(String userid, String username, int phone1, int phone2, int phone3, String email, String title,
			String content, String qna_num, String writeday, String state, String match) {
		super();
		this.userid = userid;
		this.username = username;
		this.phone1 = phone1;
		this.phone2 = phone2;
		this.phone3 = phone3;
		this.email = email;
		this.title = title;
		this.content = content;
		this.qna_num = qna_num;
		this.writeday = writeday;
		this.state = state;
		this.match = match;
	}


	public String getUserid() {
		return userid;
	}
	@Override
	public String toString() {
		return "QnaDTO [userid=" + userid + ", username=" + username + ", phone1=" + phone1 + ", phone2=" + phone2
				+ ", phone3=" + phone3 + ", email=" + email + ", title=" + title + ", content=" + content + ", qna_num="
				+ qna_num + ", writeday=" + writeday + ", state=" + state + "]";
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getPhone1() {
		return phone1;
	}
	public void setPhone1(int phone1) {
		this.phone1 = phone1;
	}
	public int getPhone2() {
		return phone2;
	}
	public void setPhone2(int phone2) {
		this.phone2 = phone2;
	}
	public int getPhone3() {
		return phone3;
	}
	public void setPhone3(int phone3) {
		this.phone3 = phone3;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getQna_num() {
		return qna_num;
	}
	public void setQna_num(String qna_num) {
		this.qna_num = qna_num;
	}
	public String getWriteday() {
		return writeday;
	}
	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	
}
