package com.controller.member;

import java.util.HashMap;
<<<<<<< HEAD

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dto.MemberDTO;
import com.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService service;
	
	@RequestMapping("/login")
	public String memberLogin(@RequestParam HashMap<String, String> map, HttpSession session, Model m ) {
		MemberDTO dto = service.memberLogin(map);
		if(dto != null) {
		session.setAttribute("login",dto);
		return "home";
		}else {
			m.addAttribute("loginFail", "로그인 실패");
			return "loginForm";
		}
		
	}
	
	@RequestMapping("/logout")
	public String memberLogout(HttpSession session,Model m) {
		session.invalidate();
		m.addAttribute("logout", "로그아웃 완료");
		return "home";
	}
	
	@RequestMapping("/idCheck")
	public @ResponseBody String memberIdCheck(@RequestParam String userid,Model m) {
		String mesg="* ID duplicated";
		MemberDTO dto=service.memberIdCheck(userid);
		if(	dto == null) {
			mesg="* ID usable";
		}
		m.addAttribute("mesg",mesg);
		return mesg;
	}
	
	
	@RequestMapping("/memberAdd")
	public String memberAdd(@ModelAttribute MemberDTO dto,Model m,HttpSession session,HashMap<String,String> map) {
		service.memberAdd(dto);
		map.put("userid", dto.getUserid());
		map.put("passwd", dto.getPasswd());
		MemberDTO mDTO=service.memberLogin(map);
		session.setAttribute("login", mDTO);
		m.addAttribute("join", "가입완료");
		return "home";
	}
=======
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dto.MemberDTO;
import com.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService service;
	
	@RequestMapping("/login")
	public String memberLogin(@RequestParam HashMap<String, String> map, HttpSession session, Model m ) {
		MemberDTO dto = service.memberLogin(map);
		if(dto != null) {
		session.setAttribute("login",dto);
		return "home";
		}else {
			m.addAttribute("loginFail", "로그인 실패");
			return "loginForm";
		}
		
	}
	
	@RequestMapping("/logout")
	public String memberLogout(HttpSession session,Model m) {
		session.invalidate();
		m.addAttribute("logout", "로그아웃 완료");
		return "home";
	}
	
	@RequestMapping("/idCheck")
	public @ResponseBody String memberIdCheck(@RequestParam String userid,Model m) {
		String mesg="* ID duplicated";
		MemberDTO dto=service.memberIdCheck(userid);
		if(	dto == null) {
			mesg="* ID usable";
		}
		m.addAttribute("mesg",mesg);
		return mesg;
	}
	
	
	@RequestMapping("/memberAdd")
	public String memberAdd(@ModelAttribute MemberDTO dto,Model m,HttpSession session,HashMap<String,String> map) {
		service.memberAdd(dto);
		map.put("userid", dto.getUserid());
		map.put("passwd", dto.getPasswd());
		MemberDTO mDTO=service.memberLogin(map);
		session.setAttribute("login", mDTO);
		m.addAttribute("join", "가입완료");
		return "home";
	}
	
	@RequestMapping("/memberUpdate")
	public String memberUpdate(@ModelAttribute MemberDTO dto,Model m,HttpSession session) {
		System.out.println(dto);
		MemberDTO mDTO=service.memberUpdate(dto);
		session.setAttribute("login", mDTO);
		m.addAttribute("update", "개인정보 수정 완료");
		return "mypage";
	}
	
	@RequestMapping("/memberDelete")
	public String memberDelete(HttpSession session, Model m) {
		MemberDTO dto=(MemberDTO)session.getAttribute("login");
		service.memberDelete(dto.getUserid());
		session.invalidate();
		m.addAttribute("delete", "회원탈퇴 완료");
		return "home";
	}
	
	
>>>>>>> branch 'master' of https://github.com/kyungso/Farm_Spring.git
}
