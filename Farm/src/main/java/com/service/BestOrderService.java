package com.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.BestOrderDAO;
import com.dto.CartDTO;
import com.dto.GoodsDTO;
import com.dto.OrderDTO;
import com.dto.OrderPageDTO;

@Service("bestOrderService")
public class BestOrderService {

	@Autowired
	BestOrderDAO dao;
	
	public List<OrderDTO> bestList(){
		return dao.bestList();
	}
	
	public List<OrderDTO> mbestList(){
		return dao.mbestList();
	}
	

}
