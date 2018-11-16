package spiderman.wechat.domain.result;

/**
 * 查询群发消息发送状态
 * @author root
 *
 */
public class MassSendStatusResult extends BaseWechatResult {
	private String msg_id;
	private String msg_status;
	public String getMsg_id() {
		return msg_id;
	}
	public void setMsg_id(String msg_id) {
		this.msg_id = msg_id;
	}
	public String getMsg_status() {
		return msg_status;
	}
	public void setMsg_status(String msg_status) {
		this.msg_status = msg_status;
	}
}
