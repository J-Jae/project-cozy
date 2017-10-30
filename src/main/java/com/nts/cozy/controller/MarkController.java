package com.nts.cozy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nts.cozy.service.MarkService;
import com.nts.cozy.vo.Mark;

/**
 * @author 박정재
 */
@Controller
@RequestMapping("/mark")
public class MarkController {

	@Autowired
	MarkService markService;

	@GetMapping("/state")
	@ResponseBody
	public Mark getMark(Mark mark) {
		return markService.getMark(mark);
	}

	@GetMapping("/user")
	@ResponseBody
	public List<Mark> getMarkByNickname(@RequestParam("nickname") String nickname) {
		return markService.getMarkByNickname(nickname);
	}

	@GetMapping("/avg")
	@ResponseBody
	public Double getAvgByStoreId(@RequestParam("storeId") int id) {
		return markService.getAvgByStoreId(id);
	}

	@PostMapping("/register")
	@ResponseBody
	public Boolean registerMark(Mark mark) {
		return markService.registerMark(mark);
	}

	@PostMapping("/modify")
	@ResponseBody
	public Boolean modifyMark(Mark mark) {
		return markService.modifyMark(mark);
	}

	@PostMapping("/remove")
	@ResponseBody
	public Boolean removeMark(Mark mark) {
		return markService.removeMark(mark);
	}

}
