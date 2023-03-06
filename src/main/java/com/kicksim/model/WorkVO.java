package com.kicksim.model;

import java.util.Date;
import java.util.List;

public class WorkVO {
	/* 상품 id */
	private int workId;
	
	/* 상품 이름 */
	private String workName;
	
	/* 작가 id */
	private int authorId;
	
	

	@Override
	public String toString() {
		return "WorkVO [workId=" + workId + ", workName=" + workName + ", authorId=" + authorId + ", authorName="
				+ authorName + ", exhibitYear=" + exhibitYear + ", exhibiter=" + exhibiter + ", cateCode=" + cateCode
				+ ", cateName=" + cateName + ", workPrice=" + workPrice + ", workStock=" + workStock + ", workDiscount="
				+ workDiscount + ", workIntro=" + workIntro + ", workContents=" + workContents + ", regDate=" + regDate
				+ ", updateDate=" + updateDate + ", imageList=" + imageList + "]";
	}

	public List<AttachImageVO> getImageList() {
		return imageList;
	}

	public void setImageList(List<AttachImageVO> imageList) {
		this.imageList = imageList;
	}

	public int getWorkId() {
		return workId;
	}

	public void setWorkId(int workId) {
		this.workId = workId;
	}

	public String getWorkName() {
		return workName;
	}

	public void setWorkName(String workName) {
		this.workName = workName;
	}

	public int getAuthorId() {
		return authorId;
	}

	public void setAuthorId(int authorId) {
		this.authorId = authorId;
	}

	public String getAuthorName() {
		return authorName;
	}

	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}

	public String getExhibitYear() {
		return exhibitYear;
	}

	public void setExhibitYear(String exhibitYear) {
		this.exhibitYear = exhibitYear;
	}

	public String getExhibiter() {
		return exhibiter;
	}

	public void setExhibiter(String exhibiter) {
		this.exhibiter = exhibiter;
	}

	public String getCateCode() {
		return cateCode;
	}

	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}

	public int getWorkPrice() {
		return workPrice;
	}

	public void setWorkPrice(int workPrice) {
		this.workPrice = workPrice;
	}

	public int getWorkStock() {
		return workStock;
	}

	public void setWorkStock(int workStock) {
		this.workStock = workStock;
	}

	public double getWorkDiscount() {
		return workDiscount;
	}

	public void setWorkDiscount(double workDiscount) {
		this.workDiscount = workDiscount;
	}

	public String getWorkIntro() {
		return workIntro;
	}

	public void setWorkIntro(String workIntro) {
		this.workIntro = workIntro;
	}

	public String getWorkContents() {
		return workContents;
	}

	public void setWorkContents(String workContents) {
		this.workContents = workContents;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	/* 작가 이름 */
	private String authorName;
	
	/* 출판일 */
	private String exhibitYear;
	
	/* 출판사 */
	private String exhibiter;
	
	/* 카테고리 코드 */
	private String cateCode;
	
	/* 카테고리 이름 */
	private String cateName;
	
	/* 상품 가격 */
	private int workPrice;
	
	/* 상품 재고 */
	private int workStock;
	
	/* 상품 할인률(백분율) */
	private double workDiscount;
	
	/* 상품 소개 */
	private String workIntro;
	
	/* 상품 목차 */
	private String workContents;
	
	/* 등록 날짜 */
	private Date regDate;
	
	/* 수정 날짜 */
	private Date updateDate;
	/* 이미지 정보 */
	private List<AttachImageVO> imageList;
}
