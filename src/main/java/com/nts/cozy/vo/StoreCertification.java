package com.nts.cozy.vo;

/**
 * @author project_신창환
 *
 */
public class StoreCertification {
	private int storeCertificationId;
	private int storeId;
	private String storeName;
	private String roadAddress;
	private String nickname;
	private String businessNo;
	
	private int state;

	private String registeredDate;

	public int getStoreCertificationId() {
		return storeCertificationId;
	}

	public void setStoreCertificationId(int storeCertificationId) {
		this.storeCertificationId = storeCertificationId;
	}

	public int getStoreId() {
		return storeId;
	}

	public void setStoreId(int storeId) {
		this.storeId = storeId;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getRoadAddress() {
		return roadAddress;
	}

	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getBusinessNo() {
		return businessNo;
	}

	public void setBusinessNo(String businessNo) {
		this.businessNo = businessNo;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getRegisteredDate() {
		return registeredDate;
	}

	public void setRegisteredDate(String registeredDate) {
		this.registeredDate = registeredDate.split(" ")[0];
	}

}
