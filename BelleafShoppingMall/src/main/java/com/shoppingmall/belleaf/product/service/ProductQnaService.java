package com.shoppingmall.belleaf.product.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.shoppingmall.belleaf.product.vo.ProductQnaNickVO;
import com.shoppingmall.belleaf.product.vo.ProductQnaVO;

public interface ProductQnaService {
    // QNA_ID로 하나의 상품문의 조회(users의 user_nickname 포함) -->
	public ProductQnaNickVO adminPrdQnaNickSelectID(ProductQnaNickVO vo);
	
	// <!-- 관리자 페이지 - QNA_ID로 하나의 상품문의 조회 -->
	public ProductQnaNickVO adminPrdQnaSelectID(ProductQnaNickVO vo);
	
	// <!-- 관리자 페이지 - 하나의 상품문의 조회 -->
	public List<ProductQnaNickVO> adminPrdQnaSelectSet(ProductQnaNickVO vo);
	
	// <!-- 관리자 페이지 - 답변 수정 -->
	public void adminAnsUpdate(ProductQnaNickVO vo);
	
	// <!-- 관리자 페이지 - 답변 삭제 -->
	public void adminAnsDel(ProductQnaNickVO vo);
	
	// 문의 삭제
	public void adminQnaDel(ProductQnaNickVO vo);
	
	// <!-- 관리자페이지 - 답변 등록 -->
	public void adminAnsInsert(String qna_content, String product_id, String user_id, String qna_group);
	
	// <!-- 관리자 페이지 - 답변 상태 변경 -->
	public void adminAnsStateUpdate(String product_qna_state, String qna_id);
	
	// <!-- 관리자페이지 - 전체 상품문의 조회를 위한 전체 row 수 -->
	public int adminPrdQnaListCnt(String searchKeyword, String searchCondition, String prd_category, String prd_state);
	
	// <!-- 관리자페이지 - 전체 상품 문의 조회 -->
	public List<Map<String, Object>> adminPrdQnaList(String searchKeyword, String searchCondition, String prd_category, String prd_state, String start, String end);
	
	
	// 상품 상세 페이지 - 상품 qna 리스트 전체 출력
	public List<ProductQnaNickVO> qnaListByProductID(int product_id, int start, int end);
	
	// 상품 상세 페이지 - 상품 qna 리스트 총 개수
	public int QnaListCntByProductID (int product_id);
	// mypage - 상품문의 등록
	public void insertMyQna(ProductQnaVO vo);
	
	// mypage - 상품문의 개수
	public int myPrdQnaListCnt(String user_id);
	// mypage - 상품문의 목록
	public List<Map<String, Object>> myPrdQnaList(String user_id, String start, String end);
}
