package spiderman.wechat.domain.send;

public class TextMessage extends BaseMessage {
	
	private String Content;//文本消息内容

	public TextMessage() {
		super();
		setMsgType("text");
		// TODO Auto-generated constructor stub
	}

	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		Content = content;
	}
	
}
