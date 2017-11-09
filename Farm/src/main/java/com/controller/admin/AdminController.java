package com.controller.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dto.AdminDTO;
import com.dto.FreeBoardDTO;
import com.dto.MemberDTO;
import com.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	AdminService aService;
	
	@RequestMapping("adminLogin")
	public ModelAndView adminLogin(@RequestParam(required=false) Map<String, String> map,
								   HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		AdminDTO aDTO = aService.adminLogin(map);
		if(aDTO==null) {
			mav.addObject("admin",false);
			mav.setViewName("forward:login");
		}else {
			mav.setViewName("redirect:admin/adminMain");
			session.setAttribute("admin", aDTO);
		}
		return mav;
	}
	
	@RequestMapping(value="admin/logout")
	public String logout(HttpSession session, RedirectAttributes redirectAttributes) {
		session.invalidate();
		redirectAttributes.addFlashAttribute("mesg","로그아웃 되었습니다.");
		return "redirect:loginForm";
	}
	
	
	@RequestMapping("admin/adminMain")
	public ModelAndView adminMain() {
		ModelAndView mav = new ModelAndView();
		
		int memberCount = aService.admin_memberCount();
		mav.addObject("memberCount",memberCount);
		int orderCount = aService.admin_orderCount();
		mav.addObject("orderCount",orderCount);
		mav.setViewName("adminMain");
		return mav;
	}
	
	@RequestMapping("admin/admin_Member")
	public ModelAndView admin_Member() {
		ModelAndView mav = new ModelAndView();
		
		List<MemberDTO> list = aService.adminMemberList();
		mav.addObject("list",list);
		mav.setViewName("admin_Member");
		return mav;
	}
	
	@RequestMapping("admin/admin_Order")
	public ModelAndView admin_Order() {
		ModelAndView mav = new ModelAndView();
		
		List<Integer> list = aService.admin_FruitCount();
		mav.addObject("list",list);
		mav.setViewName("admin_Order");
		return mav;
	}
	
	@RequestMapping("admin/admin_Board")
	public ModelAndView admin_Board() {
		ModelAndView mav = new ModelAndView();
		
		List<FreeBoardDTO> list = aService.admin_Board();
		mav.addObject("list",list);
		mav.setViewName("admin_Board");
		return mav;
	}
}
