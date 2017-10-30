package com.nts.cozy.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.nts.cozy.vo.Review;

/**
 * @author 박정재_신창환
 *
 */
@Repository
public interface ReviewDao {

	Review selectReview(int id);
	
	List<Review> selectAllReviews(int postBeginNo);
	
	List<Review> selectMyReviews(Map<String, Object> searchInfo);
	
	List<Review> selectReviewsByMyFavorite(Map<String, Object> searchInfo);
	
	List<Review> selectReviewsByMyTags(Map<String, Object> searchInfo);
	
	List<Review> selectReviewsByMySection(Map<String, Object> searchInfo);
	
	List<Review> selectReviewsByTagSearch(Map<String, Object> searchInfo);

	List<Review> selectReviewsByStore(Map<String, Object> searchInfo);

	boolean insertReview(Review review);

	boolean deleteReview(int id);

	boolean updateReview(Review review);
	
	boolean updateReviewImagePath(Review imageInfo);
	
}
