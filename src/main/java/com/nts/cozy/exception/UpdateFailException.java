package com.nts.cozy.exception;

/**
 * @author project_박정재_신창환
 *
 */
public class UpdateFailException extends RuntimeException {

	private static final long serialVersionUID = 2L;

	public UpdateFailException() {}

	public UpdateFailException(String message) {
		super(message);
	}

}
