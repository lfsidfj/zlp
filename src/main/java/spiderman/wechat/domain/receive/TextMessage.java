package spiderman.wechat.domain.receive;
/**
 * 文本消息
 * @author spiderman
 * 2017年5月7日下午11:34:23
 */
public class TextMessage extends BaseMessage {
	
	private String Content;//文本消息内容

	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		Content = content;
	}
	
}
