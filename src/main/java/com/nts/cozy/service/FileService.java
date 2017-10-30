package com.nts.cozy.service;

import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Service;

import com.nts.cozy.common.FileManager;
import com.nts.cozy.vo.Review;
import com.nts.cozy.vo.Store;
import com.nts.cozy.vo.file.ReviewImage;
import com.nts.cozy.vo.file.StoreImage;

/**
 * @author 신창환
 *
 */
@Service
public class FileService {

	public Store getStoreImageInfo(int storeId) {
		String menuImagePath = FileManager.STORE_MENU_IMAGE.getFilePaths(storeId);
		String coverImagePath = FileManager.STORE_COVER_IMAGE.getFilePaths(storeId);

		Store storeImageInfo = new Store();
		storeImageInfo.setStoreId(storeId);
		storeImageInfo.setMenuImagePath(menuImagePath);
		storeImageInfo.setCoverImagePath(coverImagePath);

		return storeImageInfo;

	}

	public Review getReviewImageInfo(int reviewId) {
		String reviewImagePath = FileManager.REVIEW_IMAGE.getFilePaths(reviewId);

		Review reviewImageInfo = new Review();
		reviewImageInfo.setReviewId(reviewId);
		reviewImageInfo.setReviewImagePath(reviewImagePath);

		return reviewImageInfo;

	}

	public void registerStoreImage(int storeId, StoreImage image) throws IllegalStateException, IOException {
		FileManager.STORE_MENU_IMAGE.save(storeId, image.getMenuImageFile());
		FileManager.STORE_COVER_IMAGE.saveAll(storeId, image.getImageFiles());

	}

	public void removeStoreImage(int storeId) throws IOException {
		FileManager.STORE_COVER_IMAGE.removeDirectory(storeId);
		FileManager.STORE_MENU_IMAGE.removeDirectory(storeId);

	}

	public void modifyStoreImage(int storeId, StoreImage imagesToUpdate, List<String> imagePathsToRemove)
		throws IllegalStateException, IOException {

		FileManager.FILE.remove(imagePathsToRemove);
		FileManager.STORE_MENU_IMAGE.modify(storeId, imagesToUpdate.getMenuImageFile());
		FileManager.STORE_COVER_IMAGE.modifyAll(storeId, imagesToUpdate.getImageFiles());

	}

	public void registerReviewImage(int reviewId, ReviewImage image) throws IllegalStateException, IOException {
		FileManager.REVIEW_IMAGE.saveAll(reviewId, image.getImageFiles());

	}

	public void removeReviewImage(int reviewId) throws IOException {
		FileManager.REVIEW_IMAGE.removeDirectory(reviewId);

	}

	public void modifyReviewImage(int reviewId, ReviewImage imageToUpdate, List<String> imagesToDelete)
		throws IllegalStateException, IOException {

		FileManager.FILE.remove(imagesToDelete);
		FileManager.REVIEW_IMAGE.modifyAll(reviewId, imageToUpdate.getImageFiles());

	}

}
