package spiderman.exception.runtime.system;

import spiderman.exception.runtime.BaseRuntimeException;

public class FrameworkException extends BaseRuntimeException {
	private static final long serialVersionUID = -9067656750101330806L;

	public FrameworkException() {
		super();
	}

	public FrameworkException(String message, Throwable cause,
			boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public FrameworkException(String message, Throwable cause) {
		super(message, cause);
	}

	public FrameworkException(String message) {
		super(message);
	}

	public FrameworkException(Throwable cause) {
		super(cause);
	}
}
