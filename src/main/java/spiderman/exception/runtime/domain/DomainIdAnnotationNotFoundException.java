package spiderman.exception.runtime.domain;

import spiderman.exception.runtime.BaseRuntimeException;

public class DomainIdAnnotationNotFoundException extends BaseRuntimeException {
	private static final long serialVersionUID = -2488231354058888858L;
	public DomainIdAnnotationNotFoundException() {
		super();
	}

	public DomainIdAnnotationNotFoundException(String message, Throwable cause,
			boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public DomainIdAnnotationNotFoundException(String message, Throwable cause) {
		super(message, cause);
	}

	public DomainIdAnnotationNotFoundException(String message) {
		super(message);
	}

	public DomainIdAnnotationNotFoundException(Throwable cause) {
		super(cause);
	}
}
