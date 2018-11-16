package spiderman.test;

public class AlipayDemoTest {
	/*****************电脑网站支付DEMO************************/
	/*public void doPost(HttpServletRequest httpRequest,
            HttpServletResponse httpResponse) throws ServletException, IOException {
		AlipayClient alipayClient = new DefaultAlipayClient("https://openapi.alipay.com/gateway.do", APP_ID, APP_PRIVATE_KEY, FORMAT, CHARSET, ALIPAY_PUBLIC_KEY, SIGN_TYPE); //获得初始化的AlipayClient
		AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();//创建API对应的request
		alipayRequest.setReturnUrl("http://domain.com/CallBack/return_url.jsp");
		alipayRequest.setNotifyUrl("http://domain.com/CallBack/notify_url.jsp");//在公共参数中设置回跳和通知地址
		alipayRequest.setBizContent("{" +
		"    \"out_trade_no\":\"20150320010101001\"," +
		"    \"product_code\":\"FAST_INSTANT_TRADE_PAY\"," +
		"    \"total_amount\":88.88," +
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
		httpResponse.setContentType("text/html;charset=" + CHARSET);
		httpResponse.getWriter().write(form);//直接将完整的表单html输出到页面
		httpResponse.getWriter().flush();
		httpResponse.getWriter().close();
	}*/
	
	
	
	/*****************App支付DEMO************************/
	/*//实例化客户端
	AlipayClient alipayClient = new DefaultAlipayClient("https://openapi.alipay.com/gateway.do", APP_ID, APP_PRIVATE_KEY, "json", CHARSET, ALIPAY_PUBLIC_KEY, "RSA2");
	//实例化具体API对应的request类,类名称和接口名称对应,当前调用接口名称：alipay.trade.app.pay
	AlipayTradeAppPayRequest request = new AlipayTradeAppPayRequest();
	//SDK已经封装掉了公共参数，这里只需要传入业务参数。以下方法为sdk的model入参方式(model和biz_content同时存在的情况下取biz_content)。
	AlipayTradeAppPayModel model = new AlipayTradeAppPayModel();
	model.setBody("我是测试数据");
	model.setSubject("App支付测试Java");
	model.setOutTradeNo(outtradeno);
	model.setTimeoutExpress("30m");
	model.setTotalAmount("0.01");
	model.setProductCode("QUICK_MSECURITY_PAY");
	request.setBizModel(model);
	request.setNotifyUrl("商户外网可以访问的异步地址");
	try {
	        //这里和普通的接口调用不同，使用的是sdkExecute
	        AlipayTradeAppPayResponse response = alipayClient.sdkExecute(request);
	        System.out.println(response.getBody());//就是orderString 可以直接给客户端请求，无需再做处理。
	    } catch (AlipayApiException e) {
	        e.printStackTrace();
	}*/
	
	
	/*****************单笔转账到支付宝账户接口DEMO************************/
	/*AlipayClient alipayClient = new DefaultAlipayClient("https://openapi.alipay.com/gateway.do","app_id","your private_key","json","GBK","alipay_public_key","RSA2");
	AlipayFundTransToaccountTransferRequest request = new AlipayFundTransToaccountTransferRequest();
	request.setBizContent("{" +
	"    \"out_biz_no\":\"3142321423432\"," +
	"    \"payee_type\":\"ALIPAY_LOGONID\"," +
	"    \"payee_account\":\"abc@sina.com\"," +
	"    \"amount\":\"12.23\"," +
	"    \"payer_show_name\":\"上海交通卡退款\"," +
	"    \"payee_real_name\":\"张三\"," +
	"    \"remark\":\"转账备注\"" +
	"  }");
	AlipayFundTransToaccountTransferResponse response = alipayClient.execute(request);
	if(response.isSuccess()){
	System.out.println("调用成功");
	} else {
	System.out.println("调用失败");
	}*/
	
	/*****************查询转账订单接口DEMO************************/
	/*AlipayClient alipayClient = new DefaultAlipayClient("https://openapi.alipay.com/gateway.do","app_id","your private_key","json","GBK","alipay_public_key","RSA2");
	AlipayFundTransOrderQueryRequest request = new AlipayFundTransOrderQueryRequest();
	request.setBizContent("{" +
	"    \"out_biz_no\":\"3142321423432\"," +
	"    \"order_id\":\"20160627110070001502260006780837\"" +
	"  }");
	AlipayFundTransOrderQueryResponse response = alipayClient.execute(request);
	if(response.isSuccess()){
	System.out.println("调用成功");
	} else {
	System.out.println("调用失败");
	}*/
}
