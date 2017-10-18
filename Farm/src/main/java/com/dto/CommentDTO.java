package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("CommentDTO")
public class CommentDTO {
	
	private int board_num;
	private int co_num;
	private String userid;
	private String cocontent;
	private String cowriteday;
	private String coupdateday;
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public int getCo_num() {
		return co_num;
	}
	public void setCo_num(int co_num) {
		this.co_num = co_num;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getCocontent() {
		return cocontent;
	}
	public void setCocontent(String cocontent) {
		this.cocontent = cocontent;
	}
	public String getCowriteday() {
		return cowriteday;
	}
	public void setCowriteday(String cowriteday) {
		this.cowriteday = cowriteday;
	}
	public String getCoupdateday() {
		return coupdateday;
	}
	public void setCoupdateday(String coupdateday) {
		this.coupdateday = coupdateday;
	}
	public CommentDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "CommentDTO [board_num=" + board_num + ", co_num=" + co_num + ", userid=" + userid + ", cocontent="
				+ cocontent + ", cowriteday=" + cowriteday + ", coupdateday=" + coupdateday + "]";
	}
	
	
	
	

}
