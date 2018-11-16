package spiderman.wechat.domain.result;

public class TemplateMessageResult extends BaseWechatResult{
	private String msgid;

	public String getMsgid() {
		return msgid;
	}

	public void setMsgid(String msgid) {
		this.msgid = msgid;
	}
	
}
