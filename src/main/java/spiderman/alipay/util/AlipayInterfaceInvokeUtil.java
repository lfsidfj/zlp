package spiderman.alipay.util;

import java.util.HashMap;
import java.util.Map;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.domain.AlipayDataDataserviceBillDownloadurlQueryModel;
import com.alipay.api.domain.AlipayTradeAppPayModel;
import com.alipay.api.domain.AlipayTradeCloseModel;
import com.alipay.api.domain.AlipayTradeFastpayRefundQueryModel;
import com.alipay.api.domain.AlipayTradeQueryModel;
import com.alipay.api.domain.AlipayTradeRefundModel;
import com.alipay.api.domain.AlipayTradeWapPayModel;
import com.alipay.api.request.AlipayDataDataserviceBillDownloadurlQueryRequest;
import com.alipay.api.request.AlipayFundTransToaccountTransferRequest;
import com.alipay.api.request.AlipayTradeAppPayRequest;
import com.alipay.api.request.AlipayTradeCloseRequest;
import com.alipay.api.request.AlipayTradeFastpayRefundQueryRequest;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.alipay.api.request.AlipayTradeQueryRequest;
import com.alipay.api.request.AlipayTradeRefundRequest;
import com.alipay.api.request.AlipayTradeWapPayRequest;
import com.alipay.api.response.AlipayDataDataserviceBillDownloadurlQueryResponse;
import com.alipay.api.response.AlipayFundTransToaccountTransferResponse;
import com.alipay.api.response.AlipayTradeAppPayResponse;
import com.alipay.api.response.AlipayTradeCloseResponse;
import com.alipay.api.response.AlipayTradeFastpayRefundQueryResponse;
import com.alipay.api.response.AlipayTradeQueryResponse;
import com.alipay.api.response.AlipayTradeRefundResponse;

import spiderman.alipay.config.AlipayConfig;
import spiderman.util.base.BaseUtil;

public class AlipayInterfaceInvokeUtil {

	/**
	 * 单笔转账到支付宝账户
	 * @param out_biz_no    商户转账唯一订单号
	 * @param payee_type 	收款方账户类型。可取值：1、ALIPAY_USERID：支付宝账号对应的支付宝唯一用户号。以2088开头的16位纯数字组成。2、ALIPAY_LOGONID：支付宝登录号，支持邮箱和手机号格式。
	 * @param payee_account    收款方账户
	 * @param amount    转账金额，单位：元。只支持2位小数，小数点前最大支持13位，金额必须大于等于0.1元。
	 * @param payer_show_name    付款方显示姓名
	 * @param payee_real_name   收款方真实姓名
	 * @param remark    转账备注
	 * @return 是否转账成功
	 * @throws AlipayApiException
	 */
	public static boolean AlipayFundTransToaccountTransfer(
			String out_biz_no,String payee_type,
			String payee_account,String amount,
			String payer_show_name,String payee_real_name,
			String remark) throws AlipayApiException{
		AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.URL, AlipayConfig.APPID, AlipayConfig.RSA_PRIVATE_KEY,
				AlipayConfig.FORMAT, AlipayConfig.CHARSET, AlipayConfig.ALIPAY_PUBLIC_KEY, AlipayConfig.SIGNTYPE);

		AlipayFundTransToaccountTransferRequest request = new AlipayFundTransToaccountTransferRequest();
		Map<String,String> content=new HashMap<String,String>();
		content.put("out_biz_no", out_biz_no);
		content.put("payee_type", payee_type);
		content.put("payee_account", payee_account);
		content.put("amount", amount);
		content.put("payer_show_name", payer_show_name);
		content.put("payee_real_name", payee_real_name);
		content.put("remark", remark);
		request.setBizContent(BaseUtil.getJson(content));
		/*request.setBizContent("{" +
		"    \"out_biz_no\":\"3142321423432\"," +
		"    \"payee_type\":\"ALIPAY_LOGONID\"," +
		"    \"payee_account\":\"qextwe6370@sandbox.com\"," +
		"    \"amount\":\"12.23\"," +
		"    \"payer_show_name\":\"上海交通卡退款\"," +
		"    \"payee_real_name\":\"沙箱环境\"," +
		"    \"remark\":\"转账备注\"," +
		"  }");*/
		AlipayFundTransToaccountTransferResponse response = alipayClient.execute(request);
		if(response.isSuccess()){
		System.out.println("调用成功");
		} else {
		System.out.println("调用失败");
		}
		return response.isSuccess();
	}
	/**
	 * 生成APP支付订单信息
	 * @param body 对一笔交易的具体描述信息。如果是多种商品，请将商品描述字符串累加传给body。
	 * @param subject 商品的标题/交易标题/订单标题/订单关键字等。
	 * @param outtradeno 商户网站唯一订单号
	 * @param totalAmount 订单总金额，单位为元，精确到小数点后两位，取值范围[0.01,100000000]
	 * @return APP支付所需要参数
	 */
	public static String AlipayTradeAppPay(String body,String subject,String outtradeno,String totalAmount){
		//实例化客户端
		AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.URL, AlipayConfig.APPID, AlipayConfig.RSA_PRIVATE_KEY, "json", AlipayConfig.CHARSET, AlipayConfig.ALIPAY_PUBLIC_KEY, AlipayConfig.SIGNTYPE);
		//实例化具体API对应的request类,类名称和接口名称对应,当前调用接口名称：alipay.trade.app.pay
		AlipayTradeAppPayRequest request = new AlipayTradeAppPayRequest();
		//SDK已经封装掉了公共参数，这里只需要传入业务参数。以下方法为sdk的model入参方式(model和biz_content同时存在的情况下取biz_content)。
		AlipayTradeAppPayModel model = new AlipayTradeAppPayModel();
		model.setBody(body);
		model.setSubject(subject);
		model.setOutTradeNo(outtradeno);
		model.setTimeoutExpress("30m");
		model.setTotalAmount(totalAmount);
		model.setProductCode("QUICK_MSECURITY_PAY");
		request.setBizModel(model);
		request.setNotifyUrl(AlipayConfig.notify_url);
		try {
		        //这里和普通的接口调用不同，使用的是sdkExecute
		        AlipayTradeAppPayResponse response = alipayClient.sdkExecute(request);
		        System.out.println(response.getBody());//就是orderString 可以直接给客户端请求，无需再做处理。
		        return response.getBody();
		    } catch (AlipayApiException e) {
		        e.printStackTrace();
				return null;
		}
	}
	/**
	 * 返回电脑网站支付表单
	 * @param out_trade_no 商户订单号
	 * @param total_amount 订单总金额，单位为元，精确到小数点后两位，取值范围[0.01,100000000]
	 * @param subject 订单标题
	 * @param body 订单描述
	 * @return	电脑网页支付表单
	 */
	public static String AlipayTradePagePay(String out_trade_no,String total_amount,String subject,String body){
		AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.URL, AlipayConfig.APPID, AlipayConfig.RSA_PRIVATE_KEY, AlipayConfig.FORMAT, AlipayConfig.CHARSET, AlipayConfig.ALIPAY_PUBLIC_KEY, AlipayConfig.SIGNTYPE); //获得初始化的AlipayClient
	    AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();//创建API对应的request
	    alipayRequest.setReturnUrl(AlipayConfig.return_url);
	    alipayRequest.setNotifyUrl(AlipayConfig.notify_url);//在公共参数中设置回跳和通知地址
	    Map<String,String> content=new HashMap<String,String>();
	    content.put("out_trade_no", out_trade_no);
	    content.put("product_code", "FAST_INSTANT_TRADE_PAY");
	    content.put("total_amount", total_amount);
	    content.put("subject", subject);
	    content.put("body", body);
	    String bizContent=BaseUtil.getJson(content);
	    alipayRequest.setBizContent(bizContent);
	    /*alipayRequest.setBizContent("{" +
	        "    \"out_trade_no\":\"20150320010101004\"," +
	        "    \"product_code\":\"FAST_INSTANT_TRADE_PAY\"," +
	        "    \"total_amount\":88.88," +
	        "    \"subject\":\"Iphone6 16G\"," +
	        "    \"body\":\"Iphone6 16G\"," +
	        "    \"passback_params\":\"merchantBizType%3d3C%26merchantBizNo%3d2016010101111\"," +
	        "    \"extend_params\":{" +
	        "    \"sys_service_provider_id\":\"2088511833207846\"" +
	        "    }"+
	        "  }");*///填充业务参数
	    String form="";
	    try {
	        form = alipayClient.pageExecute(alipayRequest).getBody(); //调用SDK生成表单
	    } catch (AlipayApiException e) {
	        e.printStackTrace();
	    }
	    return form;
	}
	/**
	 *
	 * @param out_trade_no	商户订单号，商户网站订单系统中唯一订单号，必填
	 * @param subject	订单名称，必填
	 * @param total_amount	订单总金额，单位为元，精确到小数点后两位，取值范围[0.01,100000000]，必填
	 * @param body	商品描述，可空
	 * @return	手机支付网页表单
	 */
	public static String AlipayTradeWapPay(String out_trade_no,String subject,String total_amount,String body){

	    // 超时时间 可空
	   String timeout_express="2m";
	    // 销售产品码 必填
	    String product_code="QUICK_WAP_PAY";
	    /**********************/
	    // SDK 公共请求类，包含公共请求参数，以及封装了签名与验签，开发者无需关注签名与验签
	    //调用RSA签名方式
	    AlipayClient client = new DefaultAlipayClient(AlipayConfig.URL, AlipayConfig.APPID, AlipayConfig.RSA_PRIVATE_KEY, AlipayConfig.FORMAT, AlipayConfig.CHARSET, AlipayConfig.ALIPAY_PUBLIC_KEY,AlipayConfig.SIGNTYPE);
	    AlipayTradeWapPayRequest alipay_request=new AlipayTradeWapPayRequest();

	    // 封装请求支付信息
	    AlipayTradeWapPayModel model=new AlipayTradeWapPayModel();
	    model.setOutTradeNo(out_trade_no);
	    model.setSubject(subject);
	    model.setTotalAmount(total_amount);
	    model.setBody(body);
	    model.setTimeoutExpress(timeout_express);
	    model.setProductCode(product_code);
	    alipay_request.setBizModel(model);
	    // 设置异步通知地址
	    alipay_request.setNotifyUrl(AlipayConfig.notify_url);
	    // 设置同步地址
	    alipay_request.setReturnUrl(AlipayConfig.return_url);

	    // form表单生产
	    String form = "";
		try {
			// 调用SDK生成表单
			form = client.pageExecute(alipay_request).getBody();
		} catch (AlipayApiException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return form;
	}
	/**
	 * 统一收单线下交易查询
	 * @param out_trade_no	商户订单号，商户网站订单系统中唯一订单号，必填
	 * @param trade_no	支付宝交易号
	 * @return
	 * @throws AlipayApiException
	 */
	public static String AlipayTradeWapPay(String out_trade_no,String trade_no) throws AlipayApiException{
		/// SDK 公共请求类，包含公共请求参数，以及封装了签名与验签，开发者无需关注签名与验签
		AlipayClient client = new DefaultAlipayClient(AlipayConfig.URL, AlipayConfig.APPID, AlipayConfig.RSA_PRIVATE_KEY, AlipayConfig.FORMAT, AlipayConfig.CHARSET, AlipayConfig.ALIPAY_PUBLIC_KEY,AlipayConfig.SIGNTYPE);
		 AlipayTradeQueryRequest alipay_request = new AlipayTradeQueryRequest();

		 AlipayTradeQueryModel model=new AlipayTradeQueryModel();
	     model.setOutTradeNo(out_trade_no);
	     model.setTradeNo(trade_no);
	     alipay_request.setBizModel(model);

	     AlipayTradeQueryResponse alipay_response =client.execute(alipay_request);
	     return alipay_response.getBody();
	}
	/**
	 * 统一收单交易关闭接口
	 * @param out_trade_no	商户订单号，和支付宝交易号二选一(商户订单号和支付宝交易号不能同时为空。 trade_no、  out_trade_no如果同时存在优先取trade_no)
	 * @param trade_no	支付宝交易号，和商户订单号二选一
	 * @return
	 * @throws AlipayApiException
	 */
	public static String AlipayTradeClose(String out_trade_no,String trade_no) throws AlipayApiException{
		/**********************/
		// SDK 公共请求类，包含公共请求参数，以及封装了签名与验签，开发者无需关注签名与验签
		 AlipayClient client = new DefaultAlipayClient(AlipayConfig.URL, AlipayConfig.APPID, AlipayConfig.RSA_PRIVATE_KEY, AlipayConfig.FORMAT, AlipayConfig.CHARSET, AlipayConfig.ALIPAY_PUBLIC_KEY,AlipayConfig.SIGNTYPE);
		 AlipayTradeCloseRequest alipay_request=new AlipayTradeCloseRequest();

		 AlipayTradeCloseModel model =new AlipayTradeCloseModel();
		 model.setOutTradeNo(out_trade_no);
		 model.setTradeNo(trade_no);
		 alipay_request.setBizModel(model);

		 AlipayTradeCloseResponse alipay_response=client.execute(alipay_request);
		 return alipay_response.getBody();
	}
	/**
	 * 统一收单交易退款接口
	 * @param out_trade_no	商户订单号，和支付宝交易号二选一(商户订单号和支付宝交易号不能同时为空。 trade_no、  out_trade_no如果同时存在优先取trade_no)
	 * @param trade_no	支付宝交易号，和商户订单号二选一
	 * @param refund_amount	退款金额，不能大于订单总金额
	 * @param refund_reason	退款的原因说明
	 * @param out_request_no	标识一次退款请求，同一笔交易多次退款需要保证唯一，如需部分退款，则此参数必传。
	 * @return
	 * @throws AlipayApiException
	 */
	public static String AlipayTradeRefund(String out_trade_no,String trade_no,String refund_amount,String refund_reason,String  out_request_no) throws AlipayApiException{
		/**********************/
		// SDK 公共请求类，包含公共请求参数，以及封装了签名与验签，开发者无需关注签名与验签
		 AlipayClient client = new DefaultAlipayClient(AlipayConfig.URL, AlipayConfig.APPID, AlipayConfig.RSA_PRIVATE_KEY, AlipayConfig.FORMAT, AlipayConfig.CHARSET, AlipayConfig.ALIPAY_PUBLIC_KEY,AlipayConfig.SIGNTYPE);
		AlipayTradeRefundRequest alipay_request = new AlipayTradeRefundRequest();

		AlipayTradeRefundModel model=new AlipayTradeRefundModel();
		model.setOutTradeNo(out_trade_no);
		model.setTradeNo(trade_no);
		model.setRefundAmount(refund_amount);
		model.setRefundReason(refund_reason);
		model.setOutRequestNo(out_request_no);
		alipay_request.setBizModel(model);

		AlipayTradeRefundResponse alipay_response =client.execute(alipay_request);
	    return alipay_response.getBody();
	}
	/**
	 * 统一收单交易退款查询
	 * @param out_trade_no	商户订单号，和支付宝交易号二选一(商户订单号和支付宝交易号不能同时为空。 trade_no、  out_trade_no如果同时存在优先取trade_no)
	 * @param trade_no	支付宝交易号，和商户订单号二选一
	 * @param out_request_no	请求退款接口时，传入的退款请求号，如果在退款请求时未传入，则该值为创建交易时的外部交易号
	 * @return
	 * @throws AlipayApiException
	 */
	public static String AlipayTradeFastpayRefundQuery(String out_trade_no,String trade_no,String out_request_no) throws AlipayApiException{
		/**********************/
		// SDK 公共请求类，包含公共请求参数，以及封装了签名与验签，开发者无需关注签名与验签
		AlipayClient client = new DefaultAlipayClient(AlipayConfig.URL, AlipayConfig.APPID, AlipayConfig.RSA_PRIVATE_KEY, AlipayConfig.FORMAT, AlipayConfig.CHARSET, AlipayConfig.ALIPAY_PUBLIC_KEY,AlipayConfig.SIGNTYPE);
		AlipayTradeFastpayRefundQueryRequest alipay_request = new AlipayTradeFastpayRefundQueryRequest();

		AlipayTradeFastpayRefundQueryModel model=new AlipayTradeFastpayRefundQueryModel();
		model.setOutTradeNo(out_trade_no);
		model.setTradeNo(trade_no);
		model.setOutRequestNo(out_request_no);
		alipay_request.setBizModel(model);

		AlipayTradeFastpayRefundQueryResponse alipay_response=client.execute(alipay_request);
		return alipay_response.getBody();
	}
	/**
	 * 查询对账单下载地址
	 * @param bill_type	账单类型，商户通过接口或商户经开放平台授权后其所属服务商通过接口可以获取以下账单类型：trade、signcustomer；
	 * trade指商户基于支付宝交易收单的业务账单；signcustomer是指基于商户支付宝余额收入及支出等资金变动的帐务账单；
	 * @param bill_date	账单时间：日账单格式为yyyy-MM-dd，月账单格式为yyyy-MM。
	 * @return	账单下载地址
	 * @throws AlipayApiException
	 */
	public static String AlipayDataDataserviceBillDownloadurlQuery(String bill_type,String bill_date) throws AlipayApiException{

		/**********************/
		// SDK 公共请求类，包含公共请求参数，以及封装了签名与验签，开发者无需关注签名与验签
		 AlipayClient client = new DefaultAlipayClient(AlipayConfig.URL, AlipayConfig.APPID, AlipayConfig.RSA_PRIVATE_KEY, AlipayConfig.FORMAT, AlipayConfig.CHARSET, AlipayConfig.ALIPAY_PUBLIC_KEY,AlipayConfig.SIGNTYPE);
		AlipayDataDataserviceBillDownloadurlQueryRequest alipay_request = new AlipayDataDataserviceBillDownloadurlQueryRequest();

		AlipayDataDataserviceBillDownloadurlQueryModel model =new AlipayDataDataserviceBillDownloadurlQueryModel();
		model.setBillType(bill_type);
		model.setBillDate(bill_date);
	    alipay_request.setBizModel(model);

		AlipayDataDataserviceBillDownloadurlQueryResponse alipay_response = client.execute(alipay_request);
		return alipay_response.getBillDownloadUrl();
	}
}
