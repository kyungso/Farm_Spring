package com.dto;

import java.io.File;
import java.util.Arrays;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Alias("FreeBoardDTO")
public class FreeBoardDTO {
	
	 private int board_num;
	 private String userid;
	 private String title;
	 private String author;
	 private String content;
	 private String writeday;
	 private CommonsMultipartFile image;
	 private String imageName;
	 private int readCnt;
	 private String secret;
	 private String passwd;
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriteday() {
		return writeday;
	}
	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}
	public CommonsMultipartFile getImage() {
		return image;
	}
	public void setImage(CommonsMultipartFile image) {
		this.image = image;
	}
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	public int getReadCnt() {
		return readCnt;
	}
	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}
	public String getSecret() {
		return secret;
	}
	public void setSecret(String secret) {
		this.secret = secret;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	@Override
	public String toString() {
		return "FreeBoardDTO [board_num=" + board_num + ", userid=" + userid + ", title=" + title + ", author=" + author
				+ ", content=" + content + ", writeday=" + writeday + ", image=" + image + ", imageName=" + imageName
				+ ", readCnt=" + readCnt + ", secret=" + secret + ", passwd=" + passwd + "]";
	}
	public FreeBoardDTO(int board_num, String userid, String title, String author, String content, String writeday,
			CommonsMultipartFile image, String imageName, int readCnt, String secret, String passwd) {
		super();
		this.board_num = board_num;
		this.userid = userid;
		this.title = title;
		this.author = author;
		this.content = content;
		this.writeday = writeday;
		this.image = image;
		this.imageName = imageName;
		this.readCnt = readCnt;
		this.secret = secret;
		this.passwd = passwd;
	}
	public FreeBoardDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	 
	
	 
	 	 

}
