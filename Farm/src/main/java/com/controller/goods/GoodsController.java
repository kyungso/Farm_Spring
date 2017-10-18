package com.controller.goods;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.GoodsDTO;
import com.service.GoodsService;

@Controller
public class GoodsController {

	@Autowired
	GoodsService service;
	
	@RequestMapping("/goodsAllList")
	@ModelAttribute("goodsAllList")
	public List<GoodsDTO> goodsAllList(){
		return service.goodsAllList();
	}
	
	@RequestMapping("/goodsList")
	@ModelAttribute("goodsList")
	public List<GoodsDTO> goodsList(@RequestParam String gCategory){
		return service.goodsList(gCategory);
	}
	
	@RequestMapping("/goodsRetrieve")
	@ModelAttribute("goodsRetrieve")
	public GoodsDTO goodsRetrieve(@RequestParam String gCode){
		return service.goodsRetrieve(gCode);
	}
	
}
