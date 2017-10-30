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
import com.nts.cozy.service.ReplyService;
import com.nts.cozy.vo.Paging;
import com.nts.cozy.vo.Reply;

/**
 * @author 박정재
 */
@Controller
@RequestMapping("/reply")
public class ReplyController {

	@Autowired
	ReplyService replyService;

	@GetMapping("/all/{storeId}")
	public String loadReplyView(Model model, @RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
		@PathVariable("storeId") int storeId) {
		int replyCount = replyService.getReplyCountByStoreId(storeId);
		Paging paging = PagingManager.PAGING.generator(pageNo, replyCount);

		int startBoardNo = paging.getStartBoardNo();

		List<Reply> replies = replyService.getSomeReplyByStorePage(storeId, startBoardNo);
		model.addAttribute("paging", paging);
		model.addAttribute("replies", replies);

		return "/store/reply";
	}

	@GetMapping("/my/{nickname}")
	public String loadMyReplyView(Model model, @PathVariable("nickname") String nickname,
		@RequestParam(value = "pageNo", defaultValue = "1") int pageNo) {
		int replyCount = replyService.getReplyCountByNickname(nickname);
		Paging paging = PagingManager.PAGING.generator(pageNo, replyCount);

		int startBoardNo = paging.getStartBoardNo();

		List<Reply> replies = replyService.getSomeReplyByNicknamePage(nickname, startBoardNo);
		model.addAttribute("paging", paging);
		model.addAttribute("replies", replies);
		return "mypage/reply";
	}

	@GetMapping("/json")
	@ResponseBody
	public List<Reply> getReplies() {
		return replyService.getReplies();
	}

	@GetMapping("/json/store/{storeId}")
	@ResponseBody
	public List<Reply> getSomeReplyByStore(@PathVariable("storeId") int storeId) {
		return replyService.getSomeReplyByStoreId(storeId);
	}

	@PostMapping("/register")
	@ResponseBody
	public Boolean registerReply(Reply reply) {
		return replyService.registerReply(reply);
	}

	@PostMapping("/remove/{replyId}")
	@ResponseBody
	public Boolean removeReply(@PathVariable("replyId") int id) {
		return replyService.removeReply(id);
	}
}
