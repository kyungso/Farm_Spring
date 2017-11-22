package com.controller.member;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dto.MemberDTO;
import com.service.MemberService;

@Controller
public class TestController {

	@Autowired
	MemberService service;
	
	 @RequestMapping("/session")
	 public String login(@RequestParam String nickname, @RequestParam String email,@RequestParam String sns_id,
			 MemberDTO dto, HttpSession session,Model m) {
		 MemberDTO mDTO=service.findSnsId(sns_id);
		 if(mDTO != null) {
		 session.setAttribute("login", mDTO);
		 return "home";
		 }else {
			 m.addAttribute("mesg", "SNS와 연동되어있지 않습니다. 가입먼저 해주세요");
			 m.addAttribute("nickname", nickname);
			 m.addAttribute("email", email);
			 m.addAttribute("sns_id", sns_id);
			 return "snsForm";
		 }		
	 }
	 
	 
	 @RequestMapping(value="/snsAdd", method=RequestMethod.POST)
	 public String snsAdd(@ModelAttribute MemberDTO dto,HttpSession session,Model m) {
	 System.out.println(dto);
	 service.snsAdd(dto);
	 session.setAttribute("login", dto);
	 m.addAttribute("join", "SNS 연동완료");
		 return "home";
	 }
	 

		@RequestMapping("/SNSmemberUpdate")
		public String SNSmemberUpdate(@RequestParam String userid, @RequestParam String phone1,
				@RequestParam String phone2,@RequestParam String phone3, HashMap<String, String> map,
				HttpSession session,Model m) {
			map.put("userid",userid);
			map.put("phone1", phone1);
			map.put("phone2", phone2);
			map.put("phone3", phone3);
			System.out.println(map);
			MemberDTO dto=service.SNSmemberUpdate(map);	
			session.setAttribute("login", dto);
			m.addAttribute("update", "정보가 수정되었습니다");
			return "mypage";
		}

		
		
		 @RequestMapping("/idCheckForPw")
		 public @ResponseBody String idCheckForPw(@RequestParam String userid) {
			 System.out.println(userid);
			 String validUserid = service.idCheckForPw(userid);
			 if(validUserid == null) {
				 return "false";
			 }else {
				 return "true"; 
			 }
		 }
		
		

		 @RequestMapping(value="/nameCheck", method=RequestMethod.GET)
		 public @ResponseBody String NameCheck(@RequestParam String userid, @RequestParam String username,
				 @RequestParam String phone1, @RequestParam String phone2, @RequestParam String phone3, 
				 HashMap<String,String> map) {
			 System.out.println(username);
			 System.out.println(phone1);
			 map.put("username",username);
			 map.put("userid",userid);
			 map.put("phone1",phone1);
			 map.put("phone2",phone2);
			 map.put("phone3",phone3);
			String validId=service.NameCheck(map);
			if(validId == null) {
				return "false";
			}else {
				return "true";
			}
			 
		 }
		 
	
		 
		 /*
		 @RequestMapping(value="/phoneCheck", method=RequestMethod.GET)
		 public @ResponseBody String phoneCheck(@RequestParam String userid, @RequestParam int phone1,
				 @RequestParam int phone2,@RequestParam int phone3,HashMap map) {
			 System.out.println(phone2);
			 System.out.println(phone3);
			 map.put("userid",userid);
			 map.put("phone1",phone1);
			 map.put("phone2",phone2);
			 map.put("phone3",phone3);
			String validId2=service.phoneCheck(map);
			if(validId2 == null) {
				return "false";
			}else {
				return "true";
			}
			 
		 }
	*/
		 
		 
		 
		 
		 @RequestMapping( "/register")
		 public  String register(@RequestParam String bizNo, @RequestParam String phone1, @RequestParam String phone2, @RequestParam String phone3) {
			 
			return "main_mypage";
		 }
}
