package spiderman.wechat.domain.param;

public class OrderQueryParam {
	private String appid;
	private String mch_id;
	private String transaction_id;
	private String out_trade_no;
	private String nonce_str;
	private String sign;
	private String sign_type;
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
	public String getTransaction_id() {
		return transaction_id;
	}
	public void setTransaction_id(String transaction_id) {
		this.transaction_id = transaction_id;
	}
	public String getOut_trade_no() {
		return out_trade_no;
	}
	public void setOut_trade_no(String out_trade_no) {
		this.out_trade_no = out_trade_no;
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
	public String getSign_type() {
		return sign_type;
	}
	public void setSign_type(String sign_type) {
		this.sign_type = sign_type;
	}
	public OrderQueryParam(String appid, String mch_id, String transaction_id, String out_trade_no, String nonce_str,
			String sign, String sign_type) {
		super();
		this.appid = appid;
		this.mch_id = mch_id;
		this.transaction_id = transaction_id;
		this.out_trade_no = out_trade_no;
		this.nonce_str = nonce_str;
		this.sign = sign;
		this.sign_type = sign_type;
	}
	public OrderQueryParam() {
		// TODO Auto-generated constructor stub
	}
}
