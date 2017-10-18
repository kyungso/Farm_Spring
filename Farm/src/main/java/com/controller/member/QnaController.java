package com.controller.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
}
