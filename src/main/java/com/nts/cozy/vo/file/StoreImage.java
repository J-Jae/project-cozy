package com.nts.cozy.vo.file;

import org.springframework.web.multipart.MultipartFile;

/**
 * @author project_신창환
 *
 */
public class StoreImage extends Image {
	private MultipartFile menuImageFile;

	public MultipartFile getMenuImageFile() {
		return menuImageFile;
	}

	public void setMenuImageFile(MultipartFile menuImageFile) {
		this.menuImageFile = menuImageFile;
	}

}
