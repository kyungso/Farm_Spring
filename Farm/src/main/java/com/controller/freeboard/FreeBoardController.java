package com.controller.freeboard;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dto.FreeBoardDTO;
import com.dto.MemberDTO;
import com.dto.PageDTO;
import com.service.FreeBoardService;

@Controller
public class FreeBoardController {
	
	@Autowired
	FreeBoardService service;
	
	@RequestMapping(value="/boardForm" , method=RequestMethod.GET)
	public String boardList(@RequestParam(defaultValue="title") String searchName,
			@RequestParam(defaultValue="") String searchValue,
			@RequestParam(defaultValue="1") String curPage,
			@RequestParam HashMap<String, String> map, Model m) {
     	map.put("searchName", searchName);
		map.put("searchValue", searchValue);
		PageDTO list= service.page(Integer.parseInt(curPage), map);
		m.addAttribute("list",list);
		m.addAttribute("perPage", list.getPerPage());	
		return "boardForm";
	}
	
	@RequestMapping("/write")
	public String write() {
		return "boardWriteUI";
	}
	
	@RequestMapping(value="/boardWrite" , 
			method= {RequestMethod.POST,RequestMethod.GET})
	public String boardWrite(/*@Valid*/ @ModelAttribute("xxx") FreeBoardDTO dto
			/*,BindingResult result,Model m*/,HttpSession session) {
/*		if(result.hasErrors()) {
			return "boardWriteUI";
		}*/
		MemberDTO mdto = (MemberDTO)session.getAttribute("login");
		dto.setUserid(mdto.getUserid());
		service.boardWrite(dto);
		return "redirect:boardForm";
	}
	
    @RequestMapping(value="/retrieve/board_num/{board_num}",
    		method=RequestMethod.GET)
    public String retrieve(@PathVariable int board_num, Model m) {
    	   FreeBoardDTO dto = service.selectByNum(board_num);
    	   m.addAttribute("retrieve", dto);
           return "boardRetrieve";
    }
    
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String delete(@RequestParam int board_num) throws Exception{ 
	    service.deleteByNum(board_num);
		return "redirect:boardForm";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String write(@ModelAttribute("xxx") FreeBoardDTO dto){ 
		service.updateByNum(dto);
		return "redirect:list";
	}
    

    
    
	
		

}
