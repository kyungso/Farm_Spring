package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.CartDTO;
import com.dto.OrderDTO;
import com.dto.OrderPageDTO;

@Repository("orderDAO")
public class OrderDAO {

	@Autowired
	SqlSessionTemplate template;
	
	public CartDTO orderConfirm(int cart_num) {
		CartDTO dto = template.selectOne("orderConfirm",cart_num);
		return dto;
	}
	
	public List<CartDTO> orderAllConfirm(List<String> cart_num){
		List<CartDTO> list = template.selectList("orderAllConfirm",cart_num);
		return list;
	}
	
	public void orderDone(OrderDTO dto) {
		template.insert("orderDone",dto);
	}
	public void orderDone_d(OrderDTO dto_d) {
		template.insert("orderDone",dto_d);
	}
	
	public void orderAllDone(List<OrderDTO> list) {
		template.insert("orderAllDone",list);
	}
	
	public List<OrderDTO> orderList(String userid){
		return template.selectList("orderList",userid);
	}
	
	public OrderPageDTO page(int curPage, HashMap<String, String> map) {
		OrderPageDTO dto = new OrderPageDTO();
		
		int sIndex = (curPage-1)*OrderPageDTO.getPerPage();
		int length = OrderPageDTO.getPerPage();
		List<OrderDTO> list = template.selectList("orderList",map,new RowBounds(sIndex,length));
		
		int totalCount = 0;
		dto.setList(list);
		dto.setCurPage(curPage);
		
		if(map.get("searchValue")==null) {
			totalCount = template.selectOne("order_totalCount",map);
		}else {
			totalCount = template.selectOne("order_totalSearchValue",map);
		}
		
		dto.setTotalCount(totalCount);
		dto.setSearchValue(map.get("searchValue"));
		dto.setStart_date(map.get("start_date"));
		dto.setEnd_date(map.get("end_date"));
		return dto;
	}
	
	public OrderDTO orderListDetail(int order_num) {
		return template.selectOne("orderListDetail",order_num);
	}
	
	public void orderDel(List<String> order_num) {
		template.delete("orderDel",order_num);
	}
}
