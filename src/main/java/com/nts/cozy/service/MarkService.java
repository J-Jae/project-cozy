package com.nts.cozy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nts.cozy.dao.MarkDao;
import com.nts.cozy.vo.Mark;

/**
 * @author 박정재
 *
 */
@Service
public class MarkService {
	@Autowired
	MarkDao markDao;

	public Mark getMark(Mark mark) {
		return markDao.selectMark(mark);
	}

	public List<Mark> getMarkByNickname(String nickname) {
		return markDao.selectMarkByNickname(nickname);
	}

	public Double getAvgByStoreId(int storeId) {
		return markDao.selectAvgByStoreId(storeId);
	}

	public boolean registerMark(Mark mark) {
		return markDao.insertMark(mark);
	}

	public boolean modifyMark(Mark mark) {
		return markDao.updateMark(mark);
	}

	public boolean removeMark(Mark mark) {
		return markDao.deleteMark(mark);
	}

}
