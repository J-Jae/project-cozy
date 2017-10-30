package com.nts.cozy.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nts.cozy.service.ReviewService;
import com.nts.cozy.vo.Review;
import com.nts.cozy.vo.file.ReviewImage;

/**
 * @author 박정재_신창환
 *
 */
@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	ReviewService reviewService;

	@GetMapping({"", "/list"})
	public String loaeStoreListView() {
		return "review/list";
	}

	@GetMapping("/storeSearch")
	public String loadStoreExistSearchView() {
		return "store/existSearch";
	}

	@GetMapping("/register")
	public String loadReviewRegisterView() {
		return "review/register";
	}

	/**
	 * @author 신창환
	 */
	@PostMapping("/register")
	public String registerReview(HttpServletRequest request, Review review, ReviewImage image)
		throws IllegalStateException, IOException {

		review.setIpv6(request.getRemoteAddr());
		reviewService.registerReview(review, image);
		return "review/list";
	}

	/**
	 * @author 신창환
	 */
	@PostMapping("/remove")
	@ResponseBody
	public boolean removeReview(@RequestParam("reviewId") int id) throws IllegalStateException, IOException {
		return reviewService.removeReview(id);
	}

	/**
	 * @author 신창환
	 */
	@GetMapping("/detail/{reviewId}")
	public String getReview(Model model, @PathVariable("reviewId") int id) {
		Review review = reviewService.getReview(id);
		model.addAttribute("review", review);

		return "review/detail";
	}

	/**
	 * @author 신창환
	 */
	@PostMapping("/modify")
	public String modifyReview(Model model, Review review, ReviewImage imageToUpdate,
		@RequestParam(value = "imageToDelete", required = false) List<String> imagesToDelete) throws IOException {

		if (review.getStoreId() == 0) {
			int id = review.getReviewId();
			model.addAttribute("review", reviewService.getReview(id));
			return "review/modify";
		}

		reviewService.modifyReview(review, imageToUpdate, imagesToDelete);
		return "review/list";
	}

	/**
	 * @author 신창환
	 */
	@GetMapping("/list/all/json")
	@ResponseBody
	public List<Review> getAllReviews(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo) {
		return reviewService.getAllReviews(pageNo);
	}

	/**
	 * @author 신창환
	 */
	@GetMapping("/list/favorite/json")
	@ResponseBody
	public List<Review> getReviewsByMyFavorite(
		@RequestParam(value = "target", defaultValue = "") String nickname,
		@RequestParam(value = "pageNo", defaultValue = "1") int pageNo) {

		return reviewService.getReviewsByMyFavorite(nickname, pageNo);
	}

	/**
	 * @author 신창환
	 */
	@GetMapping("/list/tag/json")
	@ResponseBody
	public List<Review> getReviewsByMyTags(
		@RequestParam(value = "target", defaultValue = "") String nickname,
		@RequestParam(value = "pageNo", defaultValue = "1") int pageNo) {

		return reviewService.getReviewsByMyTags(nickname, pageNo);
	}

	/**
	 * @author 신창환
	 */
	@GetMapping("/list/section/json")
	@ResponseBody
	public List<Review> getReviewsByMySection(
		@RequestParam(value = "target", defaultValue = "") String nickname,
		@RequestParam(value = "pageNo", defaultValue = "1") int pageNo) {

		return reviewService.getReviewsByMySection(nickname, pageNo);
	}

	/**
	 * @author 신창환
	 */
	@GetMapping("/list/my/json")
	@ResponseBody
	public List<Review> getMyReviews(
		@RequestParam(value = "target", defaultValue = "") String nickname,
		@RequestParam(value = "pageNo", defaultValue = "1") int pageNo) {

		return reviewService.getMyReviews(nickname, pageNo);
	}

	@GetMapping("/list/search/json")
	@ResponseBody
	public List<Review> getReviewsByTagSearch(
		@RequestParam(value = "target", defaultValue = "") String tag,
		@RequestParam(value = "pageNo", defaultValue = "1") int pageNo) {

		return reviewService.getReviewsByTagSearch(tag, pageNo);
	}

	/**
	 * @author 박정재
	 */
	@GetMapping("/list/store/json")
	@ResponseBody
	public List<Review> getReviewsByStore(
		@RequestParam(value = "storeId", defaultValue = "") int storeId,
		@RequestParam(value = "pageNo", defaultValue = "1") int pageNo) {

		return reviewService.getReviewsByStore(storeId, pageNo);
	}

}
