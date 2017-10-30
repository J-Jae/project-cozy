package com.nts.cozy.vo;

/**
 * @author project_신창환
 *
 */
public class Store {
	private int storeId;
	private String nickname;
	private String storeName;
	private String category;
	private String mainTel;
	private String subTel;
	private String storeUrl;
	private String keywordTag;
	private String menuTag;
	private String roadAddress;
	private String sectionName;
	private String coordinateX;
	private String coordinateY;
	private Double rate;

	private String notice;
	private int state;

	private String menuImagePath;
	private String coverImagePath;

	private String registeredDate;
	private String modifiedDate;

	public int getStoreId() {
		return storeId;
	}

	public void setStoreId(int storeId) {
		this.storeId = storeId;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getMainTel() {
		return mainTel;
	}

	public void setMainTel(String mainTel) {
		this.mainTel = mainTel;
	}

	public String getSubTel() {
		return subTel;
	}

	public void setSubTel(String subTel) {
		this.subTel = subTel;
	}

	public String getStoreUrl() {
		return storeUrl;
	}

	public void setStoreUrl(String storeUrl) {
		this.storeUrl = storeUrl;
	}

	public String getKeywordTag() {
		return keywordTag;
	}

	public void setKeywordTag(String keywordTag) {
		this.keywordTag = keywordTag;
	}

	public String getMenuTag() {
		return menuTag;
	}

	public void setMenuTag(String menuTag) {
		this.menuTag = menuTag;
	}

	public String getRoadAddress() {
		return roadAddress;
	}

	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}

	public String getSectionName() {
		return sectionName;
	}

	public void setSectionName(String sectionName) {
		this.sectionName = sectionName;
	}

	public String getNotice() {
		return notice;
	}

	public void setNotice(String notice) {
		this.notice = notice;
	}

	public String getCoordinateX() {
		return coordinateX;
	}

	public void setCoordinateX(String coordinateX) {
		this.coordinateX = coordinateX;
	}

	public String getCoordinateY() {
		return coordinateY;
	}

	public void setCoordinateY(String coordinateY) {
		this.coordinateY = coordinateY;
	}

	public Double getRate() {
		return rate;
	}

	public void setRate(Double rate) {
		this.rate = rate;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getMenuImagePath() {
		return menuImagePath;
	}

	public void setMenuImagePath(String menuImagePath) {
		this.menuImagePath = menuImagePath;
	}

	public String getCoverImagePath() {
		return coverImagePath;
	}

	public void setCoverImagePath(String coverImagePath) {
		this.coverImagePath = coverImagePath;
	}

	public String getRegisteredDate() {
		return registeredDate;
	}

	public void setRegisteredDate(String registeredDate) {
		this.registeredDate = registeredDate;
	}

	public String getModifiedDate() {
		return modifiedDate;
	}

	public void setModifiedDate(String modifiedDate) {
		this.modifiedDate = modifiedDate;
	}

}
