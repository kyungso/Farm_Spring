package com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.GoodsDTO;

@Repository("goodsDAO")
public class GoodsDAO {

	@Autowired
	SqlSessionTemplate template;
	
	public List<GoodsDTO> goodsAllList(){
		List<GoodsDTO> list = template.selectList("goodsAllList");
		return list;
	}
	
	public List<GoodsDTO> goodsList(String gcategory){
		List<GoodsDTO> list = template.selectList("goodsList",gcategory);
		return list;
	}
	
	public GoodsDTO goodsRetrieve(String gcode) {
		return template.selectOne("goodsRetrieve",gcode);
	}
}
