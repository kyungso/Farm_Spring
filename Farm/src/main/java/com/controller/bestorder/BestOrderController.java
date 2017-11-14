package com.controller.bestorder;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dto.FreeBoardDTO;
import com.dto.GoodsDTO;
import com.dto.OrderDTO;
import com.service.BestOrderService;



@Controller
public class BestOrderController {

	@Autowired
	BestOrderService service;
		
	@RequestMapping("/bestList")
	public ModelAndView bestList(){
		List<OrderDTO> list = service.bestList();
		System.out.println(list);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("bestList");
		mav.addObject("bestList",list);
		return mav;
	}

		

	

	
}
