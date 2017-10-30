package com.nts.cozy.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nts.cozy.common.PagingManager;
import com.nts.cozy.dao.MemberDao;
import com.nts.cozy.dao.StoreDao;
import com.nts.cozy.dao.StoreLogDao;
import com.nts.cozy.exception.DeleteFailException;
import com.nts.cozy.exception.UpdateFailException;
import com.nts.cozy.vo.Store;
import com.nts.cozy.vo.file.StoreImage;

/**
 * @author 박정재_신창환
 *
 */
@Service
public class StoreService {

	@Autowired
	StoreDao storeDao;

	@Autowired
	StoreLogDao storeLogDao;

	@Autowired
	FileService fileService;

	@Autowired
	MemberDao memberDao;

	/**
	 * @author 신창환
	 */
	public Store getStore(int storeId) {
		return storeDao.selectStore(storeId);
	}

	/**
	 * @author 신창환
	 */
	public int checkExistStore(Store searchInfo) {
		Integer storeId = storeDao.selectExistedStore(searchInfo);

		if (storeId == null) {
			return 0;
		}

		return storeId;
	}

	/**
	 * @author 신창환
	 */
	public boolean checkDuplicatedStore(Store searchInfo) {
		return storeDao.selectStoreDuplication(searchInfo);
	}

	/**
	 * @author 신창환
	 * 
	 * 1. 업체정보DB 등록
	 * 2. 등록된 업체 id를 이용해 업체 정보 이미지 저장
	 * 3. 저장한 이미지의 경로들을 업체정보DB에 업데이트
	 * 4. 최종적으로 등록된 업체정보 로그 등록
	 */
	@Transactional
	public void registerStore(Store store, StoreImage image) throws IllegalStateException, IOException {
		storeDao.insertStore(store);

		int registeredStroeId = store.getStoreId();
		fileService.registerStoreImage(registeredStroeId, image);

		updateImagePath(registeredStroeId);

		storeLogDao.insertStoreLog(store);
	}

	/**
	 * @author 신창환
	 */
	@Transactional
	public boolean removeStore(int storeId) throws IOException {
		if (storeDao.deleteStore(storeId) == false) {
			throw new DeleteFailException("Delete Fail");
		}

		fileService.removeStoreImage(storeId);

		updateImagePath(storeId);

		Store deletedStore = storeDao.selectDeletedStore(storeId);
		return storeLogDao.insertStoreLog(deletedStore);
	}

	/**
	 * @author 신창환
	 */
	@Transactional
	public void modifyStore(Store store, StoreImage imageToUpdate, List<String> imagePathsToRemove)
		throws IllegalStateException, IOException {

		if (storeDao.updateStore(store) == false) {
			throw new UpdateFailException("Update Fail");
		}

		int storeId = store.getStoreId();
		
		fileService.modifyStoreImage(storeId, imageToUpdate, imagePathsToRemove);
		updateImagePath(storeId);
		storeLogDao.insertStoreLog(store);
	}

	/**
	 * @author 박정재
	 */
	public List<Store> getSomeStore(String type, String nickname, String order, int pageNo) {
		int postNo = PagingManager.PAGING.computeBeginPostNo(pageNo);

		Map<String, Object> searchInfo = new HashMap<>();
		searchInfo.put("type", type);
		searchInfo.put("nickname", nickname);
		searchInfo.put("order", order);
		searchInfo.put("postNo", postNo);

		String tag = memberDao.selectMemberTag(nickname);
		tag = StringUtils.defaultIfBlank(tag, "NOTAG");
		tag = StringUtils.replace(tag, ",", "|");
		searchInfo.put("tag", tag);
		
		return storeDao.selectSomeStore(searchInfo);

	}

	@Transactional
	public void updateImagePath(int storeId) {
		Store storeImageInfo = fileService.getStoreImageInfo(storeId);

		if (storeDao.updateStoreImagePath(storeImageInfo) == false) {
			throw new UpdateFailException("Update Fail");
		}
	}
}
