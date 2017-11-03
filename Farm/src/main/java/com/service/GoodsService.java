package com.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.GoodsDAO;
import com.dto.GoodsDTO;

@Service("goodsService")
public class GoodsService {

	@Autowired
	GoodsDAO dao;
	
	public List<GoodsDTO> goodsAllList(){
		return dao.goodsAllList();
	}
	
	public List<GoodsDTO> goodsList(String gcategory){
		return dao.goodsList(gcategory);
	}
	
	public GoodsDTO goodsRetrieve(String gcode) {
		return dao.goodsRetrieve(gcode);
	}
	
	public int goodsWrite(HashMap<String, String> map) {
		return dao.goodsWrite(map);		
	}
	
}
