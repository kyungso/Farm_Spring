package com.dto;

import java.util.Calendar;
import java.util.List;

import org.apache.ibatis.type.Alias;

@Alias("OrderPageDTO")
public class OrderPageDTO {

	//전체 데이터
	private List<OrderDTO> list;
	private int curPage; //현재 페이지
	private int totalCount; //전체 레코드 갯수
	private static int perPage = 5;
	
	//private String searchName;
	private String searchValue;
	private int perBlock = 5; // 페이지 당 보여줄 페이지 번호 갯수
	
	private String start_date;
	private String end_date;
	
	
	public int getPerBlock() {
		return perBlock;
	}
	public void setPerBlock(int perBlock) {
		this.perBlock = perBlock;
	}

	public OrderPageDTO() {
		super();
		Calendar cal = Calendar.getInstance();
		String s_year = String.valueOf(cal.get(Calendar.YEAR));
		String s_month = String.valueOf(cal.get(Calendar.MONTH)-1);
		String s_day = String.valueOf(cal.get(Calendar.DAY_OF_MONTH));
		s_month = (Integer.parseInt(s_month) < 10) ? "0"+s_month : s_month;
		s_day = (Integer.parseInt(s_day) < 10) ? "0"+s_day : s_day;
		String s = s_year+"-"+s_month+"-"+s_day;
		
		String e_year = String.valueOf(cal.get(Calendar.YEAR));
		String e_month = String.valueOf(cal.get(Calendar.MONTH)+1);
		String e_day = String.valueOf(cal.get(Calendar.DAY_OF_MONTH));
		e_month = (Integer.parseInt(e_month) < 10) ? "0"+e_month : e_month;
		e_day = (Integer.parseInt(e_day) < 10) ? "0"+e_day : e_day;
		String e = e_year+"-"+e_month+"-"+e_day;
		
		this.setStart_date(s);
		this.setEnd_date(e);
	}
	
	public OrderPageDTO(List<OrderDTO> list, int curPage, int totalCount, String searchValue, String start_date,
			String end_date) {
		super();
		this.list = list;
		this.curPage = curPage;
		this.totalCount = totalCount;
		this.searchValue = searchValue;
		this.start_date = start_date;
		this.end_date = end_date;
	}

	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getSearchValue() {
		return searchValue;
	}
	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	
	public int getCurPage() {
		return curPage;
	}
	public List<OrderDTO> getList() {
		return list;
	}
	public void setList(List<OrderDTO> list) {
		this.list = list;
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
	public static void setPerPage(int perPage) {
		OrderPageDTO.perPage = perPage;
	}
	
	
}
