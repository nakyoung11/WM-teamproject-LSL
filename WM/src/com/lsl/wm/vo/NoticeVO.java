package com.lsl.wm.vo;

public class NoticeVO {
	private int i_notice; // primary key
	private String title; // 공지사항 제목
	private String ctnt; // 공지사항 내용
	private int i_user; // 등록하는 사용자 primary key
	private String r_dt; // 등록 시간
	private String m_dt; // 수정 시간
	private String nm; // 등록하는 사용자 닉네임
	
	public int getI_notice() {
		return i_notice;
	}
	public void setI_notice(int i_notice) {
		this.i_notice = i_notice;
	}
	public String getNm() {
		return nm;
	}
	public void setNm(String nm) {
		this.nm = nm;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCtnt() {
		return ctnt;
	}
	public void setCtnt(String ctnt) {
		this.ctnt = ctnt;
	}
	public int getI_user() {
		return i_user;
	}
	public void setI_user(int i_user) {
		this.i_user = i_user;
	}
	public String getR_dt() {
		return r_dt;
	}
	public void setR_dt(String r_dt) {
		this.r_dt = r_dt;
	}
	public String getM_dt() {
		return m_dt;
	}
	public void setM_dt(String m_dt) {
		this.m_dt = m_dt;
	}
	
}
