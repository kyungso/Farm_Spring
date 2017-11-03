package com.controller.member;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dto.MemberDTO;
import com.dto.QnaDTO;
import com.service.QnaService;

@Controller
public class QnaController {

	@Autowired
	QnaService service;
	
	@RequestMapping("/QNAList")
	public String qnaList(@RequestParam String userid, Model m){
		List<QnaDTO> list=service.qnaList(userid);
		m.addAttribute("qnaList", list);
		return "qnaList";
	}
	
	@RequestMapping("/QNARetrieve")
	public ModelAndView QNARetrieve(@RequestParam HashMap<String,String> map){
		QnaDTO qDTO=service.QNARetrieve(map);
		ModelAndView mav=new ModelAndView();
		mav.addObject("qnaRetrieve", qDTO);
		mav.setViewName("qnaRetrieve");
		return mav;
	}
	
	
	@RequestMapping(value="/QNAWrite", method=RequestMethod.POST)
	public String QNAWrite(@ModelAttribute QnaDTO dto ){
		System.out.println(dto);
		service.QNAWrite(dto);
		return "redirect:QNAList?userid="+dto.getUserid();
	}

	
	@RequestMapping(value="/QNAUpdateForm")
	public String QNAUpdateForm(@ModelAttribute QnaDTO dto,Model m){
		System.out.println(dto);
		m.addAttribute("qdto",dto);
		return "qnaUpdateForm";
	}
	
	
	@RequestMapping(value="/QNAUpdate")
	public String QNAUpdate(@ModelAttribute QnaDTO dto){
		service.QNAUpdate(dto);
		return "redirect:QNAList?userid="+dto.getUserid();
	}
	
	@RequestMapping(value="/QNADelete")
	public String QNADelete(@ModelAttribute QnaDTO dto ){
		System.out.println(dto);
		service.QNADelete(Integer.parseInt(dto.getQna_num()));
		return "redirect:QNAList?userid="+dto.getUserid();
	}

	@RequestMapping(value="/QNAReplyForm")
	public String QNAReplyForm(@ModelAttribute QnaDTO dto,Model m ){
		m.addAttribute("qna_num", dto.getQna_num());
		m.addAttribute("title", dto.getTitle());
		return "qnaReply";
	}
	
	
}
