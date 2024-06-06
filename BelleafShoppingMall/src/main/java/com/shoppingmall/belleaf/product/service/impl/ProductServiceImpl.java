package com.shoppingmall.belleaf.product.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoppingmall.belleaf.product.dao.ProductDAO;
import com.shoppingmall.belleaf.product.service.ProductService;
import com.shoppingmall.belleaf.product.vo.ProductVO;


@Service("productService")
public class ProductServiceImpl implements ProductService{
	@Autowired
	public ProductDAO productDAO;
	
	public ProductServiceImpl() {
		
	}
	
	// 관리자 페이지 - product 등록하기
	@Override
	public void insertProduct(ProductVO productVO) {
		productDAO.insertProduct(productVO);
	}
	
	// 관리자 페이지 - product 수정하기
	@Override
	public void updateProduct(ProductVO productVO) {
		productDAO.updateProduct(productVO);
	}

	// product 하나 상세 정보 가져오기
	@Override
	public ProductVO getProduct(ProductVO productVO) {
		return productDAO.getProduct(productVO);
	}
	// 사용자 홈페이지 - 카테고리별 product 전체 리스트
	@Override
	public List<ProductVO> getProductListByCategory(int categoryCode) {
		return productDAO.getProductListByCategory(categoryCode);
	}
	
	// 관리자 페이지 - product 전체 리스트s
	@Override
	public List<ProductVO> getProductList() {
		return productDAO.getProductList();
	}

	// 관리자 페이지 - product search 결과
	@Override
	public List<Map<String, Object>> adminGetProductList(String searchCondition, String searchKeyword, String product_category,
			String product_state, String start, String end) {
		return productDAO.getProductList(searchCondition, searchKeyword, product_category, product_state, start, end);
	}

	@Override
	public int getAdminProductListCnt(String searchCondition, String searchKeyword, String prd_category,
			String prd_state) {
		return productDAO.getAdminProductListCnt(searchCondition, searchKeyword, prd_category, prd_state);
	}

	@Override
	public List<Map<String, Object>> ResentGetProductList(String start, String end) {
		return productDAO.ResentGetProductList(start, end);
	}
	
	@Override
	public List<ProductVO> searchProductListByName(ProductVO product) {
		return productDAO.searchProductListByName(product);
	}

	@Override
	public List<Map<String, Object>> getproductListByDiscount(String start, String end) {
		return productDAO.getproductListByDiscount(start, end);
	}

}
