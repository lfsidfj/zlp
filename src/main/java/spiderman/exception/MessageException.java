package spiderman.exception;

/**
 * 用来跳转到提示信息页
 * @author admin
 *
 */
public class MessageException extends BaseException implements MessageExceptionInterface{
	private static final long serialVersionUID = -1711576264345218542L;
	private Message msg;
	public MessageException() {
	}

	public MessageException(Message msg) {
		this.msg = msg;
	}

	@Override
	public String getMessage() {
		if (msg != null) {
			return msg.getMessage();
		}
		return super.getMessage();
	}

	public MessageException(String message, Throwable cause,
			boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public MessageException(String message, Throwable cause) {
		super(message, cause);
	}

	public MessageException(String message) {
		super(message);
	}
	public MessageException(Throwable cause) {
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
