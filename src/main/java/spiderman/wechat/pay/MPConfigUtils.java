package spiderman.wechat.pay;

public class MPConfigUtils {
	
	public static String APPID = "wxd225550ca5fc04db";
	
	public static String APPSECRET = "680990ae9ba761ffa09fd93f55cc3c61";
	
	public static String MCH_ID = "1254635501"; //商户号
	
	public static String API_KEY = "87F6C49ACBC3F8F253633014208F7756"; //API密钥
	
	public static String CERT_PATH = "D://apiclient_cert.p12"; //请求证书绝对地址
	
	//网页授权地址
	public static String OAUTH2_URL = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code";
	
	//获取code的URL
	public static String GETCODEURL = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=APPID&redirect_uri=REDIRECT_URI&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect";
	
	//微信访问我们系统重定向的系统地址--用于支付
	public static String REDIRECT_URI = "http://demo.app88.cn/weixinPay/topayServlet";
	
	//微信访问我们系统重定向的系统地址--用于获取提现
	public static String REDIRECT_URI_CASH = "http://demo.app88.cn/weixinPay/applyCash";
	
	// notify_url是 支付完成后微信发给该链接信息，可以判断会员是否支付成功，改变订单状态等。
	public static String NOTIFY_URL = "http://demo.app88.cn/weixinPay/callback/wx/receiveMoney.act";
	
	public static String UNIFIED_ORDER_URL = "https://api.mch.weixin.qq.com/pay/unifiedorder"; //统一下单地址
	
	//企业付款的URL
	public static String TRANSFERS_URL = "https://api.mch.weixin.qq.com/mmpaymkttransfers/promotion/transfers";
	
}
