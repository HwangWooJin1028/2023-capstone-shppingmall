package com.shoppingmall.belleaf.cart.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shoppingmall.belleaf.cart.vo.CartVO;
import com.shoppingmall.belleaf.product.vo.ProductVO;

@Repository
public class CartDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public CartDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public void insertCart(CartVO cart) {
		mybatis.insert("cartDAO.insertCart", cart);
	}
	
	public List<CartVO> selectCartlist(String user_id) {
		return mybatis.selectList("cartDAO.selectCartlist", user_id);
	}
	
	public int sumMoney(String user_id) {
		return mybatis.selectOne("cartDAO.sumMoney", user_id);
	}
	
	public void modifyCart(CartVO cart) {
		mybatis.update("cartDAO.modifyCart", cart);
	}
	
	public void deleteCart(int cart_id) {
		mybatis.delete("cartDAO.deleteCart", cart_id);
	}
	
	public int countCart(String user_id, int product_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_id", user_id);
		map.put("product_id", product_id);
		return mybatis.selectOne("cartDAO.countCart", map);
	}
	
	public void updateCart(CartVO cart) {
		mybatis.update("cartDAO.updateCart", cart);
	}
	
	public int countProduct(String user_id) {
		return mybatis.selectOne("cartDAO.countProduct", user_id);
	}
	
	public ProductVO orderDirect(int product_id) {
		return mybatis.selectOne("cartDAO.orderDirect", product_id);
	}
	
	public List<CartVO> getImg(String user_id) {
		return mybatis.selectList("cartDAO.getImg", user_id);
	}
}
