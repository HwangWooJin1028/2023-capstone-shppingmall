package com.shoppingmall.belleaf.cart.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoppingmall.belleaf.cart.dao.CartDAO;
import com.shoppingmall.belleaf.cart.service.CartService;
import com.shoppingmall.belleaf.cart.vo.CartVO;
import com.shoppingmall.belleaf.product.vo.ProductVO;

@Service("cartService")
public class CartServiceImpl implements CartService{
	
	@Autowired
	private CartDAO cartDAO;
	
	@Override
	public void insertCart(CartVO cart) {
		cartDAO.insertCart(cart);
	}

	@Override
	public List<CartVO> selectCartlist(String user_id) {
		return cartDAO.selectCartlist(user_id);
	}

	@Override
	public int sumMoney(String user_id) {
		return cartDAO.sumMoney(user_id);
	}

	@Override
	public void modifyCart(CartVO cart) {
		cartDAO.modifyCart(cart);
	}

	@Override
	public void deleteCart(int cart_id) {
		cartDAO.deleteCart(cart_id);
	}

	@Override
	public int countCart(String user_id, int product_id) {
		return cartDAO.countCart(user_id, product_id);
	}

	@Override
	public void updateCart(CartVO cart) {
		cartDAO.updateCart(cart);
	}

	@Override
	public int countProduct(String user_id) {
		return cartDAO.countProduct(user_id);
	}

	@Override
	public ProductVO orderDirect(int product_id) {
		return cartDAO.orderDirect(product_id);
	}

	@Override
	public List<CartVO> getImg(String user_id) {
		return cartDAO.getImg(user_id);
	}

}
