package com.nts.cozy.controller;

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

import com.nts.cozy.common.PagingManager;
import com.nts.cozy.service.StoreCertificationService;
import com.nts.cozy.vo.Paging;
import com.nts.cozy.vo.StoreCertification;

/**
 * @author 신창환
 *
 */
@Controller
@RequestMapping("/store/certification")
public class StoreCertificationController {

	@Autowired
	StoreCertificationService storeCertificationService;

	@GetMapping("/register")
	public String loadStoreCertificationRegisterView() {
		return "/store/certification/register";
	}

	@GetMapping("/storeSearch")
	public String loadStoreExistSearchView() {
		return "store/existSearch";
	}

	@PostMapping("/register")
	public String registerStoreCertification(StoreCertification certification) {
		storeCertificationService.registerStoreCertification(certification);
		return "store/certification/list";
	}

	@PostMapping("/accept/admin")
	@ResponseBody
	public boolean acceptStoreCertifications(@RequestParam("storeCertificationId") int id,
		@RequestParam("nickname") String nickname,
		@RequestParam("authorityToAdd") String authority) {
		
		return storeCertificationService.acceptStoreCertification(id, nickname, authority);
	}

	@PostMapping("/reject/admin")
	@ResponseBody
	public boolean rejectStoreCertifications(@RequestParam("storeCertificationId") int id) {
		return storeCertificationService.rejectStoreCertification(id);
	}

	@GetMapping("/list/{nickname}")
	public String getMyStoreCertifications(Model model,
		@PathVariable(value = "nickname") String nickname,
		@RequestParam(value = "pageNo", defaultValue = "1") int pageNo) {

		List<StoreCertification> storeCertifications;

		int myCertificationCount = storeCertificationService.getMyStoreCertificationCount(nickname);
		Paging paging = PagingManager.PAGING.generator(pageNo, myCertificationCount);
		storeCertifications = storeCertificationService.getMyStoreCertifications(nickname, paging.getStartBoardNo());

		model.addAttribute("paging", paging);
		model.addAttribute("myStoreCertifications", storeCertifications);

		return "/store/certification/list";
	}

	@GetMapping("/list/admin")
	public String getStoreCertifications(Model model,
		@RequestParam(value = "pageNo", defaultValue = "1") int pageNo) {

		List<StoreCertification> storeCertifications;

		int certificationTotalCount = storeCertificationService.getStoreCertificationTotalCount();
		Paging paging = PagingManager.PAGING.generator(pageNo, certificationTotalCount);
		storeCertifications = storeCertificationService.getAllStoreCertifications(paging.getStartBoardNo());

		model.addAttribute("paging", paging);
		model.addAttribute("storeCertifications", storeCertifications);

		return "/store/certification/adminList";
	}

}
