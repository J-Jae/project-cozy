package com.nts.cozy.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nts.cozy.service.NaverSearchService;
import com.nts.cozy.service.StoreCertificationService;
import com.nts.cozy.service.StoreService;
import com.nts.cozy.vo.Store;
import com.nts.cozy.vo.file.StoreImage;

/**
 * @author 박정재_신창환
 */
@Controller
@RequestMapping("/store")
public class StoreController {

	@Autowired
	NaverSearchService naverSearchService;

	@Autowired
	StoreService storeService;
	
	@Autowired
	StoreCertificationService storecertificationService;

	/**
	 * @author 박정재
	 */
	@GetMapping({"", "/", "/list"})
	public String loaeStoreListView() {
		return "store/list";
	}

	/**
	 * @author 신창환
	 */
	@GetMapping("/storeSearch")
	public String loadStoreSearchView() {
		return "store/duplicationSearch";
	}

	/**
	 * @author 신창환
	 */
	@GetMapping("/admin")
	public String loadStoreAdminView() {
		return "store/admin";
	}

	/**
	 * @author 신창환
	 */
	@GetMapping("/modify")
	public String loadStoreModifyView(Model model, @RequestParam("storeId") int id) throws IOException {
		Store store = storeService.getStore(id);
		model.addAttribute("store", store);

		return "store/modify";
	}

	/**
	 * @author 박정재
	 */
	@GetMapping("/detail/{storeId}")
	public String loadDetailView(Model model, @PathVariable("storeId") int id) {
		Store store = storeService.getStore(id);
		boolean isCertification = storecertificationService.checkExistCertification(id);
		
		model.addAttribute("store", store);
		model.addAttribute("isCertification", isCertification);

		return "store/detail";
	}

	/**
	 * @author 신창환
	 */
	@GetMapping("/register")
	public String loadStoreRegisterView() {
		return "store/register";
	}

	/**
	 * @author 박정재
	 */
	@GetMapping("/list/{type}/json")
	@ResponseBody
	public List<Store> getSomeStore(@PathVariable("type") String type,
		@RequestParam(value = "nickname", defaultValue = "") String nickname,
		@RequestParam(value = "orderBy", defaultValue = "Latest") String order,
		@RequestParam(value = "pageNo", defaultValue = "1") int pageNo) {

		return storeService.getSomeStore(type, nickname, order, pageNo);
	}

	/**
	 * @author 신창환
	 */
	@PostMapping("/register")
	public String registerStore(Store store, StoreImage image) throws IOException {
		storeService.registerStore(store, image);
		return "store/list";
	}

	/**
	 * @author 신창환
	 */
	@GetMapping("/checkExist")
	@ResponseBody
	public int checkExistStore(Store store) throws IOException {
		return storeService.checkExistStore(store);
	}

	/**
	 * @author 신창환
	 */
	@GetMapping("/checkDuplication")
	@ResponseBody
	public boolean checkDuplicatedStore(Store store) throws IOException {
		return storeService.checkDuplicatedStore(store);
	}

	/**
	 * @author 신창환
	 */
	@PostMapping("/remove")
	@ResponseBody
	public boolean removeStore(@RequestParam("storeId") int id) throws IOException {
		return storeService.removeStore(id);
	}

	/**
	 * @author 신창환
	 */
	@PostMapping("/modify")
	public String modifyStore(Store store, StoreImage imagesToModify,
		@RequestParam(value = "imagePathsToRemove", required = false) List<String> imagePathsToRemove)
		throws IOException {

		storeService.modifyStore(store, imagesToModify, imagePathsToRemove);
		return "store/list";
	}

	/**
	 * @author 신창환
	 */
	@GetMapping("/search/api")
	@ResponseBody
	public String searchStoreInfos(@RequestParam("storeInfo") String serachValue) {
		String storeInfos = naverSearchService.getStoreInfos(serachValue);
		return storeInfos;
	}

}
