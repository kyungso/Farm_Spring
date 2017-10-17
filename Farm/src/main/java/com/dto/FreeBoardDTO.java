package com.dto;

import java.io.File;
import java.util.Arrays;

public class FreeBoardDTO {
	
	 private int board_num;
	 private String userid;
	 private String title;
	 private String author;
	 private String content;
	 private String writeday;
	 private String image;
	 private int readCnt;
	 private String[] files;
	 
	 
	@Override
	public String toString() {
		return "FreeBoardDTO [board_num=" + board_num + ", userid=" + userid + ", title=" + title + ", author=" + author
				+ ", content=" + content + ", writeday=" + writeday + ", image=" + image + ", readCnt=" + readCnt
				+ ", files=" + Arrays.toString(files) + "]";
	}
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getReadCnt() {
		return readCnt;
	}
	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}
	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
	 

	 

}
