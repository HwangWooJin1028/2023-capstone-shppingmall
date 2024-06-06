package com.shoppingmall.belleaf.paging.vo;

public class PagingVO {
	// 현재 페이지 넘버
	private int nowPageNum;
	//  jsp에 표시할 현재 page 넘버
	private int startPageNum;
	// jsp에 표시할 마지막 page 넘버
	private int endPageNum;
	// jsp 한화면 당 표시할 item 넘버
	private int cntPageItemNum;
	// 맨 마지막 페이지 넘버
	private int lastPageNum;
	// 총 페이지 개수
	private int cntTotalPageNum;
	// 한 페이지당 보일 pageNumber ex) 한페이지당 다음 페이지로 넘어갈수있는 숫자링크의 개수
	private int cntPageNum = 5; // 미리 5로 사이즈 결정
	
	// 시작 item number
	private int startItemNum;
	// 끝 item number
	private int endItemNum;
	
	public PagingVO(int _cntTotalPageNum, int _nowPageNum, int _cntPageItemNum) {
		cntPageItemNum = _cntPageItemNum;
		cntTotalPageNum = _cntTotalPageNum;
		nowPageNum = _nowPageNum;
		
		// 계산
		calLastPageNumber(_cntTotalPageNum, _cntPageItemNum);
		calStartEndPageNumber(_nowPageNum, _cntPageItemNum);
		calStartEndItemNumber(_nowPageNum, _cntPageItemNum);
		
	}
	
	// 계산함수
	
	private void calStartEndItemNumber(int _nowPageNum, int _cntPageItemNum) {
		setEndItemNum(_nowPageNum * _cntPageItemNum);
		setStartItemNum(getEndItemNum() - _cntPageItemNum + 1);
		
	}

	// 맨 마지막 페이지 넘버 계산
	public void calLastPageNumber(int _cntTotalPageNum, int _cntPageItemNum) {
		setLastPageNum((int)Math.ceil( (double)_cntTotalPageNum / (double)_cntPageItemNum) ); 
	}
	
	// 현재 페이지의 시작과 끝을 계산
	public void calStartEndPageNumber(int _nowPageNum, int _cntPageItemNum) {
		// end page 숫자 계산 
		setEndPageNum((int)Math.ceil((double)_nowPageNum / cntPageNum) * cntPageNum);
		 
		 if(getLastPageNum() < getEndPageNum()) {
			 setEndPageNum(getLastPageNum());
		 }
		 
		 // 현재 시작 페이지 number계산
		setStartPageNum(getEndPageNum() - _cntPageItemNum + 1);
		if(getStartPageNum() < 0) {
			setStartPageNum(1);
		}
	}
	
	
	
	// getter, setter
	
	public int getNowPageNum() {
		return nowPageNum;
	}

	public void setNowPageNum(int nowPageNum) {
		this.nowPageNum = nowPageNum;
	}

	public int getStartPageNum() {
		return startPageNum;
	}

	public void setStartPageNum(int startPageNum) {
		this.startPageNum = startPageNum;
	}

	public int getEndPageNum() {
		return endPageNum;
	}

	public void setEndPageNum(int endPageNum) {
		this.endPageNum = endPageNum;
	}

	public int getCntPageItemNum() {
		return cntPageItemNum;
	}

	public void setCntPageItemNum(int cntPageItemNum) {
		this.cntPageItemNum = cntPageItemNum;
	}

	public int getLastPageNum() {
		return lastPageNum;
	}

	public void setLastPageNum(int lastPageNum) {
		this.lastPageNum = lastPageNum;
	}

	public int getCntTotalPageNum() {
		return cntTotalPageNum;
	}

	public void setCntTotalPageNum(int cntTotalPageNum) {
		this.cntTotalPageNum = cntTotalPageNum;
	}
	

	public int getCntPageNum() {
		return cntPageNum;
	}
	

	public void setCntPageNum(int cntPageNum) {
		this.cntPageNum = cntPageNum;
	}
	

	public int getStartItemNum() {
		return startItemNum;
	}
	

	public void setStartItemNum(int startItemNum) {
		this.startItemNum = startItemNum;
	}
	

	public int getEndItemNum() {
		return endItemNum;
	}
	

	public void setEndItemNum(int endItemNum) {
		this.endItemNum = endItemNum;
	}
	
	

}
