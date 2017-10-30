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
import com.nts.cozy.service.ReportService;
import com.nts.cozy.vo.Paging;
import com.nts.cozy.vo.Reply;
import com.nts.cozy.vo.Report;
import com.nts.cozy.vo.Store;

/**
 * @author 박정재_신창환
 */
@Controller
@RequestMapping("/report")
public class ReportController {

	@Autowired
	ReportService reportService;

	/**
	 * @author 신창환
	 */
	@GetMapping("/list/admin")
	public String loadReportView(Model model, @RequestParam(value = "pageNo", defaultValue = "1") int pageNo) {
		int reportTotalCount = reportService.getReportTotalCount();

		Paging paging = PagingManager.PAGING.generator(pageNo, reportTotalCount);
		List<Report> reports = reportService.getReports(paging.getStartBoardNo());

		model.addAttribute("paging", paging);
		model.addAttribute("reports", reports);

		return "/report/list";
	}

	/**
	 * @author 박정재
	 */
	@GetMapping("/popup")
	public String reportPopup(Model model, Report report, @RequestParam("writer") String writer) {
		model.addAttribute("writer", writer);
		model.addAttribute("report", report);
		return "/popup/report";
	}

	/**
	 * @author 신창환
	 */
	@GetMapping("/detail/store/{reportId}/{storeId}/{registeredDate}")
	public String loadReportedStoreView(Model model, @PathVariable("reportId") int reportId,
		@PathVariable("storeId") int storeId, @PathVariable("registeredDate") String date) {

		Store storeLog = reportService.getReportedStore(storeId, date);
		model.addAttribute("reportId", reportId);
		model.addAttribute("storeLog", storeLog);

		return "/popup/storeLog";
	}

	/**
	 * @author 신창환
	 */
	@GetMapping("/detail/reply/{reportId}/{replyId}")
	public String loadReportedReplyView(Model model, @PathVariable("reportId") int reportId,
		@PathVariable("replyId") int replyId) {

		Reply reply = reportService.getReportedReply(replyId);
		model.addAttribute("reportId", reportId);
		model.addAttribute("reply", reply);

		return "/popup/reply";
	}

	/**
	 * @author 박정재
	 */
	@PostMapping("/register")
	@ResponseBody
	public Boolean registerReport(Report report) {
		return reportService.registerReport(report);
	}

	/**
	 * @author 박정재
	 */
	@PostMapping("/remove/{reportId}")
	@ResponseBody
	public Boolean removeReport(@PathVariable("reportId") int id) {
		return reportService.removeReport(id);
	}
}
