package spiderman.wechat.domain.result;

public class QrcodeResult extends BaseWechatResult {
	private String ticket;
	private Integer expire_seconds;
	private String url;

	public void setTicket(String ticket) {
		this.ticket = ticket;
	}

	public String getTicket() {
		return this.ticket;
	}

	public void setExpire_seconds(Integer expire_seconds) {
		this.expire_seconds = expire_seconds;
	}

	public Integer getExpire_seconds() {
		return this.expire_seconds;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getUrl() {
		return this.url;
	}

}
