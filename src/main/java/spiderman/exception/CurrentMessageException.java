package spiderman.exception;

/**
 * 用来跳转到提示信息页
 * @author admin
 *
 */
public class CurrentMessageException extends BaseException implements MessageExceptionInterface{
	private static final long serialVersionUID = -1711576264345218542L;
	private Message msg;
	public CurrentMessageException() {
	}

	public CurrentMessageException(Message msg) {
		this.msg = msg;
	}

	@Override
	public String getMessage() {
		if (msg != null) {
			return msg.getMessage();
		}
		return super.getMessage();
	}

	public CurrentMessageException(String message, Throwable cause,
			boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public CurrentMessageException(String message, Throwable cause) {
		super(message, cause);
	}

	public CurrentMessageException(String message) {
		super(message);
	}
	public CurrentMessageException(Throwable cause) {
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
