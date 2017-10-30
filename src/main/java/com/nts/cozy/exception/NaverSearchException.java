package com.nts.cozy.exception;

/**
 * @author project_박정재_신창환
 *
 */
public class NaverSearchException extends RuntimeException {

	private static final long serialVersionUID = 3L;

	public NaverSearchException() {}

	public NaverSearchException(String message) {
		super(message);
	}

}
