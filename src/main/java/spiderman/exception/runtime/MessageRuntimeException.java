package spiderman.exception.runtime;

import spiderman.exception.Message;
import spiderman.exception.MessageExceptionInterface;

public class MessageRuntimeException extends BaseRuntimeException implements MessageExceptionInterface{
	private static final long serialVersionUID = -4230494067186876199L;
	private Message msg;
	public MessageRuntimeException() {
		
	}

	public MessageRuntimeException(Message msg) {
		this.msg = msg;
	}
	@Override
	public String getMessage() {
		if (msg != null) {
			return msg.getMessage();
		}
		return super.getMessage();
	}

	public MessageRuntimeException(String message, Throwable cause,
			boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public MessageRuntimeException(String message, Throwable cause) {
		super(message, cause);
	}

	public MessageRuntimeException(String message) {
		super(message);
	}
	public MessageRuntimeException(Throwable cause) {
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
