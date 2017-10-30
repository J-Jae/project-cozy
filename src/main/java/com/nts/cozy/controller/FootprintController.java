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
import com.nts.cozy.service.FootprintService;
import com.nts.cozy.vo.Footprint;
import com.nts.cozy.vo.Paging;

/**
 * @author 박정재
 */
@Controller
@RequestMapping("/footprint")
public class FootprintController {

	@Autowired
	FootprintService footprintService;

	@GetMapping("/my/{nickname}")
	public String loadMyFootprintView(Model model, @PathVariable("nickname") String nickname,
		@RequestParam(value = "pageNo", defaultValue = "1") int pageNo) {
		int footprintCount = footprintService.getFootprintCount(nickname);
		Paging paging = PagingManager.PAGING.generator(pageNo, footprintCount);

		int startBoardNo = paging.getStartBoardNo();

		List<Footprint> footprints = footprintService.getFootprints(nickname, startBoardNo);
		model.addAttribute("paging", paging);
		model.addAttribute("footprints", footprints);
		return "mypage/footprint";
	}

	@PostMapping("/register")
	@ResponseBody
	public Boolean registerFootprint(Footprint footprint) {
		return footprintService.registerFootprint(footprint);
	}
}
