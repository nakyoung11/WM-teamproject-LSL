package com.lsl.wm.vo;


public class ShowVO {
	private int i_show;
	private int i_user;
	private String show_poster;
	private String show_title;
	private String show_ctnt;
	private String r_dt;
	private String searchText;
	private int row;
	private int likeCnt;
	private int cmtCnt;
	
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
	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	public int getRow() {
		return row;
	}
	public void setRow(int row) {
		this.row = row;
	}
	public int getI_show() {
		return i_show;
	}
	public void setI_show(int i_show) {
		this.i_show = i_show;
	}
	public int getI_user() {
		return i_user;
	}
	public void setI_user(int i_user) {
		this.i_user = i_user;
	}
	public String getShow_poster() {
		return show_poster;
	}
	public void setShow_poster(String show_poster) {
		this.show_poster = show_poster;
	}
	public String getShow_title() {
		return show_title;
	}
	public void setShow_title(String show_title) {
		this.show_title = show_title;
	}
	public String getShow_ctnt() {
		return show_ctnt;
	}
	public void setShow_ctnt(String show_ctnt) {
		this.show_ctnt = show_ctnt;
	}
	public String getR_dt() {
		return r_dt;
	}
	public void setR_dt(String r_dt) {
		this.r_dt = r_dt;
	}
	
}
