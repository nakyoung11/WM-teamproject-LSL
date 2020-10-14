package com.lsl.wm.vo;

import java.util.List;

public class ShowArrDomain extends ShowVO{
	private List<ShowListDomain> showDomainList;
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
