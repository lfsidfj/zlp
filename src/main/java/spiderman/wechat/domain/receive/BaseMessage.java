package spiderman.wechat.domain.receive;
/**
 * 消息基类（普通用户 -> 公众帐号） 
 * @author spiderman
 * 2017年5月7日下午11:32:41
 */
public class BaseMessage {
	
	private String ToUserName;//开发者微信号
	private String FromUserName;//发送方帐号（一个OpenID）
	private Long CreateTime;//消息创建时间 （整型）
	private String MsgType;//信息类型
	private String MsgId;//消息id，64位整型
	public String getToUserName() {
		return ToUserName;
	}
	public void setToUserName(String toUserName) {
		ToUserName = toUserName;
	}
	public String getFromUserName() {
		return FromUserName;
	}
	public void setFromUserName(String fromUserName) {
		FromUserName = fromUserName;
	}
	public Long getCreateTime() {
		return CreateTime;
	}
	public void setCreateTime(Long createTime) {
		CreateTime = createTime;
	}
	public String getMsgType() {
		return MsgType;
	}
	public void setMsgType(String msgType) {
		MsgType = msgType;
	}
	public String getMsgId() {
		return MsgId;
	}
	public void setMsgId(String msgId) {
		MsgId = msgId;
	}
	
}
