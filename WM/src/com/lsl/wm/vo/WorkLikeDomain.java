package com.lsl.wm.vo;

public class WorkLikeDomain extends WorkLikeVO{
	//좋아요가 되어있는지 여부
	private int isLike;
	//좋아요 개수
	private int workLikeCnt;
	
	public int getWorkLikeCnt() {
		return workLikeCnt;
	}

	public void setWorkLikeCnt(int workLikeCnt) {
		this.workLikeCnt = workLikeCnt;
	}

	public int getIsLike() {
		return isLike;
	}

	public void setIsLike(int isLike) {
		this.isLike = isLike;
	}
	
	

}
