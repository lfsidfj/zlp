package spiderman.wechat.domain.param;
/**
 * 企业付款
 * @author spiderman
 * 2017年5月9日下午6:23:21
 */
public class CompanyPaySend {
	
	private String mch_appid;//微信分配的公众账号ID（企业号corpid即为此appId）
	private String mchid;//微信支付分配的商户号
	private String device_info;//微信支付分配的终端设备号
	private String nonce_str;//随机字符串，不长于32位
	private String sign;//签名
	private String partner_trade_no;// 	商户订单号，需保持唯一性(只能是字母或者数字，不能包含有符号)
	private String openid;//商户appid下，某用户的openid
	private String check_name;//NO_CHECK：不校验真实姓名,FORCE_CHECK：强校验真实姓名
	private String re_user_name;// 	收款用户真实姓名。如果check_name设置为FORCE_CHECK，则必填用户真实姓名
	private Integer amount;//企业付款金额，单位为分
	private String desc;//企业付款操作说明信息。必填。
	private String spbill_create_ip;//调用接口的机器Ip地址
	
	public String getMch_appid() {
		return mch_appid;
	}
	public void setMch_appid(String mch_appid) {
		this.mch_appid = mch_appid;
	}
	public String getMchid() {
		return mchid;
	}
	public void setMchid(String mchid) {
		this.mchid = mchid;
	}
	public String getDevice_info() {
		return device_info;
	}
	public void setDevice_info(String device_info) {
		this.device_info = device_info;
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
	public String getPartner_trade_no() {
		return partner_trade_no;
	}
	public void setPartner_trade_no(String partner_trade_no) {
		this.partner_trade_no = partner_trade_no;
	}
	public String getOpenid() {
		return openid;
	}
	public void setOpenid(String openid) {
		this.openid = openid;
	}
	public String getCheck_name() {
		return check_name;
	}
	public void setCheck_name(String check_name) {
		this.check_name = check_name;
	}
	public String getRe_user_name() {
		return re_user_name;
	}
	public void setRe_user_name(String re_user_name) {
		this.re_user_name = re_user_name;
	}
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String getSpbill_create_ip() {
		return spbill_create_ip;
	}
	public void setSpbill_create_ip(String spbill_create_ip) {
		this.spbill_create_ip = spbill_create_ip;
	}
	
}
