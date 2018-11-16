package spiderman.exception;

/**
 * 校验异常，数据不合法时抛出
 * @author 战马
 *
 */
public class ValidateException extends BaseException implements MessageExceptionInterface{
	private static final long serialVersionUID = -1711576264345218542L;
	private Message msg;
	public ValidateException() {
	}

	public ValidateException(Message msg) {
		this.msg = msg;
	}

	@Override
	public String getMessage() {
		if (msg != null) {
			return msg.getMessage();
		}
		return super.getMessage();
	}

	public ValidateException(String message, Throwable cause,
			boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public ValidateException(String message, Throwable cause) {
		super(message, cause);
	}

	public ValidateException(String message) {
		super(message);
	}
	public ValidateException(Throwable cause) {
		super(cause);
	}
	@Override
	public Message getMsg() {
		return msg;
	}
	@Override
	public void setMsg(Message msg) {
		this.msg = msg;
	}

}
