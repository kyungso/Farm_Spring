package com.controller.cart;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dto.CartDTO;
import com.dto.MemberDTO;
import com.service.CartService;

@Controller
//@RequestMapping("/loginX")
public class CartController {

	@Autowired
	CartService service;
	
	@RequestMapping("/cartAdd")
	public String cartAdd(@ModelAttribute("cartDTO")CartDTO dto, Model m, HttpSession session) {
		MemberDTO mem = (MemberDTO)session.getAttribute("login");
		dto.setUserid(mem.getUserid());
		service.addCart(dto);
		//m.addAttribute("cart","장바구니에"+dto.getgName()+" 상품이 잘 담겼습니다.");
		String gCode = dto.getgCode();
		return "redirect:goodsRetrieve?gCode="+gCode;
	}
	
	@RequestMapping("/cartList")
	public ModelAndView cartList(HttpSession session) {
		MemberDTO mem = (MemberDTO)session.getAttribute("login");
		List<CartDTO> list = service.cartList(mem.getUserid());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("cartList");
		mav.addObject("cartList",list);
		return mav;
	}
	
	@RequestMapping("/cartAmountUpdate")
	@ResponseBody
	public void amountUpdate(@RequestParam Map<String, Integer> map) {
		service.amountUpdate(map);
	}
	
	@RequestMapping("/delCart")
	@ResponseBody
	public void delCart(@RequestParam String cart_num) {
		service.delCart(Integer.parseInt(cart_num));
	}
	
	@RequestMapping("/delAllCart")
	@ResponseBody
	public void delAllCart(HttpServletRequest request) {
		String[] checks = request.getParameterValues("check");
		for (String s : checks) {
			System.out.println(s);
		}
		service.delAllCart(Arrays.asList(checks));
	}
	

}
