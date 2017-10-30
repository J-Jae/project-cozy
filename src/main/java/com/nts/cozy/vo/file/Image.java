package com.nts.cozy.vo.file;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

/**
 * @author project_신창환
 *
 */
public class Image {

	private List<MultipartFile> imageFiles;

	public List<MultipartFile> getImageFiles() {
		return imageFiles;
	}

	public void setImageFiles(List<MultipartFile> imageFiles) {
		this.imageFiles = imageFiles;
	}

}
