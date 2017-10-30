package com.nts.cozy.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nts.cozy.dao.ReplyDao;
import com.nts.cozy.vo.Reply;

/**
 * @author 박정재_신창환
 *
 */
@Service
public class ReplyService {
	@Autowired
	ReplyDao replyDao;

	public List<Reply> getReplies() {
		return replyDao.selectReplies();
	}

	public List<Reply> getReplyByStoreId(int id) {
		return replyDao.selectReplyByStoreId(id);
	}

	public List<Reply> getSomeReplyByStoreId(int id) {
		return replyDao.selectSomeReplyByStoreId(id);
	}

	public List<Reply> getSomeReplyByStorePage(int storeId, int startBoardNo) {
		Map<String, Integer> searchInfo = new HashMap<>();
		searchInfo.put("storeId", storeId);
		searchInfo.put("startBoardNo", startBoardNo);
		
		return replyDao.selectSomeReplyByStorePage(searchInfo);
	}
	
	public List<Reply> getSomeReplyByNicknamePage(String nickname, int startBoardNo) {
		Map<String, Object> searchInfo = new HashMap<>();
		searchInfo.put("nickname", nickname);
		searchInfo.put("startBoardNo", startBoardNo);
		
		return replyDao.selectSomeReplyByNicknamePage(searchInfo);
	}

	public int getReplyCountByStoreId(int storeId) {
		return replyDao.selectReplyCountByStoreId(storeId);
	}
	
	public int getReplyCountByNickname(String nickname) {
		return replyDao.selectReplyCountByNickname(nickname);
	}

	public boolean registerReply(Reply reply) {
		return replyDao.insertReply(reply);
	}

	public boolean removeReply(int id) {
		return replyDao.deleteReply(id);
	}
}
