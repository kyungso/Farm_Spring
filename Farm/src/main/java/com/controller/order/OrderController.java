package com.controller.order;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dto.CartDTO;
import com.dto.GoodsDTO;
import com.dto.MemberDTO;
import com.dto.OrderDTO;
import com.dto.OrderPageDTO;
import com.service.CartService;
import com.service.GoodsService;
import com.service.MemberService;
import com.service.OrderService;

@Controller
//@RequestMapping("/loginX")
public class OrderController {

	@Autowired
	OrderService oService;
	
	@Autowired
	CartService cService;
	@Autowired
	MemberService mService;
	@Autowired
	GoodsService gService;
	
	
	@RequestMapping("/orderList")
	public ModelAndView orderList(@RequestParam(required=false) HashMap<String,String> map, 
							      HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		String curPage = map.get("curPage");
		if(curPage==null) {
			curPage="1";
		}
		
		String searchValue = map.get("searchValue");
		String start_date = map.get("start_date");
		String end_date = map.get("end_date");
		if(start_date==null && end_date==null) {
			OrderPageDTO oDTO = new OrderPageDTO();
			start_date = oDTO.getStart_date();
			end_date = oDTO.getEnd_date();
		}
		
		MemberDTO mDTO = (MemberDTO)session.getAttribute("login");
		if(mDTO == null) {
			mav.setViewName("redirect:/loginForm");
		}else {
			String userid = mDTO.getUserid();
			map.put("searchValue", searchValue);
			map.put("userid", userid);
			map.put("start_date", start_date);
			map.put("end_date", end_date);
			
			OrderPageDTO list = oService.page(Integer.parseInt(curPage), map);
			
			mav.addObject("orderpageList",list);
			mav.setViewName("orderList");
		}
		return mav;
	}
	
	@RequestMapping("/orderConfirm") //장바구니
	public ModelAndView orderConfirm(@RequestParam Map<String,String> map, HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		String cart_num = map.get("cart_num");
		String userid = map.get("userid");
		
		CartDTO cDTO = oService.orderConfirm(Integer.parseInt(cart_num));
		//MemberDTO mDTO = mService.mypage(userid);
		mav.addObject("cDTO",cDTO);
		//mav.addObject("mDTO",mDTO);
		
		mav.setViewName("orderConfirm");
		return mav;
	}
	
	@RequestMapping("/orderConfirm_d") //상품에서 바로 구매
	public ModelAndView orderConfirm_d(@RequestParam Map<String,String> map, HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		MemberDTO mDTO = (MemberDTO)session.getAttribute("login");
		String id = mDTO.getUserid();
		String gCode = map.get("gCode");
		String gAmount = map.get("gAmount");
	
		GoodsDTO gDTO = gService.goodsRetrieve(gCode);
		//MemberDTO memDTO = mService.mypage(id);
		mav.addObject("gAmount",gAmount);
		mav.addObject("gDTO",gDTO);
		//mav.addObject("memDTO",memDTO);
		
		mav.setViewName("orderConfirm");
		return mav;
	}
	
	
	@RequestMapping("/orderAllConfirm")
	public ModelAndView orderAllConfirm(@RequestParam String userid, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		String[] checks = request.getParameterValues("check");
		for (String s : checks) {
			System.out.println(s);
		}
		//System.out.println(userid);
		List<CartDTO> cDTO = oService.orderAllConfirm(Arrays.asList(checks));
		//MemberDTO mDTO = mService.mypage(userid);
		mav.addObject("cDTO",cDTO);
		//mav.addObject("mDTO",mDTO);
		mav.setViewName("orderAllConfirm");
		return mav;
	}
	
	@RequestMapping("/orderDone") //장바구니에서 구매
	public ModelAndView orderDone(@RequestParam String cart_num, @ModelAttribute("oDTO") OrderDTO dto) {
		ModelAndView mav = new ModelAndView();
		
		oService.orderDone(dto, cart_num);
		
		mav.setViewName("orderDone");
		return mav;
	}
	
	@RequestMapping("/orderDone_d") //goodsRetrieve에서 바로 구매 cDTO==null
	public ModelAndView orderDone_d(@ModelAttribute("oDTO_d") OrderDTO dto_d) {
		ModelAndView mav = new ModelAndView();
		
		oService.orderDone_d(dto_d);
		
		mav.setViewName("orderDone");
		return mav;
	}
	
	@RequestMapping(value="/orderAllDone") //장바구니에서 전체주문하기
	public ModelAndView orderAllDone(
			@RequestParam String[] cart_num,
			@RequestParam String[] userid,

			@RequestParam String[] gCode,
			@RequestParam String[] gName,
			@RequestParam String[] gPrice,
			@RequestParam String[] gAmount,
			@RequestParam String[] gImage1,

			@RequestParam String orderName,
			@RequestParam String post1,
			@RequestParam String post2,
			@RequestParam String addr1,
			@RequestParam String addr2,
			@RequestParam String phone,
			@RequestParam String payMethod) {
		ModelAndView mav = new ModelAndView();
		
		List<OrderDTO> oDTOlist = new ArrayList<OrderDTO>();
		for (int i = 0; i < cart_num.length; i++) {
			OrderDTO dto = new OrderDTO();
			dto.setUserid(userid[i]);
			dto.setgCode(gCode[i]);
			dto.setgName(gName[i]);
			dto.setgPrice(Integer.parseInt(gPrice[i]));
			dto.setgAmount(Integer.parseInt(gAmount[i]));
			dto.setgImage1(gImage1[i]);
			dto.setOrderName(orderName);
			dto.setPost1(post1);
			dto.setPost2(post2);
			dto.setAddr1(addr1);
			dto.setAddr2(addr2);
			dto.setPhone(phone);
			dto.setPayMethod(payMethod);
			oDTOlist.add(dto);
		}
		
		for (OrderDTO orderDTO : oDTOlist) {
			System.out.println(orderDTO);
		}
		
		oService.orderAllDone(oDTOlist, Arrays.asList(cart_num));
		mav.addObject("oDTOlist",oDTOlist);
		mav.setViewName("orderAllDone");
		return mav;
	}
	
	
	@RequestMapping(value="/orderListDetail") //장바구니에서 전체주문하기
	public ModelAndView orderAllDone(@RequestParam String order_num, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		MemberDTO mDTO = (MemberDTO)session.getAttribute("login");
		
		if(mDTO==null) {
			mav.setViewName("redirect:/loginForm");
		}else {
			OrderDTO oDTO = oService.orderListDetail(Integer.parseInt(order_num));
			mav.addObject("oDTO",oDTO);
			mav.setViewName("orderListDetail");
		}
		return mav;
	}
	
	@RequestMapping("modal")
	public ModelAndView modal(@RequestParam Map<String,String> map) {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("order/modal");
		return mav;
	}

	@RequestMapping("orderDel")
	public String orderDel(HttpServletRequest request) {
		String[] checks = request.getParameterValues("check");
		
		oService.orderDel(Arrays.asList(checks));
		return "redirect:orderList";
	}
	
}
