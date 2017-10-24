package com.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.CartDTO;

@Repository("cartDAO")
public class CartDAO {

	@Autowired
	SqlSessionTemplate template;
	
	public void addCart(CartDTO dto) {
		template.insert("addCart",dto);
	}
	
	public List<CartDTO> cartList(String userid){
		return template.selectList("cartList",userid);
	}
	
	public void amountUpdate(Map<String, Integer> map) {
		template.update("amountUpdate",map);
	}
	
	public void delCart(int cart_num) {
		template.delete("delCart",cart_num);
	}
	
	public void delAllCart(List<String> list) {
		template.delete("delAllCart",list);
	}
	
	
}
