package com.shoppingmall.belleaf.product.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shoppingmall.belleaf.product.vo.ProductVO;
@Repository
public class ProductDAO {
	@Autowired
	SqlSessionTemplate mybatis;
	
	// 검색하여 상품을 가져온다.
	public List<ProductVO> searchProductListByName(ProductVO product) {
		return mybatis.selectList("productDAO.searchProductListByName", product);
	}
	
	// 상품을 등록한다.
	public void insertProduct(ProductVO productVO) {
		mybatis.insert("productDAO.insertProduct", productVO);
	}
	
	// admin에서 상품을 수정한다.
	public void updateProduct(ProductVO productVO) {
		mybatis.update("productDAO.updateProduct", productVO);
	}
	
	// Product를 자세하게 가져온다.
	public ProductVO getProduct(ProductVO productVO) {
		return mybatis.selectOne("productDAO.getProduct", productVO);
	}
	
	// homepage에서 category에 따른 product 출력
	public List<ProductVO> getProductListByCategory(int categoryCode) {
		return mybatis.selectList("productDAO.getProductListByCategory", categoryCode);
	}
	
	// admin 전체 productList 출력 --> 조건 없이 모든 리스트를 가져온다.
	public List<ProductVO> getProductList() {
		return mybatis.selectList("productDAO.getProductListAll");
	}
	
	// admin 상품 목록 게시판 글 목록 수 - 페이징 전용, 검색 결과에 따라 게시물을 가져온다.
	public int getAdminProductListCnt(String searchCondition, String searchKeyword, String prd_category,
			String prd_state) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchCondition", searchCondition);
		map.put("searchKeyword", searchKeyword);
		map.put("prd_category", prd_category);
		map.put("prd_state", prd_state);
		return mybatis.selectOne("productDAO.adminProductListCnt", map);
	}
	
	// admin 검색 결과에 따른 productList 출력 --> 검색 결과, row number의 범위를 정해준다.
	public List<Map<String, Object>> getProductList(String searchCondition, String searchKeyword, String product_category,
			String product_state, String start, String end) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchCondition", searchCondition);
		map.put("searchKeyword", searchKeyword);
		map.put("prd_state", product_state);
		map.put("prd_category", product_category);
		map.put("start", start);
		map.put("end", end);
		
		return mybatis.selectList("productDAO.SearchGetProductList", map);
	}

	public List<Map<String, Object>> ResentGetProductList(String start, String end) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("start", start);
		map.put("end", end);
		return mybatis.selectList("productDAO.ResentGetProductList",map);
	}
	
	public List<Map<String, Object>> getproductListByDiscount(String start, String end) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("start", start);
		map.put("end", end);
		return mybatis.selectList("productDAO.getproductListByDiscount",map);
	}
}