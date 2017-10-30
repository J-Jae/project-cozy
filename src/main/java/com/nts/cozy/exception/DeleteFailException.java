package com.nts.cozy.exception;

/**
 * @author project_박정재_신창환
 *
 */
public class DeleteFailException extends RuntimeException {

	private static final long serialVersionUID = 1L;

	public DeleteFailException() {}

	public DeleteFailException(String message) {
		super(message);
	}

}
