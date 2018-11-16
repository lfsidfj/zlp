package spiderman.exception;


public class BaseException extends Exception{
	private static final long serialVersionUID = 6833765265336009935L;
	public BaseException() {
		super();
	}

	public BaseException(String message, Throwable cause,
			boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public BaseException(String message, Throwable cause) {
		super(message, cause);
	}

	public BaseException(String message) {
		super(message);
	}

	public BaseException(Throwable cause) {
		super(cause);
	}
}
