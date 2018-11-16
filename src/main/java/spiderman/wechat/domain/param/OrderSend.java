package spiderman.wechat.domain.param;

public class OrderSend extends BaseWechatSend {
	/**
	 *  	微信分配的公众账号ID（企业号corpid即为此appId）
	 */
	protected String appid;
	/**
	 *  	微信支付分配的商户号
	 */
	protected String mch_id;
	/**
	 * 随机字符串，不长于32位。
	 */
	protected String nonce_str;
	protected String sign;
	protected String out_trade_no;
	public OrderSend() {
		super();
	}
	public String getAppid() {
		return appid;
	}
	public void setAppid(String appid) {
		this.appid = appid;
	}
	public String getMch_id() {
		return mch_id;
	}
	public void setMch_id(String mch_id) {
		this.mch_id = mch_id;
	}
	public String getNonce_str() {
		return nonce_str;
	}
	public void setNonce_str(String nonce_str) {
		this.nonce_str = nonce_str;
	}
	public String getSign() {
		return sign;
	}
	public void setSign(String sign) {
		this.sign = sign;
	}
	public String getOut_trade_no() {
		return out_trade_no;
	}
	public void setOut_trade_no(String out_trade_no) {
		this.out_trade_no = out_trade_no;
	}

}