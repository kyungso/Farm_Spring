package com.dto;

import java.util.List;

public class QnaPageDTO {

	//전체데이터
	private List<QnaDTO> list;
	private int curPage;
	private int totalCount;
	 public static int perPage=6;

	public QnaPageDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QnaPageDTO(List<QnaDTO> list, int curPage, int totalCount) {
		super();
		this.list = list;
		this.curPage = curPage;
		this.totalCount = totalCount;
	}
	public List<QnaDTO> getList() {
		return list;
	}
	public void setList(List<QnaDTO> list) {
		this.list = list;
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public static int getPerPage() {
		return perPage;
	}

	@Override
	public String toString() {
		return "QnaPageDTO [list=" + list + ", curPage=" + curPage + ", totalCount=" + totalCount + "]";
	}

	
}
