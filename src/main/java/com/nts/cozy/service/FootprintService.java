package com.nts.cozy.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nts.cozy.dao.FootprintDao;
import com.nts.cozy.vo.Footprint;

/**
 * @author 박정재
 *
 */
@Service
public class FootprintService {
	@Autowired
	FootprintDao footprintDao;

	public List<Footprint> getFootprints(String nickname, int pageNo) {
		Map<String, Object> searchInfo = new HashMap<>();
		searchInfo.put("nickname", nickname);
		searchInfo.put("pageNo", pageNo);
		
		return footprintDao.selectFootprint(searchInfo);
	}
	
	public int getFootprintCount(String nickname) {
		return footprintDao.selectFootprintCount(nickname);
	}

	public boolean registerFootprint(Footprint footprint) {
		return footprintDao.insertFootprint(footprint);
	}

}
