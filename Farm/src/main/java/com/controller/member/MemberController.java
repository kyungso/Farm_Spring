package com.controller.member;


import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;
import java.util.HashMap;

import java.util.Properties;


import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.dto.MemberDTO;
import com.service.MemberService;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;

@Controller
public class MemberController {

	@Autowired
	MemberService service;
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String memberLogin(@RequestParam HashMap<String, String> map, HttpSession session, 
							  Model m, HttpServletRequest request ) {
		
		MemberDTO dto = service.memberLogin(map);
		
		//관리자 
				if(request.getAttribute("admin")==null) {
					return "forward:adminLogin";
				}
		////////////////////////////////////////////////////////
				
		if(dto != null) {
		session.setAttribute("login",dto);
		m.addAttribute("mesg","로그인 되었습니다");
		return "home";
		}else {
			m.addAttribute("mesg", "비밀번호/아이디를 다시 확인해주세요.");
			return "loginForm";
		}
		
	}
	
	@RequestMapping("/logout")
	public String memberLogout(HttpSession session,Model m) {
		session.invalidate();
		m.addAttribute("mesg", "로그아웃 완료");
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
	
	@RequestMapping(value="/emailCheck", method=RequestMethod.GET)
	public @ResponseBody String emailCheck(@RequestParam String email,Model m) {
		System.out.println(email);
		String validEmail=service.emailCheck(email);
		if(	validEmail == null) {
			System.out.println("validEmail 없음");
			return "false";
		}else {
			System.out.println("validEmail 있음");
		return "true";
		}
	}
	
	
	@RequestMapping(value="/memberAdd", method=RequestMethod.POST)
	public String memberAdd(@ModelAttribute MemberDTO dto,
			@RequestParam("g-recaptcha-response") String g_recaptcha_response ,Model m,HttpSession session,HashMap<String,String> map) {
	
		
		System.out.println(g_recaptcha_response);
		
		try {
		 URL url = new URL("https://www.google.com/recaptcha/api/siteverify?secret=6LdunzUUAAAAAI0gPe2IwIXN5qUoST2KxZ9nx4co&response="+g_recaptcha_response);
         HttpURLConnection conn = (HttpURLConnection) url.openConnection();
         conn.setRequestMethod("POST");
         conn.setRequestProperty("User-Agent", "Mozilla/5.0");
 		conn.setRequestProperty("Accept-Language", "en-US,en;q=0.5");
		
 		conn.setDoOutput(true);
		DataOutputStream wr = new DataOutputStream(conn.getOutputStream());
		wr.flush();
		wr.close();
		
		BufferedReader in = new BufferedReader(new InputStreamReader(
				conn.getInputStream()));
		String inputLine;
		StringBuffer response = new StringBuffer();

		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		in.close();
		System.out.println(response.toString());
		JsonReader jsonReader = Json.createReader(new StringReader(response.toString()));
		JsonObject jsonObject = jsonReader.readObject();
		jsonReader.close();
		
		
		System.out.println(jsonObject.getBoolean("success"));
		
		if(jsonObject.getBoolean("success") == true) {
			
			service.memberAdd(dto);
     		map.put("userid", dto.getUserid());
     		map.put("passwd", dto.getPasswd());
     		MemberDTO mDTO=service.memberLogin(map);
     		session.setAttribute("login", mDTO);
     		m.addAttribute("mesg", "가입완료");
			}else {
			m.addAttribute("mesg", "가입실패. 빠진 부분 없이 다시 가입형식을 작성해주세요");	
			return "memberForm";
			}
		return "home";
		
		}catch(Exception e){
			m.addAttribute("mesg", "가입실패");	
			return "home";
		}
	}
		
	
	@RequestMapping(value="/memberUpdate", method=RequestMethod.POST)
	public String memberUpdate(@ModelAttribute MemberDTO dto,Model m,HttpSession session) {
		System.out.println(dto);
		MemberDTO mDTO=service.memberUpdate(dto);
		session.setAttribute("login", mDTO);
		m.addAttribute("mesg", "개인정보 수정 완료");
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
	
	
	@RequestMapping(value="/idAuth")
	public ModelAndView idAuth(@RequestParam String searchName, @RequestParam String searchVal) {

		ModelAndView mav=new ModelAndView();
		mav.setViewName("member/idAuth");
		mav.addObject("userid",searchVal);
		return mav;
	}
	
	
	
	@RequestMapping(value="/emailAuth")
	public ModelAndView emailAuth(@RequestParam String searchName, @RequestParam String searchVal,
			HttpSession session) {
		String email=searchVal;
		String authNum="";
			authNum=RandomNum();

			sendEMail(email.toString(),authNum);
			
			ModelAndView mav=new ModelAndView();
			mav.setViewName("member/emailAuth");
			mav.addObject("email",email);
			mav.addObject("authNum",authNum);
			return mav;
			
	}
	
	private void sendEMail(String email, String authNum) {
		String host = "smtp.gmail.com";
		String subject="인증번호 전달";
		String fromName="RyanFarm";
		String from="leehyemi0468@gmail.com";
		String to1=email;
		
		String content="인증번호 [" + authNum + "]";
		try {
			Properties props=new Properties();
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host",host);
			props.setProperty("mail.smtp.soketFactory.class", 
					"javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port", "587");
			props.put("mail.smtp.user", from);
			props.put("mail.smtp.auth", "true");
			
			Session session=Session.getInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new javax.mail.PasswordAuthentication("leehyemi0468@gmail.com", "dlgoa1007");	
				}
			});
			
			Message msg=new MimeMessage(session);
			msg.setFrom(new InternetAddress(from,MimeUtility.encodeText(
					fromName,"UTF-8","B")));
			InternetAddress[] address1= { new InternetAddress(to1)};
			msg.setRecipients(Message.RecipientType.TO, address1);
			msg.setSubject(subject);
			msg.setSentDate(new Date());
			msg.setContent(content,"text/html;charset=euc-kr");
			Transport.send(msg);
		}catch(MessagingException e) {
			e.printStackTrace();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	
	public  String RandomNum() {
		StringBuffer buffer=new StringBuffer();
		for(int i=0; i<=6; i++) {
			int n=(int)(Math.random()*10);
			buffer.append(n);
		}return buffer.toString();
	}
	
	
	
	@RequestMapping("/changePw")
	public String changePw(@RequestParam String newPw, @RequestParam String email,HashMap<String,String> map,Model m) {
		System.out.println(newPw + "\t" + email);
		map.put("email", email);
		map.put("newPw", newPw);
		service.changePw(map);
		m.addAttribute("mesg", "비밀번호가 변경되었습니다. 로그인 해주세요");
		return "loginForm";
	}
	
	@RequestMapping("/changePw_id")
	public String changePw_id(@RequestParam String newPw, @RequestParam String userid,HashMap<String,String> map,Model m) {
		System.out.println(newPw + "\t" + userid);
		map.put("userid", userid);
		map.put("newPw", newPw);
		service.changePw_id(map);
		m.addAttribute("mesg", "비밀번호가 변경되었습니다. 로그인 해주세요");
		return "loginForm";
	}
	
	
}
