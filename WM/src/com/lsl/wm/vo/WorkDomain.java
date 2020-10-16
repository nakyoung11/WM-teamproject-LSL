package com.lsl.wm.vo;

public class WorkDomain extends WorkVO{
	//좋아요 개수
	int likeCnt;
	//댓글 개수
	int cmtCnt;
	
	public int getLikeCnt() {
		return likeCnt;
	}
	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}
	public int getCmtCnt() {
		return cmtCnt;
	}
	public void setCmtCnt(int cmtCnt) {
		this.cmtCnt = cmtCnt;
	}

}
