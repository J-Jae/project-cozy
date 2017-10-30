package com.nts.cozy.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.nts.cozy.vo.StoreCertification;

/**
 * @author 신창환
 *
 */
@Repository
public interface StoreCertificationDao {

	List<StoreCertification> selectMyStoreCertifications(Map<String, Object> searchInfo);
	
	List<StoreCertification> selectAllStoreCertifications(int startCertificationNo);
	
	int selectMyStoreCertificationCount(String nickname);
	
	int selectStoreCertificationTotalCount();
	
	int selectStoreId(int id);
	
	boolean selectExistCtcertification(int id);
	
	boolean insertStoreCertification(StoreCertification certification);
	
	boolean deleteStoreCertification(int id);
	
	boolean updateStoreCertification(int id);

}
