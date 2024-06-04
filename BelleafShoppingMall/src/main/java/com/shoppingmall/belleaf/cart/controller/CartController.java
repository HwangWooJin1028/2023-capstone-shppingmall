package com.shoppingmall.belleaf.cart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shoppingmall.belleaf.cart.service.CartService;
import com.shoppingmall.belleaf.cart.vo.CartDetailProductVO;
import com.shoppingmall.belleaf.cart.vo.CartVO;
import com.shoppingmall.belleaf.product.vo.ProductVO;

@Controller
@RequestMapping("/cart/**")
public class CartController {
	@Autowired
	private CartService cartService;
	
	public CartController() {
		// TODO Auto-generated constructor stub
	}
	// 장바구니 페이지에 접속
	@GetMapping("/list")
	public String cartList(CartVO cart, CartDetailProductVO cdo, Model model, HttpSession session) {
		
		String user_id = (String)session.getAttribute("user_id");
		if(user_id == null || user_id == "") {
			return "redirect:/";
		}
		List<CartVO> list = cartService.selectCartlist(user_id);
		
		// 할인율이 적용된 cart 전체 금액
		int sumMoney = cartService.sumMoney(user_id);
		// 배송비 (10만원 이상 주문시 무료 배송)
		int deliFee = sumMoney >= 100000 ? 0:2500;
		int allSum = sumMoney + deliFee;
		
		// map에 데이터를 넣기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", list.size());
		map.put("sumMoney", sumMoney);
		map.put("fee", deliFee);
		map.put("allSum", allSum);
		
		// model 및 session에 데이터 넣기
		model.addAttribute("map", map);
		model.addAttribute("list", list);
		session.setAttribute("cartMap", map);
		
		System.out.println(list);
		
		int count = cartService.countProduct(user_id);
		session.setAttribute("count", count);
		return "user/cart";
	}
	
	// 장바구니에 상품 추가
	@RequestMapping("insert")
	public String insertCart(@ModelAttribute CartVO cart, HttpSession session) {
		String user_id = (String)session.getAttribute("user_id");
		cart.setUser_id(user_id);
		System.out.println(user_id+ cart.getProduct_id());
		int count = cartService.countCart(user_id, cart.getProduct_id());
		System.out.println(count + "product_qty: " + cart.getCart_product_qty());
		cartService.insertCart(cart);
		
		return "redirect:/cart/list";
	}
	
	// 장바구니에서 상품 삭제
	@RequestMapping("delete")
	public String deleteCartProduct(@RequestParam int cart_id) {
		cartService.deleteCart(cart_id);
		return "redirect:/cart/list";
	}
	
	// 장바구니에서 상품 수량 업데이트
	@RequestMapping("update")
	public String updateCartProduct(@RequestParam int[] cart_product_qty, @RequestParam int[] product_id, HttpSession session) {
		
		String user_id = (String)session.getAttribute("user_id");
		for(int i=0; i<product_id.length; i++) {
			CartVO cart = new CartVO();
			cart.setUser_id(user_id);
			cart.setCart_product_qty(cart_product_qty[i]);
			cart.setProduct_id(product_id[i]);
			cartService.modifyCart(cart);
		}
		
		return "redirect:/cart/list";
	}
	
	@RequestMapping("/order")
	public String orderDirect(@RequestParam int product_id, @RequestParam int cart_product_qty,
			HttpServletRequest request, HttpSession session, Model model) {
		ProductVO product = cartService.orderDirect(product_id);
		Map<String, Object> map = new HashMap<String, Object>();
		
		int sumMoney = (int)( product.getProduct_price() * (1-product.getProduct_discount()) * cart_product_qty );
		int fee = sumMoney>=100000? 0:2500;
		int allSum = sumMoney + fee;
		
		map.put("product", product);
		map.put("sumMoney", sumMoney);
		map.put("fee", fee);
		map.put("allSum", allSum);
		map.put("cnt", cart_product_qty);
		System.out.println("produtDirectMap: " + map);
		model.addAttribute("productDirectMap", map);
		model.addAttribute("product", product);
		
		session.setAttribute("productDirectMap", map);
		
		return "user/orderDirect";
	}
	
}
