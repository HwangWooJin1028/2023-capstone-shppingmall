package com.shoppingmall.belleaf.product.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shoppingmall.belleaf.product.vo.ProductQnaNickVO;
import com.shoppingmall.belleaf.product.vo.ProductQnaVO;

@Repository
public class ProductQnaDAO {
	@Autowired
	SqlSessionTemplate mybatis;
	
	// QNA_ID로 하나의 상품문의 조회(users의 user_nickname 포함) -->
	public ProductQnaNickVO adminPrdQnaNickSelectID(ProductQnaNickVO vo) {
		return mybatis.selectOne("productQnaDAO.adminPrdQnaNickSelectID", vo);
	}
	
	// <!-- 관리자 페이지 - QNA_ID로 하나의 상품문의 조회 -->
	public ProductQnaNickVO adminPrdQnaSelectID(ProductQnaNickVO vo) {
		return mybatis.selectOne("productQnaDAO.adminPrdQnaSelectID", vo);
	}
	
	// <!-- 관리자 페이지 - 하나의 상품문의 조회 -->
	public List<ProductQnaNickVO> adminPrdQnaSelectSet(ProductQnaNickVO vo) {
		return mybatis.selectList("productQnaDAO.adminPrdQnaSelect", vo);
	}
	
	// <!-- 관리자 페이지 - 답변 수정 -->
	public void adminAnsUpdate(ProductQnaNickVO vo) {
		mybatis.update("productQnaDAO.adminAnsUpdate", vo);
	}
	
	// <!-- 관리자 페이지 - 답변 삭제 -->
	public void adminAnsDel(ProductQnaNickVO vo) {
		mybatis.delete("productQnaDAO.adminAnsDel", vo);
	}
	
	public void adminQnaDel(ProductQnaNickVO vo) {
		mybatis.delete("productQnaDAO.adminQnaDel", vo);
	}
	
	// <!-- 관리자페이지 - 답변 등록 -->
	public void adminAnsInsert(String qna_content, String product_id, String user_id, String qna_group) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("qna_content", qna_content);
		map.put("product_id", product_id);
		map.put("user_id", user_id);
		map.put("qna_group", qna_group);
		mybatis.insert("productQnaDAO.adminAnsInsert", map);
	}
	
	// <!-- 관리자 페이지 - 답변 상태 변경 -->
	public void adminAnsStateUpdate(String product_qna_state, String qna_id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("product_qna_state", product_qna_state);
		map.put("qna_id", qna_id);
		mybatis.update("productQnaDAO.adminAnsStateUpdate", map);
	}
	
	// <!-- 관리자페이지 - 전체 상품문의 조회를 위한 전체 row 수 -->
	public int adminPrdQnaListCnt(String searchKeyword, String searchCondition, String prd_category, String prd_state) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchKeyword", searchKeyword);
		map.put("searchCondition", searchCondition);
		map.put("prd_category", prd_category);
		map.put("prd_state", prd_state);
		return mybatis.selectOne("productQnaDAO.adminPrdQnaListCnt", map);
	}
	
	// <!-- 관리자페이지 - 전체 상품 문의 조회 -->
	public List<Map<String, Object>> adminPrdQnaList(String searchKeyword, String searchCondition, String prd_category, String prd_state, String start, String end) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchKeyword", searchKeyword);
		map.put("searchCondition", searchCondition);
		map.put("prd_category", prd_category);
		map.put("prd_state", prd_state);
		map.put("start", start);
		map.put("end", end);
		return mybatis.selectList("productQnaDAO.adminPrdQnaList", map);
	}
	
	// 상품 상세 페이지 - 상품 qna 리스트 전체 출력
	public List<ProductQnaNickVO> qnaListByProductID(int product_id, int start, int end) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("product_id", product_id);
		map.put("start", start);
		map.put("end", end);
		return mybatis.selectList("productQnaDAO.QnaListByProductID", map);
	}
	
	// 상품 상세 페이지 - 상품 qna 리스트 총 개수
	public int QnaListCntByProductID (int product_id) {		
		return mybatis.selectOne("productQnaDAO.QnaListCntByProductID", product_id);
	}
	
	// mypage - 상품문의 등록
	public void insertMyQna(ProductQnaVO vo) {
		mybatis.insert("productQnaDAO.insertMyQna", vo);
	}
	
	// mypage - 상품문의 개수
	public int myPrdQnaListCnt(String user_id) {
		return mybatis.selectOne("productQnaDAO.myPrdQnaListCnt", user_id);
	}
	// mypage - 상품문의 목록
	public List<Map<String, Object>> myPrdQnaList(String user_id, String start, String end) {
		Map<String ,String> map = new HashMap<String, String>();
		map.put("user_id", user_id);
		map.put("start", start);
		map.put("end", end);
		return mybatis.selectList("productQnaDAO.myPrdQnaList", map);
	}
}
