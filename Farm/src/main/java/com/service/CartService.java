package com.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.CartDAO;
import com.dto.CartDTO;

@Service("cartService")
public class CartService {

	@Autowired
	CartDAO dao;
	
	public void addCart(CartDTO dto) {
		dao.addCart(dto);
	}
	
	public List<CartDTO> cartList(String userid){
		return dao.cartList(userid);
	}
	
	public void amountUpdate(Map<String, Integer> map) {
		dao.amountUpdate(map);
	}
	
	public void delCart(int num) {
		dao.delCart(num);
	}
	
	public void delAllCart(List<String> list) {
		dao.delAllCart(list);
	}
	
}
