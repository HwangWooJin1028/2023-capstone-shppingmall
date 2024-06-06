package com.shoppingmall.belleaf.center.serviceimpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoppingmall.belleaf.center.dao.CenterQnaDAO;
import com.shoppingmall.belleaf.center.service.CenterQnaService;
import com.shoppingmall.belleaf.center.vo.CenterQnaVO;


@Service("centerQnaService")
public class CenterQnaServiceImpl implements CenterQnaService {
 
	@Autowired
	private CenterQnaDAO centerQnaDAO;
	

	public CenterQnaServiceImpl() {
			System.out.println(">>CenterQnaServiceImpl");
		}


	@Override
	public int getCenterListCnt(String searchCondition, String searchKeyword) {
	
		return centerQnaDAO.getCenterListCnt(searchCondition, searchKeyword);
	}


	@Override
	public List<Map<String, Object>> getCenterqnaList(String searchCondition, String searchKeyword, String start,
			String end) {
		
		return centerQnaDAO.getCenterQnaList(searchCondition,searchKeyword, start,end);
	}


	@Override
	public void insertCenter(CenterQnaVO vo) {
		
		centerQnaDAO.insertCenter(vo);
	}


	@Override
	public void deleteCenterQna(CenterQnaVO vo) {
		centerQnaDAO.deleteCenterQna(vo);
		
	}

	@Override
	public void updateCenter(CenterQnaVO vo) {
	
		centerQnaDAO.updateCenterQna(vo);
	}
	@Override
	public List<Map<String, Object>> myCenterQna(CenterQnaVO vo) {
		return centerQnaDAO.myCenterQna(vo);
	}


	@Override
	public Map<String, Object> mycenter(CenterQnaVO vo) {
		return centerQnaDAO.mycenter(vo);
	}


	@Override
	public CenterQnaVO selectCenterQna(CenterQnaVO vo) {
		return centerQnaDAO.selectCenterQna(vo);
	}


	@Override
	public Map<String, Object> getCenterQna(CenterQnaVO vo) {
		System.out.println(" centerQnaService +  getCenterqna" + vo);
		return centerQnaDAO.getCenterqna(vo);
	}
	

}
