package com.nts.cozy.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nts.cozy.dao.StoreCertificationDao;
import com.nts.cozy.dao.StoreDao;
import com.nts.cozy.vo.StoreCertification;

/**
 * @author 신창환
 *
 */
@Service
public class StoreCertificationService {

	@Autowired
	StoreCertificationDao storeCertificationDao;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	StoreDao storeDao;

	public List<StoreCertification> getMyStoreCertifications(String nickname, int startCertificationNo) {
		Map<String, Object> searchCondition = new HashMap<>();
		searchCondition.put("nickname", nickname);
		searchCondition.put("startCertificationNo", startCertificationNo);
		
		return storeCertificationDao.selectMyStoreCertifications(searchCondition);
	}
	
	public List<StoreCertification> getAllStoreCertifications(int startCertificationNo) {
		return storeCertificationDao.selectAllStoreCertifications(startCertificationNo);
	}
	
	public int getMyStoreCertificationCount(String nickname) {
		return storeCertificationDao.selectMyStoreCertificationCount(nickname);
	}
	
	public int getStoreCertificationTotalCount() {
		return storeCertificationDao.selectStoreCertificationTotalCount();
	}
	
	public boolean checkExistCertification(int id) {
		return storeCertificationDao.selectExistCtcertification(id);
	}
	
	public boolean registerStoreCertification(StoreCertification certification) {
		return storeCertificationDao.insertStoreCertification(certification);
	}
	
	@Transactional
	public boolean acceptStoreCertification(int storeCertificationId, String nickname, String authority) {
		int storeId = storeCertificationDao.selectStoreId(storeCertificationId);
		
		memberService.addAuthorityByNickname(nickname, authority);
		storeDao.updateStoreHost(storeId, nickname);
		return storeCertificationDao.updateStoreCertification(storeCertificationId);
	}
	
	public boolean rejectStoreCertification(int storeCertificationId) {
		return storeCertificationDao.deleteStoreCertification(storeCertificationId);
	}

}
