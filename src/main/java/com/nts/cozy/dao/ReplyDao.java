package com.nts.cozy.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.nts.cozy.vo.Reply;

/**
 * @author 박정재
 *
 */
@Repository
public interface ReplyDao {
	
	Reply selectReply(int id);
	
	List<Reply> selectReplies();

	List<Reply> selectReplyByStoreId(int id);

	List<Reply> selectSomeReplyByStoreId(int id);

	List<Reply> selectSomeReplyByStorePage(Map<String, Integer> searchInfo);
	
	List<Reply> selectSomeReplyByNicknamePage(Map<String, Object> searchInfo);

	List<Reply> selectReplyByNickname(String nickname);

	int selectReplyCountByStoreId(int id);
	
	int selectReplyCountByNickname(String nickname);
	
	boolean insertReply(Reply reply);

	boolean deleteReply(int id);
	
}
