package spiderman.test;

import org.junit.Test;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayFundTransToaccountTransferRequest;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.alipay.api.response.AlipayFundTransToaccountTransferResponse;
import spiderman.alipay.config.AlipayConfig;

public class AlipayTest {
	
	@Test
	public void test1() throws AlipayApiException{
		AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.URL, AlipayConfig.APPID, AlipayConfig.RSA_PRIVATE_KEY,
				AlipayConfig.FORMAT, AlipayConfig.CHARSET, AlipayConfig.ALIPAY_PUBLIC_KEY, AlipayConfig.SIGNTYPE);
		
		AlipayFundTransToaccountTransferRequest request = new AlipayFundTransToaccountTransferRequest();
		request.setBizContent("{" +
		"    \"out_biz_no\":\"3142321423432\"," +
		"    \"payee_type\":\"ALIPAY_LOGONID\"," +
		"    \"payee_account\":\"qextwe6370@sandbox.com\"," +
		"    \"amount\":\"12.23\"," +
		"    \"payer_show_name\":\"上海交通卡退款\"," +
		"    \"payee_real_name\":\"沙箱环境\"," +
		"    \"remark\":\"转账备注\"," +
		"  }");
		AlipayFundTransToaccountTransferResponse response = alipayClient.execute(request);
		if(response.isSuccess()){
		System.out.println("调用成功");
		} else {
		System.out.println("调用失败");
		}
	}
	@Test
	public void test2(){
		AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.URL, AlipayConfig.APPID, AlipayConfig.RSA_PRIVATE_KEY,
				AlipayConfig.FORMAT, AlipayConfig.CHARSET, AlipayConfig.ALIPAY_PUBLIC_KEY, AlipayConfig.SIGNTYPE);
	    AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();//创建API对应的request
	    alipayRequest.setReturnUrl("http://domain.com/CallBack/return_url.jsp");
	    alipayRequest.setNotifyUrl("http://domain.com/CallBack/notify_url.jsp");//在公共参数中设置回跳和通知地址
	    alipayRequest.setBizContent("{" +
	        "    \"out_trade_no\":\"20150320010101001\"," +
	        "    \"product_code\":\"FAST_INSTANT_TRADE_PAY\"," +
	        "    \"total_amount\":0.01," +
	        "    \"subject\":\"Iphone6 16G\"," +
	        "    \"body\":\"Iphone6 16G\"," +
	        "    \"passback_params\":\"merchantBizType%3d3C%26merchantBizNo%3d2016010101111\"," +
	        "    \"extend_params\":{" +
	        "    \"sys_service_provider_id\":\"2088511833207846\"" +
	        "    }"+
	        "  }");//填充业务参数
	    String form="";
	    try {
	        form = alipayClient.pageExecute(alipayRequest).getBody(); //调用SDK生成表单
	    } catch (AlipayApiException e) {
	        e.printStackTrace();
	    }
	    System.out.println(form);
	}/*
	@Test
	public void test3() throws AlipayApiException{
		AlipayFundTransToaccountTransferResponse response=AlipayInterfaceInvokeUtil.AlipayFundTransToaccountTransfer("2017050002", "ALIPAY_LOGONID", "qextwe6370@sandbox.com", "12.23", "上海交通卡退款", "沙箱环境", "kk");
		if(response.isSuccess()){
			System.out.println("调用成功");
			} else {
			System.out.println("调用失败");
			}
	}*/
}
