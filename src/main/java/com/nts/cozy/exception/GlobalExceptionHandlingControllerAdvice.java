package com.nts.cozy.exception;

import java.io.IOException;
import java.sql.SQLException;

import org.apache.commons.fileupload.FileUploadBase.FileSizeLimitExceededException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * @author project_박정재_신창환
 *
 */
@ControllerAdvice
public class GlobalExceptionHandlingControllerAdvice {

	protected Logger logger;

	public GlobalExceptionHandlingControllerAdvice() {
		logger = LoggerFactory.getLogger(getClass());
	}

	public void writerExceptionLogger(Exception exception) {
		logger.error("Exception Name: " + exception.getClass().getSimpleName());
		logger.error("Exception Message: " + exception.getMessage());
		
		exception.printStackTrace();
	}

	@ExceptionHandler({DeleteFailException.class})
	public String handleDeleteFailException(Model model,Exception exception) {
		writerExceptionLogger(exception);

		model.addAttribute("errorName", exception.getClass().getSimpleName());
		model.addAttribute("errorMessage", "해당 정보를 삭제하는데 실패했습니다. 이미 삭제된 내용일 수 있으니 다시 확인해주세요.");
		return "error/serviceFail";
	}

	@ExceptionHandler({UpdateFailException.class})
	public String handleUpdateFailException(Model model,Exception exception) {
		writerExceptionLogger(exception);

		model.addAttribute("errorName", exception.getClass().getSimpleName());
		model.addAttribute("errorMessage", "해당 정보를 업데이트하는데 실패했습니다. 다시 확인해주세요.");
		return "error/serviceFail";
	}

	@ExceptionHandler({NaverSearchException.class})
	@ResponseBody
	public String handleNaverSearchException(Model model, Exception exception) {
		writerExceptionLogger(exception);
		
		model.addAttribute("errorName", exception.getClass().getSimpleName());
		model.addAttribute("errorMessage", "네이버 지역 검색 API에 문제가 발생했습니다. 다시 시도해주세요.");
		return "error/serviceFail";
	}

	@ExceptionHandler({IllegalStateException.class, IOException.class})
	public String handleFileException(Model model, Exception exception) {
		writerExceptionLogger(exception);

		model.addAttribute("errorName", exception.getClass().getSimpleName());
		model.addAttribute("errorMessage", "파일 입출력에 에러가 발생했습니다. 다시 시도해주세요.");
		return "error/serviceFail";
	}

	@ExceptionHandler({FileSizeLimitExceededException.class})
	public String handleFileSizeException(Model model, Exception exception) {
		writerExceptionLogger(exception);
		
		model.addAttribute("errorName", exception.getClass().getSimpleName());
		model.addAttribute("errorMessage", "파일의 최대 크기는 5MB 입니다. 확인 후 업로드해주세요.");
		return "error/serviceFail";
	}
	
	@ExceptionHandler({SQLException.class, DataAccessException.class})
	public String handleDatabaseException(Model model, Exception exception) {
		writerExceptionLogger(exception);

		model.addAttribute("errorName", exception.getClass().getSimpleName());
		model.addAttribute("errorMessage", "데이터베이스 오류가 발생했습니다. 잠시 후 다시 시도해주세요.");
		return "error/serviceFail";
	}

	@ExceptionHandler(Exception.class)
	public String handleExceptionException(Model model, Exception exception) {
		writerExceptionLogger(exception);
		
		model.addAttribute("errorName", exception.getClass().getSimpleName());
		model.addAttribute("errorMessage", "알 수 없는 오류가 발생했습니다. 관리자에게 문의해주세요.");
		return "error/serviceFail";
	}

}
