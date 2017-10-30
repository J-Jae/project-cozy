package com.nts.cozy.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.nts.cozy.vo.Mark;

/**
 * @author 박정재
 */
@Repository
public interface MarkDao {
	
	Mark selectMark(Mark mark);

	Double selectAvgByStoreId(int id);
	
	List<Mark> selectMarkByNickname(String nickname);

	boolean insertMark(Mark mark);

	boolean updateMark(Mark mark);

	boolean deleteMark(Mark mark);
	
}
