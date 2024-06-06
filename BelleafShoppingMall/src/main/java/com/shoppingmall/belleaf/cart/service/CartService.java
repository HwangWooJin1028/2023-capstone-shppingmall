package com.shoppingmall.belleaf.cart.service;

import java.util.List;

import com.shoppingmall.belleaf.cart.vo.CartVO;
import com.shoppingmall.belleaf.product.vo.ProductVO;

public interface CartService {
	
	public void insertCart(CartVO cart);
	
	public List<CartVO> selectCartlist(String user_id);
	
	public int sumMoney(String user_id);
	
	public void modifyCart(CartVO cart);
	
	public void deleteCart(int cart_id);
	
	public int countCart(String user_id, int product_id);
	
	public void updateCart(CartVO cart);
	
	public int countProduct(String user_id);
	
	public ProductVO orderDirect(int product_id);
	
	public List<CartVO> getImg(String user_id);
}
