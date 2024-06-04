package com.shoppingmall.belleaf.product.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoppingmall.belleaf.product.dao.ProductQnaDAO;
import com.shoppingmall.belleaf.product.service.ProductQnaService;
import com.shoppingmall.belleaf.product.vo.ProductQnaNickVO;
import com.shoppingmall.belleaf.product.vo.ProductQnaVO;


@Service("productQnaService")
public class ProductQnaServiceImpl implements ProductQnaService{
	@Autowired
	ProductQnaDAO productQnaDAO;

	@Override
	public ProductQnaNickVO adminPrdQnaNickSelectID(ProductQnaNickVO vo) {
		return productQnaDAO.adminPrdQnaNickSelectID(vo);
	}

	@Override
	public ProductQnaNickVO adminPrdQnaSelectID(ProductQnaNickVO vo) {
		return productQnaDAO.adminPrdQnaSelectID(vo);
	}

	@Override
	public List<ProductQnaNickVO> adminPrdQnaSelectSet(ProductQnaNickVO vo) {
		return productQnaDAO.adminPrdQnaSelectSet(vo);
	}

	@Override
	public void adminAnsUpdate(ProductQnaNickVO vo) {
		productQnaDAO.adminAnsUpdate(vo);
		
	}

	@Override
	public void adminAnsDel(ProductQnaNickVO vo) {
		productQnaDAO.adminAnsDel(vo);
		
	}

	@Override
	public void adminAnsInsert(String qna_content, String product_id, String user_id, String qna_group) {
		productQnaDAO.adminAnsInsert(qna_content,product_id,user_id,qna_group);
		
	}

	@Override
	public void adminAnsStateUpdate(String product_qna_state, String qna_id) {
		productQnaDAO.adminAnsStateUpdate(product_qna_state,qna_id);
		
	}

	@Override
	public int adminPrdQnaListCnt(String searchKeyword, String searchCondition, String prd_category, String prd_state) {
		// TODO Auto-generated method stub
		return productQnaDAO.adminPrdQnaListCnt(searchKeyword, searchCondition, prd_category, prd_state);
	}

	@Override
	public List<Map<String, Object>> adminPrdQnaList(String searchKeyword, String searchCondition, String prd_category,
			String prd_state, String start, String end) {
		// TODO Auto-generated method stub
		return productQnaDAO.adminPrdQnaList(searchKeyword, searchCondition, prd_category, prd_state, start, end);
	}

	@Override
	public void adminQnaDel(ProductQnaNickVO vo) {
		productQnaDAO.adminQnaDel(vo);
	}

	@Override
	public List<ProductQnaNickVO> qnaListByProductID(int product_id, int start, int end) {
		// TODO Auto-generated method stub
		return productQnaDAO.qnaListByProductID(product_id,start,end);
	}

	@Override
	public int QnaListCntByProductID(int product_id) {
		// TODO Auto-generated method stub
		return productQnaDAO.QnaListCntByProductID(product_id);
	}

	@Override
	public void insertMyQna(ProductQnaVO vo) {
		productQnaDAO.insertMyQna(vo);
		
	}

	@Override
	public int myPrdQnaListCnt(String user_id) {
		return productQnaDAO.myPrdQnaListCnt(user_id);
	}

	@Override
	public List<Map<String, Object>> myPrdQnaList(String user_id, String start, String end) {
		return productQnaDAO.myPrdQnaList(user_id, start, end);
	}
	
}
