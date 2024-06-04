package com.shoppingmall.belleaf.center.serviceimpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoppingmall.belleaf.center.dao.CenterReplyDAO;
import com.shoppingmall.belleaf.center.service.CenterReplyService;
import com.shoppingmall.belleaf.center.vo.CenterReplyVO;



@Service("centerReplyService")
public class CenterReplyServiceImpl  implements CenterReplyService{

	
	@Autowired
	private CenterReplyDAO centerReplyDAO;
	
	public CenterReplyServiceImpl() {
		System.out.println("CenterReplyServiceImpl()객체생성~");
	}
	



	@Override
	public void deleteCenterReply(CenterReplyVO vo) {
		centerReplyDAO.deleteCnterReply(vo);
		
	}




	@Override
	public void insertCenterReply(CenterReplyVO vo) {
		centerReplyDAO.insertCenterReply(vo);
		
	}




	@Override
	public int getReplyListCnt(String searchCondition, String searchKeyword) {
		
		return centerReplyDAO.getCenerListCnt(searchCondition,searchKeyword);
	}




	@Override
	public List<Map<String, Object>> getCenterqnaList(String searchCondition, String searchword, String start,String end) {
		
		return centerReplyDAO.getReplyList(searchCondition,searchword,start,end);
	}




	@Override
	public CenterReplyVO getCenterReply(CenterReplyVO vo) {
		
		return centerReplyDAO.getCenterReply(vo);
	}




	@Override
	public void updateCenterReply(CenterReplyVO vo) {
		centerReplyDAO.updateCenterReply(vo);
		
	}




	
	
	

	
	
}
