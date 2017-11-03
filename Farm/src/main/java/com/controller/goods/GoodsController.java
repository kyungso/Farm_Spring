package com.controller.goods;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

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
	
	@RequestMapping("/gWrite")
	public String write() {
		return "goodsWrite";
	}
	
	@RequestMapping(value="/goodsWrite" , method= RequestMethod.POST)
	public ModelAndView goodsWrite(GoodsDTO dto,	HashMap<String, String> map
			,Model m,HttpServletRequest servletRequest) {		
		ModelAndView mav = new ModelAndView();
		List<MultipartFile> files = dto.getImage();
		List<String> fileNames =  new ArrayList<String>();
		if (null != files && files.size()>0) {
			for (MultipartFile multipartFile : files) {
				String fileName = multipartFile.getOriginalFilename();
				fileNames.add(fileName);
				File f = new File("c:\\upload",fileName);
				try {
					multipartFile.transferTo(f);
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			    map.put("gcode",dto.getGcode());
				map.put("gcategory",dto.getGcategory());
				map.put("gname",dto.getGname());
				map.put("gcontent", dto.getGcontent());
				map.put("gprice", String.valueOf(dto.getGprice()));
			    m.addAttribute("gimage1",fileNames.get(0));
				map.put("gimage2", fileName);
			}
		}
			service.goodsWrite(map);
			mav.setViewName("redirect:goodsAllList");
			return mav;		
		}
	

}
	