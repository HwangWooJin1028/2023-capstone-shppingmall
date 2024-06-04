package com.shoppingmall.belleaf.order.controller;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shoppingmall.belleaf.inven.vo.InvenVO;
import com.shoppingmall.belleaf.order.service.OrderService;
import com.shoppingmall.belleaf.order.vo.UserOrderDetailVO;
import com.shoppingmall.belleaf.order.vo.UserOrderVO;
import com.shoppingmall.belleaf.pay.vo.PaymentVO;
import com.shoppingmall.belleaf.user.UserVO;
import com.shoppingmall.belleaf.user.vo.UserOrderPointVO;

@Controller
@RequestMapping("/order/**")
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	public OrderController() {
		System.out.println("OrderController 생성");
	}
	
	private String OrderIdCreate() {
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ymd = year+new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		ymd += new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		String sub = "";
		for(int i=0; i<=6; i++) {
			sub += (int)(Math.random()*10);
		}
		String order_id = ymd+"-"+sub;
		return order_id;
	}
	
	// 내정보 가져오기를 하면, /order/user에 get방식으로 session에 저장된 user 정보를 가져오도록 한다.
	@RequestMapping(value="/user", method = RequestMethod.GET)
	@ResponseBody
	public UserVO getSessionUser(HttpSession session) {
		return (UserVO)session.getAttribute("user");
	}
	
	// 주문 정보(배송지, 전화번호 등) 입력 view 출력
	@GetMapping("/")
	public String viewOrder() {
		return "user/orderView";
	}

	// 바로구매 - 주문 정보(배송지, 전화번호 등) 입력 view 출력
	@GetMapping("/direct")
	public String viewOrderDirect() {
		return "user/orderViewDirect";
	}
	
	// 배송 정보, 전화번호, 이름 등을 입력하고 나서 /order를 post 방식으로 부른다.
	@PostMapping("/shopping")
	public String order(HttpSession session, Model model, UserOrderVO order, UserOrderDetailVO orderDetail, PaymentVO payment) {
		// session에서 user 정보 가져오기
		UserVO user = (UserVO)session.getAttribute("user");
		String user_id = user.getUser_id();
		
		// session에 저장된 장바구니 리스트 가져오기
		session.getAttribute("cartMap");
		
		// order id를 함수를 통해 생성한다. - random함수를 이용
		String order_id = OrderIdCreate();
		
		// order_id와 user_id를 order에 생성
		order.setOrder_id(order_id);
		order.setUser_id(user_id);

		// 주문 정보를 입력한다.
		orderService.insertOrder(order);
		
		// 결제창에서 쓰일 최근 주문 정보 가져오기
		Map<String, String> map = new HashMap<String, String>();
		map.put("user_id", user_id);
		map.put("order_id", order_id);
		
		UserOrderVO orderInfo = orderService.selectUserOrder(user_id, order_id);
		session.setAttribute("orderInfo", orderInfo);
		
		// 결제 테이블에 정보 삽입 및 session에 데이터 저장
		payment.setOrder_id(order_id);
		orderService.insertPayment(payment);
		session.setAttribute("payment", payment);
		
		return "store/shopping";
	}
	
	
	// 배송 정보, 전화번호, 이름 등을 입력하고 나서 /direct를 post 방식으로 부른다.
	@PostMapping("/shoppingdirect")
	public String viewOrderDirect(HttpSession session, Model model, UserOrderVO order, UserOrderDetailVO orderDetail, PaymentVO payment) {
		
		// session에서 user 정보 가져오기
		UserVO user = (UserVO)session.getAttribute("user");
		String user_id = user.getUser_id();
		
		// session에 저장된 장바구니 리스트 가져오기
		session.getAttribute("productDirectMap");
		
		// order id를 함수를 통해 생성한다. - random함수를 이용
		String order_id = OrderIdCreate();
		
		// order_id와 user_id를 order에 생성
		order.setOrder_id(order_id);
		order.setUser_id(user_id);

		// 주문 정보를 입력한다.
		orderService.insertOrder(order);
		
		// 결제창에서 쓰일 최근 주문 정보 가져오기
		Map<String, String> map = new HashMap<String, String>();
		map.put("user_id", user_id);
		map.put("order_id", order_id);
		
		UserOrderVO orderInfo = orderService.selectUserOrder(user_id, order_id);
		session.setAttribute("orderInfo", orderInfo);
		
		// 결제 테이블에 정보 삽입 및 session에 데이터 저장
		payment.setOrder_id(order_id);
		orderService.insertPayment(payment);
		session.setAttribute("payment", payment);
		
		return "store/shoppingDirect";
	}

	// 장바구니 -> 결제 성공후, /order/pay url로 온다
	@RequestMapping("/pay")
	public String pay(Model model, HttpSession session, UserOrderVO order, UserOrderDetailVO orderDetail, 
			PaymentVO payment, UserOrderPointVO userPoint, InvenVO inven) {
		
		
		// 주문 정보 저장에 필요한 내용들을 session으로부터 가져온다.
		UserVO user = (UserVO)session.getAttribute("user");
		String user_id = user.getUser_id();
		
		UserOrderVO orderInfo = (UserOrderVO)session.getAttribute("orderInfo");
		String order_id = orderInfo.getOrder_id();
		
		// 상세 주문 정보 저장
		orderDetail.setOrder_id(order_id);
		orderDetail.setUser_id(user_id);
		orderService.insertOrderDetail(orderDetail);
		System.out.println(orderDetail);
		// 상품 재고량 감소
		List<UserOrderDetailVO> qtyId = orderService.getIdQty(order_id);
		System.out.println("************************qtyId : "+qtyId);
		session.setAttribute("qtyId", qtyId);
		
		// 주문한 상품들의 재고 정리
		for(int i=0; i<qtyId.size(); i++) {
			int product_id = qtyId.get(i).getProduct_id();
			int user_order_cnt = qtyId.get(i).getUser_order_cnt();
			inven.setProduct_id(product_id);
			inven.setInven_stock(user_order_cnt);
			orderService.deleteInven(inven);
		}
		
		// 포인트 정립
		userPoint.setOrder_id(order_id);
		userPoint.setUser_id(user_id);
		orderService.updatePoint(userPoint);
		
		// 장바구니 정보 삭제
		orderService.deleteAllCart(user_id);
		System.out.println("order: " + order);
		
		return "store/afterPay";
	}
	
	// 바로구매 -> 결제 성공후, /order/paydirect url로 온다.
	@RequestMapping("/paydirect")
	public String paydirect(@RequestParam int product_id, @RequestParam int inven_stock, 
			Model model, HttpSession session, UserOrderVO order, UserOrderDetailVO orderDetail, 
			PaymentVO payment, UserOrderPointVO userPoint, InvenVO inven) {
		
		UserVO user = (UserVO)session.getAttribute("user");
		UserOrderVO orderInfo = (UserOrderVO)session.getAttribute("orderInfo");
		
		String user_id = user.getUser_id();
		String order_id = orderInfo.getOrder_id();
		
		// 주문 상세정보 입력
		orderDetail.setUser_order_cnt(inven_stock);
		orderDetail.setProduct_id(product_id);
		orderDetail.setUser_id(user_id);
		orderDetail.setOrder_id(order_id);
		orderService.insertOrderDetailDirect(orderDetail);
		
		// 재고정리
		inven.setProduct_id(product_id);
		inven.setInven_stock(inven_stock);
		orderService.deleteInven(inven);
		
		// 포인트 정립
		userPoint.setOrder_id(order_id);
		userPoint.setUser_id(user_id);
		orderService.updatePoint(userPoint);
		
		return "store/afterPay";
	}
}
