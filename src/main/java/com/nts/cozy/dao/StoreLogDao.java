package com.nts.cozy.dao;

import org.springframework.stereotype.Repository;

import com.nts.cozy.vo.Store;

/**
 * @author 신창환
 *
 */
@Repository
public interface StoreLogDao {

	Store selectStoreLogByDate(Store searchInfo);
	
	boolean insertStoreLog(Store store);

}
