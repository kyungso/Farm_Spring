package com.controller.freeboard;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.AlternativeJdkIdGenerator;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dto.CommentDTO;
import com.dto.FileDTO;
import com.dto.FreeBoardDTO;
import com.dto.MemberDTO;
import com.dto.PageDTO;
import com.service.CommentService;
import com.service.FreeBoardService;
import com.service.MemberService;

@Controller
public class FreeBoardController {
	
	@Autowired
	FreeBoardService service;	
	@Autowired
	CommentService cService;	
	@Autowired
	MemberService mService;
	
	@RequestMapping("/boardForm")
	public String boardList(@RequestParam(defaultValue="title") String searchName,
			@RequestParam(defaultValue="") String searchValue,
			@RequestParam(defaultValue="1") int curPage,
			@RequestParam HashMap<String, String> map, Model m) {
     	map.put("searchName", searchName);
		map.put("searchValue", searchValue);
		PageDTO list= service.page(curPage, map);
		m.addAttribute("list",list);
		m.addAttribute("perPage", list.getPerPage());	
		return "boardForm";
	}
	
	@RequestMapping("/write")
	public String write() {
		return "boardWriteUI";
	}
	
	//컬럼추가
	//ALTER TABLE FREEBOARD ADD (IMAGENAME VARCHAR2(100));
	@RequestMapping(value="/boardWrite" , method= RequestMethod.POST)
	public ModelAndView boardWrite(@ModelAttribute FreeBoardDTO bdto,
			HttpSession session, HashMap<String, String> map,
			@RequestParam MultipartFile image) {		
		MemberDTO mdto = (MemberDTO)session.getAttribute("login");
		bdto.setUserid(mdto.getUserid());	
		ModelAndView mav = new ModelAndView();
		if(bdto.getImage().getOriginalFilename()==null) {
			String content = bdto.getContent().replace("\r\n","<br>");
			map.put("userid", bdto.getUserid());
			map.put("author", bdto.getAuthor());
			map.put("title", bdto.getTitle());
			map.put("content", bdto.getContent());
		   } else  { 
			CommonsMultipartFile theFile = bdto.getImage();
			String originalFilename = theFile.getOriginalFilename();
			File f = new File("c:\\upload" , originalFilename );
			try {
				theFile.transferTo(f);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String content = bdto.getContent().replace("\r\n","<br>");
			map.put("userid", bdto.getUserid());
			map.put("author", bdto.getAuthor());
			map.put("title", bdto.getTitle());
			map.put("content", content);
			map.put("imageName", originalFilename);
			map.put("secret", bdto.getSecret());
			map.put("passwd",bdto.getPasswd() );
		}
		service.boardWrite(map);
		mav.setViewName("redirect:boardForm");
		return mav;		
	}
	
    @RequestMapping("/boardRetrieve")
    public String retrieve(@RequestParam int board_num, Model m, HttpSession session) {
	    	   FreeBoardDTO dto = service.selectByNum(board_num);	    	   
	    	   if(dto.getSecret()!=null) {
	    		   m.addAttribute("board_num",board_num);
	    		   m.addAttribute("retrieve", dto);
		    	   m.addAttribute("list",cService.selectComment(dto.getBoard_num()));	
		    	   return "boardPasswd";
	    	   }
	    		   m.addAttribute("retrieve", dto);
		    	   m.addAttribute("list",cService.selectComment(dto.getBoard_num()));
	               return "boardRetrieve";
	           }	  
	  
		@RequestMapping("/boardSecret")
	    public String boardSecret(@RequestParam int board_num, Model m,
	    		HttpSession session){
			FreeBoardDTO dto = service.selectByNum(board_num);
	        	m.addAttribute("board_num",board_num); 
	        	m.addAttribute("retrieve", dto);
		        m.addAttribute("list",cService.selectComment(dto.getBoard_num()));
	            return "boardRetrieve";
		 }
    
	 @RequestMapping("/boardDelete")
	 public String delete(@RequestParam int board_num) { 
	    service.deleteByNum(board_num);
		return "redirect:boardForm";
	}
	
	@RequestMapping("/boardUpdate")
	public ModelAndView update(@RequestParam int board_num, Model m){
		FreeBoardDTO dto=service.selectByNum(board_num);
		String content = dto.getContent().replace("<br>","\r\n");
		dto.setContent(content);
		 ModelAndView mav = new ModelAndView();
		 mav.setViewName("boardUpdate");
		 mav.addObject("dto",dto);
		return mav;
	}
	
	@RequestMapping(value="/boardUpdateWrite", method=RequestMethod.POST)
	public String  updateWrite(@ModelAttribute("xxx") FreeBoardDTO bdto,
			HashMap<String, String> map){ 
		if(bdto.getImage().getOriginalFilename()==null) {
			String content = bdto.getContent().replace("\r\n","<br>");
			map.put("board_num",String.valueOf(bdto.getBoard_num()));
			map.put("userid", bdto.getUserid());
			map.put("author", bdto.getAuthor());
			map.put("title", bdto.getTitle());
			map.put("content", bdto.getContent());	
		   } else { 
			CommonsMultipartFile theFile = bdto.getImage();
			String originalFilename = theFile.getOriginalFilename();
			File f = new File("c:\\upload" , originalFilename );
			try {
				theFile.transferTo(f);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String content = bdto.getContent().replace("\r\n","<br>");
			map.put("board_num",String.valueOf(bdto.getBoard_num()));
			map.put("userid", bdto.getUserid());
			map.put("author", bdto.getAuthor());
			map.put("title", bdto.getTitle());
			map.put("content", content);
			map.put("imageName", originalFilename);
			map.put("secret", bdto.getSecret());
			map.put("passwd",bdto.getPasswd() );
		}
		service.updateByNum(map);		
		return "redirect:boardForm";
	} 

	@RequestMapping("/commentWrite")
	@ResponseBody
	public void commentWrite(CommentDTO dto, HashMap<String,Integer> map, 
			Model m,HttpSession session) {
		MemberDTO mdto = (MemberDTO)session.getAttribute("login");
		dto.setUserid(mdto.getUserid());
		String cocontent = dto.getCocontent().replace("\r\n","<br>");
		int board_num = dto.getBoard_num();
		dto.setCocontent(cocontent);
		dto.setBoard_num(board_num);
		dto.setUserid(dto.getUserid());
		cService.insertComment(dto);
		m.addAttribute("dto",dto);
		m.addAttribute("board_num",dto.getBoard_num());
		m.addAttribute("retrieve",service.selectByNum(dto.getBoard_num()));
		m.addAttribute("list",cService.selectComment(dto.getBoard_num()));			
	}
	
	@RequestMapping("/commentDelete")
	@ResponseBody
	public void commentDelete(CommentDTO dto,@RequestParam int co_num) {		
		cService.deleteByComment(co_num);	
	}
	

	
}
