package com.nts.cozy.common;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;

/**
 * @author project_신창환
 * 
 * File IO 처리
 *  - 파일별 pathByType 설정
 */
public enum FileManager {
	FILE(""),
	REVIEW_IMAGE("/upload/image/review/"),
	STORE_COVER_IMAGE("/upload/image/store/cover/"),
	STORE_MENU_IMAGE("/upload/image/store/menu/");

	private final String pathByType;

	private final char FILE_SEPARATOR = '~';
	private final char FILE_PATH_SEPARATOR = '/';

	private final String projectPath = System.getProperty("user.dir");
	private final String rootPath = "/src/main/webapp";
	private String workingPath = projectPath + rootPath;

	public String getWorkingPath() {
		return this.workingPath;
	}

	public void setWorkingPath(String workingPath) {
		this.workingPath = workingPath;
	}

	FileManager(String pathByType) {
		this.pathByType = pathByType;
	}

	/**
	 * file save
	 * 
	 * @param uniqueFolderId
	 * @param file
	 * @throws IllegalStateException
	 * @throws IOException
	 * 
	 * uniqueFolderId - 2, 5, 35, 75 와 같은 storeId, reciewId
	 * uploadFullPath -C://User/Desktop/final_project/src/main/webapp/upload/review/4 ...
	 */
	public void save(int uniqueFolderId, MultipartFile file) throws IllegalStateException, IOException {
		if (file.getSize() == 0) {
			return;
		}

		String uploadFullPath = getWorkingPath() + this.pathByType + uniqueFolderId;
		String uniqueFileName = createUniqueFileName(uploadFullPath, file.getOriginalFilename());

		File fileToUpload = new File(uploadFullPath, uniqueFileName);

		FileUtils.forceMkdirParent(fileToUpload);
		file.transferTo(fileToUpload);
	}

	/**
	 * @param uniqueFolderId
	 * @param files
	 * @throws IllegalStateException
	 * @throws IOException
	 * 
	 * uniqueFolderId - 2, 5, 35, 75 와 같은 storeId, reciewId
	 */
	public void saveAll(int uniqueFolderId, List<MultipartFile> files) throws IllegalStateException, IOException {
		for (MultipartFile file : files) {
			save(uniqueFolderId, file);
		}
	}

	/**
	 * file remove
	 * 
	 * @param filePaths 
	 * @throws IOException
	 * 
	 * filePaths - ["/upload/image/store/menu/4/dekgorn3-image2.jpg", "/upload/image/store/cover/4/diej2ndi-image3.jpg"]
	 */
	public void remove(List<String> filePaths) throws IOException {
		System.out.println(filePaths);
		if (filePaths == null) {
			return;
		}

		File file;
		for (String filePath : filePaths) {
			file = new File(getWorkingPath() + filePath);
			FileUtils.forceDelete(file);
		}
	}

	/**
	 * @param uniqueFolderId
	 * @throws IOException
	 * 
	 * uniqueFolderId - 2, 5, 35, 75 와 같은 storeId, reciewId
	 * uploadFullPath - C://User/Desktop/final_project/src/main/webapp/upload/review/4 ...
	 */
	public void removeDirectory(int uniqueFolderId) throws IOException {
		String uploadFullPath = getWorkingPath() + this.pathByType + uniqueFolderId;
		File uploadDirectory = new File(uploadFullPath);

		FileUtils.deleteDirectory(uploadDirectory);
	}

	/**
	 * file modify
	 * 
	 * @param uniqueFolderId
	 * @param file
	 * @throws IOException
	 * 
	 * uniqueFolderId - 2, 5, 35, 75 와 같은 storeId, reciewId
	 */
	public void modify(int uniqueFolderId, MultipartFile file) throws IOException {
		save(uniqueFolderId, file);
	}

	/**
	 * @param uniqueFolderId
	 * @param files
	 * @throws IOException
	 * 
	 * uniqueFolderId - 2, 5, 35, 75 와 같은 storeId, reciewId
	 */
	public void modifyAll(int uniqueFolderId, List<MultipartFile> files) throws IOException {
		for (MultipartFile file : files) {
			save(uniqueFolderId, file);
		}
	}

	/**
	 * @param uniqueFolderId
	 * @return 
	 *  
	 *  uniqueFolderId - 2, 5, 35, 75 와 같은 storeId, reciewId
	 *  uploadPath - /upload/review/4 ...
	 *  uploadFullPath - C://User/Desktop/final_project/src/main/webapp/upload/review/4 ...
	 */
	public String getFilePaths(int uniqueFolderId) {
		String uploadPath = this.pathByType + uniqueFolderId;
		String uploadFullPath = getWorkingPath() + uploadPath;

		File uploadDirectory = new File(uploadFullPath);

		List<String> uploadfilePaths = new ArrayList<String>();
		if (uploadDirectory.isDirectory()) {

			File[] files = uploadDirectory.listFiles();
			if (files.length > 0) {

				for (File file : files) {
					uploadfilePaths.add(uploadPath + FILE_PATH_SEPARATOR + file.getName());
				}
			}
		}
		
		return StringUtils.join(uploadfilePaths, FILE_SEPARATOR);
	}

	/**
	 * @param uploadFullPath
	 * @param originFileName
	 * @return uniqueFileName 
	 * 
	 * uploadFullPath - C://User/Desktop/final_project/src/main/webapp/upload/review/4 ...
	 * originFileName - image1.jpg 
	 * uniqueFileName - k3jf8d0w-image1.jpg
	 * 
	 * 유니크한 파일이름을 생성한 후, 0에 가까운 확률로 그 이름을 가진 파일이 이미 존재한다면, 재생성
	 * 
	 * do-while을 피하기를 지향하지만, 다음과 같은 경우에는 do-while이 적합하다고 생각
	 * do 실행 후 while문 조건에 true일 확률이 0에 가까움.
	 */
	private String createUniqueFileName(String uploadFullPath, String originFileName) {
		File file;
		String uniqueFileName;

		do {
			uniqueFileName = UUID.randomUUID().toString().substring(0, 9) + originFileName;
			file = new File(uploadFullPath, uniqueFileName);
		} while (file.exists());

		return uniqueFileName;
	}

}
