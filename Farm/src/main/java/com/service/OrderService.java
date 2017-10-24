package com.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.CartDAO;
import com.dao.OrderDAO;
import com.dto.CartDTO;
import com.dto.OrderDTO;
import com.dto.OrderPageDTO;

@Service("orderService")
public class OrderService {

	@Autowired
	OrderDAO oDAO;
	
	@Autowired
	CartDAO cDAO;
	
	public CartDTO orderConfirm(int cart_num) {
		return oDAO.orderConfirm(cart_num);
	}
	
	public List<CartDTO> orderAllConfirm(List<String> cart_num){
		return oDAO.orderAllConfirm(cart_num);
	}
	
	@Transactional
	public void orderDone(OrderDTO dto,String cart_num) {
		oDAO.orderDone(dto);
		cDAO.delCart(Integer.parseInt(cart_num));
	}
	public void orderDone_d(OrderDTO dto) {
		oDAO.orderDone(dto);
	}
	@Transactional
	public void orderAllDone(List<OrderDTO> list, List<String> cart_num) {
		oDAO.orderAllDone(list);
		cDAO.delAllCart(cart_num);
	}
	
	public List<OrderDTO> orderList(String userid){
		return oDAO.orderList(userid);
	}
	
	public OrderPageDTO page(int curPage,HashMap<String, String> map) {
		return oDAO.page(curPage,map);
	}
	
	public OrderDTO orderListDetail(int order_num) {
		return oDAO.orderListDetail(order_num);
	}
	
	public void orderDel(List<String> order_num) {
		oDAO.orderDel(order_num);
	}
}
