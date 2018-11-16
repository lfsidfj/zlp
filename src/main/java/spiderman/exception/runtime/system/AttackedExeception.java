package spiderman.exception.runtime.system;

import spiderman.exception.runtime.BaseRuntimeException;

public class AttackedExeception extends BaseRuntimeException {
	private static final long serialVersionUID = -9067656750101330806L;

	public AttackedExeception() {
		super();
	}

	public AttackedExeception(String message, Throwable cause,
			boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public AttackedExeception(String message, Throwable cause) {
		super(message, cause);
	}

	public AttackedExeception(String message) {
		super(message);
	}

	public AttackedExeception(Throwable cause) {
		super(cause);
	}
}
