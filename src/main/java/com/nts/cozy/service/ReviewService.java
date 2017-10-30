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
import com.nts.cozy.dao.ReviewDao;
import com.nts.cozy.exception.UpdateFailException;
import com.nts.cozy.vo.Review;
import com.nts.cozy.vo.file.ReviewImage;

/**
 * @author 신창환
 *
 */
@Service
public class ReviewService {

	@Autowired
	ReviewDao reviewDao;

	@Autowired
	MemberDao memberDao;

	@Autowired
	FileService fileService;

	public Review getReview(int reviewId) {
		return reviewDao.selectReview(reviewId);
	}

	@Transactional
	public void registerReview(Review review, ReviewImage image) throws IllegalStateException, IOException {
		reviewDao.insertReview(review);

		int registeredReviewId = review.getReviewId();
		fileService.registerReviewImage(registeredReviewId, image);

		Review imageInfo = fileService.getReviewImageInfo(registeredReviewId);

		reviewDao.updateReviewImagePath(imageInfo);
	}

	@Transactional
	public boolean removeReview(int reviewId) throws IllegalStateException, IOException {
		if (reviewDao.deleteReview(reviewId) == false) {
			return false;
		}

		fileService.removeReviewImage(reviewId);

		return true;
	}

	@Transactional
	public void modifyReview(Review review, ReviewImage imageToUpdate, List<String> imagesToDelete)
		throws IllegalStateException, IOException {

		if (reviewDao.updateReview(review) == false) {
			throw new UpdateFailException("Update Fail");
		}

		int reviweId = review.getReviewId();
		fileService.modifyReviewImage(reviweId, imageToUpdate, imagesToDelete);

		Review imageInfo = fileService.getReviewImageInfo(reviweId);
		reviewDao.updateReviewImagePath(imageInfo);
	}

	public List<Review> getAllReviews(int pageNo) {
		int postBeginNo = PagingManager.PAGING.computeBeginPostNo(pageNo);

		return reviewDao.selectAllReviews(postBeginNo);
	}

	public List<Review> getMyReviews(String nickname, int pageNo) {
		int postBeginNo = PagingManager.PAGING.computeBeginPostNo(pageNo);

		Map<String, Object> nameAndBeginPageNo = new HashMap<>();
		nameAndBeginPageNo.put("nickname", nickname);
		nameAndBeginPageNo.put("postBeginNo", postBeginNo);

		return reviewDao.selectMyReviews(nameAndBeginPageNo);
	}

	public List<Review> getReviewsByMyFavorite(String nickname, int pageNo) {
		int postBeginNo = PagingManager.PAGING.computeBeginPostNo(pageNo);

		Map<String, Object> nameAndBeginPageNo = new HashMap<>();
		nameAndBeginPageNo.put("nickname", nickname);
		nameAndBeginPageNo.put("postBeginNo", postBeginNo);

		return reviewDao.selectReviewsByMyFavorite(nameAndBeginPageNo);
	}

	public List<Review> getReviewsByMyTags(String nickname, int pageNo) {
		int postBeginNo = PagingManager.PAGING.computeBeginPostNo(pageNo);

		String myTags = memberDao.selectMemberTag(nickname);
		myTags = StringUtils.defaultIfBlank(myTags, "NOTAG");
		myTags = StringUtils.replace(myTags, ",", "|");

		Map<String, Object> myTagsAndBeginPageNo = new HashMap<>();
		myTagsAndBeginPageNo.put("myTags", myTags);
		myTagsAndBeginPageNo.put("postBeginNo", postBeginNo);

		return reviewDao.selectReviewsByMyTags(myTagsAndBeginPageNo);
	}

	public List<Review> getReviewsByMySection(String nickname, int pageNo) {
		int postBeginNo = PagingManager.PAGING.computeBeginPostNo(pageNo);

		Map<String, Object> nameAndBeginPageNo = new HashMap<>();
		nameAndBeginPageNo.put("nickname", nickname);
		nameAndBeginPageNo.put("postBeginNo", postBeginNo);

		return reviewDao.selectReviewsByMySection(nameAndBeginPageNo);
	}

	public List<Review> getReviewsByTagSearch(String tag, int pageNo) {
		int postBeginNo = PagingManager.PAGING.computeBeginPostNo(pageNo);

		Map<String, Object> tagAndBeginPageNo = new HashMap<>();
		tagAndBeginPageNo.put("tag", tag);
		tagAndBeginPageNo.put("postBeginNo", postBeginNo);

		return reviewDao.selectReviewsByTagSearch(tagAndBeginPageNo);
	}

	public List<Review> getReviewsByStore(int storeId, int pageNo) {
		int postBeginNo = PagingManager.PAGING.computeBeginPostNo(pageNo);

		Map<String, Object> nameAndBeginPageNo = new HashMap<>();
		nameAndBeginPageNo.put("storeId", storeId);
		nameAndBeginPageNo.put("postBeginNo", postBeginNo);

		return reviewDao.selectReviewsByStore(nameAndBeginPageNo);
	}

}
