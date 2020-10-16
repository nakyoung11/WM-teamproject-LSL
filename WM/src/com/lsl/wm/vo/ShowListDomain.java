package com.lsl.wm.vo;

public class ShowListDomain extends ShowListVO{
	//작가
	private int i_user;
	//작품 제목
	private String  work_title;
	//작품 설명
	private String work_ctnt;
	//작품 이미지 명
	private String work_image;
	//좋아요 개수
	private int like_cnt;
	//댓글 개수
	private int cmt_cnt;
	//작품 개수
	private int showListCnt;
	        
	public int getShowListCnt() {
		return showListCnt;
	}
	public void setShowListCnt(int showListCnt) {
		this.showListCnt = showListCnt;
	}
	public int getCmt_cnt() {
		return cmt_cnt;
	}
	public void setCmt_cnt(int cmt_cnt) {
		this.cmt_cnt = cmt_cnt;
	}
	public int getLike_cnt() {
		return like_cnt;
	}
	public void setLike_cnt(int like_cnt) {
		this.like_cnt = like_cnt;
	}
	public int getI_user() {
		return i_user;
	}
	public void setI_user(int i_user) {
		this.i_user = i_user;
	}
	public String getWork_title() {
		return work_title;
	}
	public void setWork_title(String work_title) {
		this.work_title = work_title;
	}
	public String getWork_ctnt() {
		return work_ctnt;
	}
	public void setWork_ctnt(String work_ctnt) {
		this.work_ctnt = work_ctnt;
	}
	public String getWork_image() {
		return work_image;
	}
	public void setWork_image(String work_image) {
		this.work_image = work_image;
	}
}
