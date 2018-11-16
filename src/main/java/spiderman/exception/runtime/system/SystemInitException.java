package spiderman.exception.runtime.system;

import spiderman.exception.runtime.BaseRuntimeException;

public class SystemInitException extends BaseRuntimeException {
	private static final long serialVersionUID = -9067656750101330806L;

	public SystemInitException() {
		super();
	}

	public SystemInitException(String message, Throwable cause,
			boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public SystemInitException(String message, Throwable cause) {
		super(message, cause);
	}

	public SystemInitException(String message) {
		super(message);
	}

	public SystemInitException(Throwable cause) {
		super(cause);
	}
}
