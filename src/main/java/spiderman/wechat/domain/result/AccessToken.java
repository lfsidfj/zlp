package spiderman.wechat.domain.result;


public class AccessToken extends BaseWechatResult{
	private String access_token;
	/**
	 * 上一次获取access_token的时间
	 */
	private long access_token_getTime;
	/**
	 * 凭证有效时间，单位：秒 
	 */
	private int expires_in = 0;

	public AccessToken(String access_token, long access_token_getTime,int expires_in) {
		this.access_token = access_token;
		this.access_token_getTime = access_token_getTime;
		this.expires_in = expires_in;
	}
	public AccessToken() {
	}
	public String getAccess_token() {
		return access_token;
	}
	public void setAccess_token(String access_token) {
		this.access_token = access_token;
	}
	public long getAccess_token_getTime() {
		return access_token_getTime;
	}
	public void setAccess_token_getTime(long access_token_getTime) {
		this.access_token_getTime = access_token_getTime;
	}
	public int getExpires_in() {
		return expires_in;
	}
	public void setExpires_in(int expires_in) {
		this.expires_in = expires_in;
	}
	
}