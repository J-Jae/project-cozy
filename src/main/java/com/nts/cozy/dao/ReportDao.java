package com.nts.cozy.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.nts.cozy.vo.Report;

/**
 * @author 박정재_신창환
 *
 */
@Repository
public interface ReportDao {
	
	List<Report> selectReports(int startReportNo);

	int selectReportTotalCount();
	
	boolean insertReport(Report report);

	boolean deleteReport(int id);

}
