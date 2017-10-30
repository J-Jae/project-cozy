package com.nts.cozy.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.nts.cozy.vo.Store;

/**
 * @author 박정재_신창환
 *
 */
@Repository
public interface StoreDao {

	Store selectStore(int id);

	Store selectDeletedStore(int id);

	List<Store> selectSomeStore(Map<String, Object> searchInfo);

	Integer selectExistedStore(Store searchInfo);

	boolean selectStoreDuplication(Store searchInfo);
	
	int selectStoreCount();

	boolean insertStore(Store store);

	boolean deleteStore(int id);

	boolean updateStore(Store store);
	
	boolean updateStoreHost(@Param("storeId")int storeId, @Param("nickname")String nickname);

	boolean updateStoreImagePath(Store imageInfo);

}
