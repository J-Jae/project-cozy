package com.nts.cozy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nts.cozy.dao.ReplyDao;
import com.nts.cozy.dao.ReportDao;
import com.nts.cozy.dao.StoreLogDao;
import com.nts.cozy.vo.Reply;
import com.nts.cozy.vo.Report;
import com.nts.cozy.vo.Store;

/**
 * @author 박정재
 *
 */
@Service
public class ReportService {

	@Autowired
	ReportDao reportDao;
	
	@Autowired
	StoreLogDao storeLogDao;
	
	@Autowired
	ReplyDao replyDao;

	public List<Report> getReports(int startReportNo) {
		return reportDao.selectReports(startReportNo);
	}
	
	public Store getReportedStore(int storeId, String registeredDate) {
		Store reportedStore = new Store();
		reportedStore.setStoreId(storeId);
		reportedStore.setRegisteredDate(registeredDate);
		
		return storeLogDao.selectStoreLogByDate(reportedStore);
	}
	
	public Reply getReportedReply(int replyId) {
		return replyDao.selectReply(replyId);
	}
	
	public int getReportTotalCount() {
		return reportDao.selectReportTotalCount();
	}

	public boolean registerReport(Report report) {
		return reportDao.insertReport(report);
	}

	public boolean removeReport(int id) {
		return reportDao.deleteReport(id);
	}

}
