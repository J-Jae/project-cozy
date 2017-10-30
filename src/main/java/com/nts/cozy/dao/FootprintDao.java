package com.nts.cozy.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.nts.cozy.vo.Footprint;

/**
 * @author 박정재
 */
@Repository
public interface FootprintDao {
	
	List<Footprint> selectFootprint(Map<String, Object> searchInfo);
	
	int selectFootprintCount(String nickname);

	boolean insertFootprint(Footprint footprint);
	
}
