package com.yeogi_jeogi.board;

import java.io.Serializable;

public class board implements Serializable {
	private int bNum;
	private int bSubNum;
	private String bSort;
	private String bUserId;
	private String bTitle;
	private String bContent;
	private String bImgAdd;
	private int bCount;
	private String bCDate;
	private String bMDate;
	private int bRcm;

	public int getbNum() {
		return bNum;
	}
	public void setbNum(int bNum) {
		this.bNum = bNum;
	}
	public int getbSubNum() {
		return bSubNum;
	}
	public void setbSubNum(int bSubNum) {
		this.bSubNum = bSubNum;
	}
	public String getbSort() {
		return bSort;
	}
	public void setbSort(String bSort) {
		this.bSort = bSort;
	}
	public String getbUserId() {
		return bUserId;
	}
	public void setbUserId(String bUserId) {
		this.bUserId = bUserId;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getbContent() {
		return bContent;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public String getbImgAdd() {
		return bImgAdd;
	}
	public void setbImgAdd(String bImgAdd) {
		this.bImgAdd = bImgAdd;
	}
	public int getbCount() {
		return bCount;
	}
	public void setbCount(int bCount) {
		this.bCount = bCount;
	}
	public String getbCDate() {
		return bCDate;
	}
	public void setbCDate(String bCDate) {
		this.bCDate = bCDate;
	}
	public String getbMDate() {
		return bMDate;
	}
	public void setbMDate(String bMDate) {
		this.bMDate = bMDate;
	}
	public int getbRcm() {
		return bRcm;
	}
	public void setbRcm(int bRcm) {
		this.bRcm = bRcm;
	}
	
}
