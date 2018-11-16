package spiderman.exception.runtime.system;

import spiderman.exception.runtime.BaseRuntimeException;

public class NoPowerException extends BaseRuntimeException {
	private static final long serialVersionUID = -9067656750101330806L;

	public NoPowerException() {
		super();
	}

	public NoPowerException(String message, Throwable cause,
			boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public NoPowerException(String message, Throwable cause) {
		super(message, cause);
	}

	public NoPowerException(String message) {
		super(message);
	}

	public NoPowerException(Throwable cause) {
		super(cause);
	}
}
