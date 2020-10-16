package com.lsl.wm.vo;

import java.util.List;

public class ShowArrDomain extends ShowVO{
	//전시회 안의 작품정보(하나의 전시회에 여러 작품이 존재하니 list로 선언)
	private List<ShowListDomain> showDomainList;
	//작품 개수
	private int workCnt;

	public int getWorkCnt() {
		return workCnt;
	}

	public void setWorkCnt(int workCnt) {
		this.workCnt = workCnt;
	}

	public List<ShowListDomain> getShowDomainList() {
		return showDomainList;
	}

	public void setShowDomainList(List<ShowListDomain> showDomainList) {
		this.showDomainList = showDomainList;
	}

	
}
