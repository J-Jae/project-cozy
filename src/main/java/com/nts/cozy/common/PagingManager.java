package com.nts.cozy.common;

import com.nts.cozy.vo.Paging;

/**
 * @author 신창환
 *
 */
public enum PagingManager {
	PAGING;

	private final int POST_COUNT = 9;

	public Paging generator(int pageNo, int boardTotalCount) {
		Paging paging = new Paging();
		paging.setPageNo(pageNo);
		paging.setTotalCount(boardTotalCount);

		return paging;

	}

	public int computeBeginPostNo(int pageNo) {
		return (pageNo - 1) * POST_COUNT;
	}

}
