package com.shoppingmall.belleaf.product.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.shoppingmall.belleaf.product.vo.ProductVO;

public interface ProductService {
// 검색하여 상품을 가져온다.
	public List<ProductVO> searchProductListByName(ProductVO product);
	
	public void insertProduct(ProductVO productVO);
	
	public void updateProduct(ProductVO productVO);
	
	public ProductVO getProduct(ProductVO productVO);
	
	// homepage에서 category에 따른 product 출력
	public List<ProductVO> getProductListByCategory(int categoryCode);
	
	// admin 전체 productList 출력
	public List<ProductVO> getProductList();
	
	public int getAdminProductListCnt(String searchCondition, String searchKeyword, String prd_category,String prd_state);
	
	// admin 검색 결과에 따른 productList 출력
	public List<Map<String, Object>> adminGetProductList(String searchCondition, String searchKeyword, String product_category,
			String product_state, String start, String end);
	public List<Map<String, Object>> ResentGetProductList(String start, String end);
	public List<Map<String, Object>> getproductListByDiscount(String start, String end);
}
