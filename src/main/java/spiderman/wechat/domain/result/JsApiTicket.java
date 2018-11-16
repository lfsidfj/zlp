package spiderman.wechat.domain.result;

public class JsApiTicket extends BaseWechatResult {
	private String ticket;
	/**
	 * 上一次获取ticket的时间
	 */
	private long ticket_getTime;
	/**
	 * 凭证有效时间，单位：秒
	 */
	private int expires_in = 0;
	public JsApiTicket(String ticket, long ticket_getTime, int expires_in) {
		super();
		this.ticket = ticket;
		this.ticket_getTime = ticket_getTime;
		this.expires_in = expires_in;
	}
	public JsApiTicket() {
	}
	public String getTicket() {
		return ticket;
	}
	public void setTicket(String ticket) {
		this.ticket = ticket;
	}
	public long getTicket_getTime() {
		return ticket_getTime;
	}
	public void setTicket_getTime(long ticket_getTime) {
		this.ticket_getTime = ticket_getTime;
	}
	public int getExpires_in() {
		return expires_in;
	}
	public void setExpires_in(int expires_in) {
		this.expires_in = expires_in;
	}

}
