package com.controller.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.dto.FreeBoardDTO;
import com.dto.OrderDTO;
import com.service.BestOrderService;
import com.service.CommentService;
import com.service.FreeBoardService;
import com.service.MemberService;

public class MainController {
	
	@Autowired
	FreeBoardService service;	
	@Autowired
	BestOrderService bService;
	
/*	@RequestMapping(value="/", method=RequestMethod.GET)
    public ModelAndView list(){
		List<FreeBoardDTO> list =service.list();
		List<OrderDTO> list2 =bService.mbestList();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("home");
		mav.addObject("xxx",list);
		mav.addObject("bestList",list2);
    	return mav;
    }*/
}
