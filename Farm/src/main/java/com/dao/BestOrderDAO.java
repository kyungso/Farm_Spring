package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.CartDTO;
import com.dto.GoodsDTO;
import com.dto.OrderDTO;
import com.dto.OrderPageDTO;

@Repository("bestOrderDAO")
public class BestOrderDAO {

	@Autowired
	SqlSessionTemplate template;	

	public List<OrderDTO> bestList(){
		return template.selectList("bestList");
	}
	
	public List<OrderDTO> mbestList(){
		return template.selectList("mbestList");
	}
}
